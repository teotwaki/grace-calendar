class WebToken
  class << self
    def encode(payload)
      JWT.encode payload, ENV.fetch('JWT_HMAC_SECRET'), 'HS256'
    end

    def decode(token)
      JWT.decode token, ENV.fetch('JWT_HMAC_SECRET'), 'HS256'
    end
  end
end
