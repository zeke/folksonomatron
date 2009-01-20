%w{rubygems sinatra hpricot mechanize}.each {|lib| require lib}

disable :run

require 'app'

run Sinatra.application