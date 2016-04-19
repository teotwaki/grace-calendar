require_rel '../helpers/db'
require_rel '../helpers/global_phone'
require_rel '../models/user'

module Grace
  module Models
    class User < Sequel::Model
      plugin :validation_helpers

      def validate
        super

        validates_presence [:first_name, :last_name, :email_address]
        validates_format /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i, :email_address, message: 'is not a valid address'
        errors.add(:phone_number, 'is not a valid phone number') unless phone_number.nil? || GlobalPhone.validate(phone_number, :dk)
      end

      def to_json(options = nil)
        {
          id: id,
          first_name: first_name,
          last_name: last_name,
          email_address: email_address,
          is_approved: is_approved,
          is_admin: is_admin
        }.to_json(options)
      end

      one_to_many :oauth_users
      one_to_many :posts
      one_to_many :shift_registrations, key: :volunteer_id
      one_to_many :shift_approvals, class: :ShiftRegistration, key: :admin_id

      class << self
        def from_google profile
          user = User.where(email_address: profile['email']).first

          if user.nil?
            user = User.new
            user.first_name = profile['given_name']
            user.last_name = profile['family_name']
            user.email_address = profile['email']
            user.save
          end

          user
        end
      end
    end
  end
end
