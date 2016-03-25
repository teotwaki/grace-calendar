module GraceApi
  class App < Sinatra::Base
    helpers Sinatra::Param

    set :static, true
    set :root, File.expand_path('../..', __FILE__)
    set :public_folder, 'static'

    before do
      # we almost always want a JSON output
      content_type :json, 'charset' => 'utf-8'
    end

    get '/' do
      # in this case, it shouldn't be JSON
      content_type :html, 'charset' => 'utf-8'
      send_file File.expand_path('../static/pages/index.html', settings.public_folder)
    end

    get '/coming-days.json' do
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

    private
      def get_days
        day = Date.today
        (0..6).collect { |x| day + x }
      end
  end
end
