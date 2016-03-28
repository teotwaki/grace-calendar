module GraceApi
  class GoogleAPIClient
    include HTTParty

    def get_access_token(auth_data)
      do_post('https://accounts.google.com/o/oauth2/token',
              create_params_from(auth_data))
    end

    def get_profile(access_token)
      do_get('https://www.googleapis.com/plus/v1/people/me/openIdConnect',
             access_token)
    end

    private
      def do_post(uri, params)
        JSON.parse self.class.post(uri, body: params, headers: default_headers).body
      end

      def do_get(uri, access_token)
        JSON.parse self.class.get(uri, headers: headers_from(access_token)).body
      end

      def headers_from(access_token)
        { 'Authorization' => "Bearer #{access_token}" }
      end

      def default_headers
        {
          'Content-Type' => 'application/x-www-form-urlencoded',
          'Accept' => 'application/json'
        }
      end

      def create_params_from(auth_data)
        {
          code: auth_data['code'],
          client_id: auth_data['clientId'],
          client_secret: ENV['GOOGLE_CLIENT_SECRET'],
          redirect_uri: auth_data['redirectUri'],
          grant_type: 'authorization_code'
        }
      end
  end

  class App < Sinatra::Base
    helpers Sinatra::Param

    set :static, true
    set :root, File.expand_path('../..', __FILE__)
    set :public_folder, 'static'

    before do
      # we almost always want a JSON output
      content_type :json, 'charset' => 'utf-8'
    end

    get '/' do
      # in this case, it shouldn't be JSON
      content_type :html, 'charset' => 'utf-8'
      send_file File.expand_path('../static/pages/index.html', settings.public_folder)
    end

    get '/api/coming-days.json' do
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

    post '/auth/google' do
      auth_data = parse_request

      response = google_client.get_access_token(auth_data)
      halt 500, "Not authorized\n" if response.has_key? 'error'

      profile = google_client.get_profile(response['access_token'])
      halt 500, "Not authorized\n" if profile.has_key? 'error'

      oauth_user = OauthUser.from_google profile
      user = oauth_user.user

      payload = {
        id: user.id,
        isAdmin: user.admin,
        approved: user.approved,
        phoneProvided: !user.phone_number.nil?
      }

      { token: WebToken.encode(payload) }.to_json
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
        @google_client ||= GoogleAPIClient.new
      end
  end
end
