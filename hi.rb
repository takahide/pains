require 'rubygems'
require 'sinatra'
require 'active_record'
require 'mysql2'
require 'haml'

configure :development do
  require 'sinatra/reloader'
  register Sinatra::Reloader
end

configure :production do
  set :port, 80
end

ActiveRecord::Base.configurations = YAML.load_file('config/database.yml')

ActiveRecord::Base.establish_connection('local_dev') if development?
ActiveRecord::Base.establish_connection('pains_dev') if production?

class Test < ActiveRecord::Base
end

get '/hi' do
end

get '/' do
	content_type :html, :charset => 'utf-8'
        test = Test.find(1)
        
	@str = test.test
	haml :index
end
