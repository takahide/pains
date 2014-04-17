require 'rubygems'
require 'sinatra'
require 'active_record'
require 'mysql2'
require 'haml'

set :environment, :production
set :port, 80

ActiveRecord::Base.configurations = YAML.load_file('config/database.yml')
ActiveRecord::Base.establish_connection('pains_dev')

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
