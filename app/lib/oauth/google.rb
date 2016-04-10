require 'httparty'

module Grace
  module OAuth
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
  end
end
