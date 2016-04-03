module GraceApi
  class App < Sinatra::Base
    helpers Sinatra::Param

    set :static, true
    set :public_folder, 'static'

    use Rack::Deflater

    before do
      # we almost always want a JSON output
      content_type :json, 'charset' => 'utf-8'

      # Parse common params
      param :page, Integer, default: 1
      param :per_page, Integer, default: 20
    end

    get '/' do
      # in this case, it shouldn't be JSON
      content_type :html, 'charset' => 'utf-8'
      send_file File.expand_path('pages/index.html', settings.public_folder)
    end

    get '/api/coming-days' do
      get_days.collect do |day|
        {
          date: day,
          services: [
            {
              type: 'breakfast',
              help_needed: true,
            },
            {
              type: 'dinner',
              help_needed: true
            },
            {
              type: 'night',
              help_needed: true
            },
          ]
        }
      end.to_json
    end

    get '/api/posts' do
      dataset = Models::Post.reverse_order(:created_at).paginate(params[:page], params[:per_page])

      {
        posts: dataset.all,
        pagination: {
          last_page: dataset.last_page?
        }
      }.to_json
    end

    get '/api/users' do
      require_admin!

      param :filter_unapproved, Boolean

      filters = {}
      filters[:is_approved] = false if params[:filter_unapproved]

      dataset = Models::User.where(filters).reverse_order(:id).paginate(params[:page], params[:per_page])

      {
        users: dataset.all,
        pagination: {
          last_page: dataset.last_page?
        }
      }.to_json
    end

    get '/api/users/:id' do
      require_admin!

      param :id, Integer, required: true

      Models::User.where(id: params[:id]).first.to_json
    end

    put '/api/users/:id' do
      require_admin!

      param :id, Integer, required: true

      data = parse_request
      u = Models::User.where(id: params[:id]).first

      u.first_name = data['first_name']
      u.last_name = data['last_name']
      u.phone_number = data['phone_number']
      u.is_admin = data['is_admin']
      u.is_approved = data['is_approved']

      u.save

      {status: 'ok'}.to_json
    end

    post '/auth/google' do
      auth_data = parse_request

      response = google_client.get_access_token(auth_data)
      deny! 500, "Not authorized" if response.has_key? 'error'

      profile = google_client.get_profile(response['access_token'])
      deny! 500, "Not authorized" if profile.has_key? 'error'

      oauth_user = Models::OauthUser.from_google profile
      user = oauth_user.user

      payload = {
        id: user.id,
        isAdmin: user.is_admin,
        isApproved: user.is_approved,
        hasValidPhoneNumber: !user.phone_number.nil?
      }

      { token: Helpers::WebToken.encode(payload) }.to_json
    end

    post '/auth/facebook' do
      auth_data = parse_request
    end

    private
      def get_days
        day = Date.today
        (0..6).collect { |x| day + x }
      end

      def parse_request
        request.body.rewind
        JSON.parse request.body.read
      end

      def google_client
        @google_client ||= OAuth::GoogleAPIClient.new
      end

      def authorize!
        auth_header = request.env.fetch('HTTP_AUTHORIZATION', nil)
        deny! 403, "Not authorized" if auth_header.nil?
        bearer, token = auth_header.split(' ')
        deny! 403, "Not authorized" if bearer != 'Bearer' or token.nil?
        @token = Helpers::WebToken.decode(token)
        deny! 403, "Not authorized" if @token.nil?
        @token = @token[0]
      end

      def require_admin!
        authorize!
        deny! 403, "Not authorized" if !@token['isAdmin']
      end

      def deny!(code, reason)
        halt code, { error: reason }.to_json
      end
  end
end
