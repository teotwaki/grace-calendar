require 'sinatra'
require 'require_all'

require_all 'app/api'

module Grace
  class App < Sinatra::Base
    # Automatically serve static content if no match
    set :static, true
    set :public_folder, 'static'

    # Automagically compress output
    use Rack::Deflater

    # Mount the different parts of the API
    use Api::Auth
    use Api::Users
    use Api::Posts
    use Api::ComingDays

    # Serve the main page when requested
    get '/' do
      content_type :html, 'charset' => 'utf-8'
      send_file File.expand_path('pages/index.html', settings.public_folder)
    end
  end
end
