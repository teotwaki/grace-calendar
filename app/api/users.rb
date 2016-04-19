require_rel 'common'
require_rel '../models/user'

module Grace
  module Api
    class Users < Common
      helpers do
        def validate_fields!(data)
          fields = data.keys.sort
          valid_fields = ['first_name', 'last_name', 'is_admin',
                          'is_approved'].sort
          if fields != valid_fields
            delta = valid_fields - fields
            unless delta.empty?
              deny! 400, "Missing fields: `#{delta.join '`, `'}`"
            end
          end
        end
      end

      get '/api/users' do
        require_admin!

        param :filter_unapproved, Boolean

        filters = {}
        filters[:is_approved] = false if params[:filter_unapproved]

        dataset = Models::User
          .where(filters)
          .reverse_order(:id)
          .paginate(params[:page], params[:per_page])

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

        u = Models::User.where(id: params[:id]).first
        deny! 404, 'User not found' if u.nil?

        u.to_json
      end

      put '/api/users/:id' do
        require_admin!

        param :id, Integer, required: true

        u = Models::User.where(id: params[:id]).first
        deny! 404, 'User not found' if u.nil?

        data = parse_request
        validate_fields! data

        u.first_name = data['first_name']
        u.last_name = data['last_name']
        unless data['phone_number'].nil? || data['phone_number'].empty?
          u.phone_number = data['phone_number']
        end
        u.is_admin = data['is_admin']
        u.is_approved = data['is_approved']

        deny! 400, "Object validation failed: #{u.errors}" unless u.valid?

        u.save

        {status: 'ok'}.to_json
      end
    end
  end
end
