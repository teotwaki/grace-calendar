set :public_folder, File.dirname(__FILE__) + '/static'

get '/' do
  'Hello world!'
end
