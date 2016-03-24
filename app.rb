set :public_folder, File.dirname(__FILE__) + '/static'

get '/' do
  send_file File.expand_path('pages/index.html', settings.public_folder)
end
