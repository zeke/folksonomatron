# set :run, false
# set :public, './public'
# set :views, './views'
# set :environment, :production
# run Sinatra::Application

require 'rubygems'
require 'bundler'

Bundler.require

require './app'

configure :development do
  enable :logging, :dump_errors, :raise_errors  
end

run Sinatra::Application
# run MySinatraApp