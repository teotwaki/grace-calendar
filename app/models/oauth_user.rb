require_rel '../helpers/db'
require_rel '../models/user'

module Grace
  module Models
    class OauthUser < Sequel::Model
      plugin :validation_helpers

      def validate
        super

        validates_presence [:provider, :id, :user]
      end

      many_to_one :user

      class << self
        def from_google profile
          oauth_user = OauthUser.where(provider: 'google', id: profile['sub']).first

          if oauth_user.nil?
            user = User.from_google profile
            oauth_user = OauthUser.new

            oauth_user.provider = 'google'
            oauth_user.id = profile['sub']
            oauth_user.user = user
            oauth_user.save
          end

          oauth_user
        end
      end
    end
  end
end
