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
  end
end
