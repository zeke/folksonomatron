# %w{rubygems sinatra hpricot mechanize}.each {|lib| require lib}

get '/' do
  haml :index
end

get '/munge/*' do
  agent = WWW::Mechanize.new
  page = agent.get "http://del.icio.us/url/check?show=notes_only&url=#{params[:splat]}"
  doc = Hpricot(page.parser.to_s)
  @tags = (doc/"a.showTag").map {|a| a.attributes['href'].split("/").last }
  haml :munge
end

get '/stylesheets/stylesheet.css' do
  content_type 'text/css', :charset => 'utf-8'
  sass :stylesheet
end