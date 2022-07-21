require "json"
require "rest-client"

Movie.create(title: "Wonder Woman 1984", overview: "Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s", poster_url: "https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg", rating: 6.9)
Movie.create(title: "The Shawshank Redemption", overview: "Framed in the 1940s for double murder, upstanding banker Andy Dufresne begins a new life at the Shawshank prison", poster_url: "https://image.tmdb.org/t/p/original/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg", rating: 8.7)
Movie.create(title: "Titanic", overview: "101-year-old Rose DeWitt Bukater tells the story of her life aboard the Titanic.", poster_url: "https://image.tmdb.org/t/p/original/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg", rating: 7.9)
Movie.create(title: "Ocean's Eight", overview: "Debbie Ocean, a criminal mastermind, gathers a crew of female thieves to pull off the heist of the century.", poster_url: "https://image.tmdb.org/t/p/original/MvYpKlpFukTivnlBhizGbkAe3v.jpg", rating: 7.0)

# TODO: Write a seed to insert 10 posts in the database fetched from the Hacker News API.
# url = "https://hacker-news.firebaseio.com/v0/topstories.json"

# def store_url(id)
#   "https://hacker-news.firebaseio.com/v0/item/#{id}.json"
# end

# post = JSON.parse(RestClient.get(url))

# post.take(10).each do |id|
#   hacker_news_post = JSON.parse(RestClient.get(store_url(id)))
#   post = Post.new(title: hacker_news_post["title"],
#                   url: hacker_news_post["url"],
#                   votes: hacker_news_post["votes"])
#   post.save
#   puts "#{post.title} - #{post.url} - #{post.votes}"
# end

url = "https://tmdb.lewagon.com/movie/top_rated"

def store_url(id)
  "https://tmdb.lewagon.com/movie/top_rated/#{id}"
end

movies = JSON.parse(RestClient.get(url))['results']

movies.take(30).each do |movie_data|
  movie = Movie.new(title: movie_data["title"],
                  overview: movie_data["overview"],
                  poster_url: "https://image.tmdb.org/t/p/original#{
                  movie_data["poster_path"]}",
                  rating: movie_data["vote_average"]
                )
  movie.save
  puts "#{movie.title}- #{movie.rating}"
end
