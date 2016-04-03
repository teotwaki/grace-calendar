module GraceApi
  class App < Api::Common
    helpers Sinatra::Param

    set :static, true
    set :public_folder, 'static'

    use Rack::Deflater
    use Api::Auth

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

    private
      def get_days
        day = Date.today
        (0..6).collect { |x| day + x }
      end
  end
end
