require_rel 'common'
require_rel '../lib/oauth/google'
require_rel '../helpers/jwt'
require_rel '../models/oauth_user'

module Grace
  module Api
    class Auth < Common
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
        def google_client
          @google_client ||= OAuth::GoogleAPIClient.new
        end
    end
  end
end
