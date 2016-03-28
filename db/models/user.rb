class User < Sequel::Model
  plugin :validation_helpers

  def validate
    super

    validates_presence [:first_name, :last_name, :email, :phone_number]
    validates_format /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i, :email, message: 'is not a valid address'
    errors.add(:phone_number, 'is not a valid phone number') unless GlobalPhone.validate(phone_number, :dk)
  end

  one_to_many :oauth_users
end
