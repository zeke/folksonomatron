# %w{rubygems sinatra hpricot mechanize}.each {|lib| require lib}

get '/' do
  haml :index
end

# Take POSTed form and turn it into a clean GET url..
post '/mungepost' do
  redirect "/munge/#{params[:url]}" 
end

get '/munge/*' do
  agent = WWW::Mechanize.new
  @url = params[:splat]
  page = agent.get "http://del.icio.us/url/check?show=notes_only&url=#{@url}"
  doc = Hpricot(page.parser.to_s)
  @tags = (doc/"a.showTag").map {|a| a.attributes['href'].split("/").last }
  haml :munge
end

get '/stylesheets/stylesheet.css' do
  content_type 'text/css', :charset => 'utf-8'
  sass :stylesheet
end