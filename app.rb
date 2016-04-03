module Grace
  class App < Api::Common
    set :static, true
    set :public_folder, 'static'

    use Rack::Deflater
    use Api::Auth
    use Api::Users
    use Api::Posts
    use Api::ComingDays

    get '/' do
      # in this case, it shouldn't be JSON
      content_type :html, 'charset' => 'utf-8'
      send_file File.expand_path('pages/index.html', settings.public_folder)
    end
  end
end
