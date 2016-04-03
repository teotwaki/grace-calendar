module GraceApi
  class App < Api::Common
    set :static, true
    set :public_folder, 'static'

    use Rack::Deflater
    use Api::Auth
    use Api::Users

    get '/' do
      # in this case, it shouldn't be JSON
      content_type :html, 'charset' => 'utf-8'
      send_file File.expand_path('pages/index.html', settings.public_folder)
    end

    get '/api/coming-days' do
      get_days.collect do |day|
        {
          date: day,
          services: [
            {
              type: 'breakfast',
              help_needed: true,
            },
            {
              type: 'dinner',
              help_needed: true
            },
            {
              type: 'night',
              help_needed: true
            },
          ]
        }
      end.to_json
    end

    get '/api/posts' do
      dataset = Models::Post.reverse_order(:created_at).paginate(params[:page], params[:per_page])

      {
        posts: dataset.all,
        pagination: {
          last_page: dataset.last_page?
        }
      }.to_json
    end

    private
      def get_days
        day = Date.today
        (0..6).collect { |x| day + x }
      end
  end
end
