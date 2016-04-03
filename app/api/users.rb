module GraceApi
  module Api
    class Users < Common
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
    end
  end
end
