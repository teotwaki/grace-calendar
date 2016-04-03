module GraceApi
  module Api
    class Posts < Common
      get '/api/posts' do
        dataset = Models::Post.reverse_order(:created_at).paginate(params[:page], params[:per_page])

        {
          posts: dataset.all,
          pagination: {
            last_page: dataset.last_page?
          }
        }.to_json
      end
    end
  end
end
