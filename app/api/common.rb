module GraceApi
  module Api
    class Common < Sinatra::Base
      helpers Sinatra::Param

      before do
        # we almost always want a JSON output
        content_type :json, 'charset' => 'utf-8'

        # Parse common params
        param :page, Integer, default: 1
        param :per_page, Integer, default: 20
      end

      private
      def parse_request
        request.body.rewind
        JSON.parse request.body.read
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
end

