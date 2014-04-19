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

#ActiveRecord::Base.configurations = YAML.load_file('config/database.yml')
#ActiveRecord::Base.establish_connection('local_dev') if development?
#ActiveRecord::Base.establish_connection('pains_dev') if production?

#class Test < ActiveRecord::Base
#end

get '/' do
  haml :index
end

get '/page1.html' do
  content_type :html, :charset => 'utf-8'
#  test = Test.find(1)
#  @str = test.test
  haml :page1
end

get %r{^/(.*)\.html$} do
  haml :"#{ params[:captures].first }"
end

get '/css/style.css' do
  scss :'scss/style'
end

get '/js/app.js' do
  coffee :'coffee/app'
end

