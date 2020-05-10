require 'net/http'


news_api_key = ENV["NEWS_API_KEY_ID"]
uri1 = URI.parse("http://newsapi.org/v2/top-headlines?country=jp&apiKey=#{news_api_key}")
json1= Net::HTTP.get(uri1)
article_to_rb = JSON.parse(json1)
articles = article_to_rb["articles"]
articles.each do |data|
  Article.create(title: data["title"], description: data["description"], url: data["url"], urlToImage: data["urlToImage"], publishedAt:data["publishedAt"])
end