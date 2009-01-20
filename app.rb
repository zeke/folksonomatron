# %w{rubygems sinatra hpricot mechanize}.each {|lib| require lib}

get '/' do
  agent = WWW::Mechanize.new
  page = agent.get "http://del.icio.us/url/check?show=notes_only&url=#{params[:url]}"
  doc = Hpricot(page.parser.to_s)
  tags = (doc/"a.showTag").map {|a| a.attributes['href'].split("/").last }
  tags.join(", ")
end
