get '/' do
  haml :index
end

# Take POSTed form and turn it into a clean GET url..
post '/mungepost' do
  redirect "/munge/#{params[:url]}" 
end

get '/munge/*' do
  content_type :json
  agent = WWW::Mechanize.new
  @url = params[:splat].last
  
https://api.del.icio.us/v1/posts/
  
  https://api.del.icio.us/v1/posts/
  delicious_url = "http://del.icio.us/url/check?show=notes_only&url=#{@url}"
  page = agent.get(delicious_url)
  
  # page.inspect
  doc = Hpricot(page.parser.to_s)
  
  # doc.to_yaml
  
  @tags = (doc/"a.showTag").map {|a| a.attributes['href'].split("/").last }
  @tags.to_json
end

get '/stylesheets/stylesheet.css' do
  content_type 'text/css', :charset => 'utf-8'
  sass :stylesheet
end