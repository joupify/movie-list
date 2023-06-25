# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


#     Movie.create(title: "Wonder Woman 1984", overview: "Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s", poster_url: "https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg", rating: 6.9)
#     Movie.create(title: "The Shawshank Redemption", overview: "Framed in the 1940s for double murder, upstanding banker Andy Dufresne begins a new life at the Shawshank prison", poster_url: "https://image.tmdb.org/t/p/original/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg", rating: 8.7)
#      Movie.create(title: "Titanic", overview: "101-year-old Rose DeWitt Bukater tells the story of her life aboard the Titanic.", poster_url: "https://image.tmdb.org/t/p/original/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg", rating: 7.9)
#     Movie.create(title: "Ocean's Eight", overview: "Debbie Ocean, a criminal mastermind, gathers a crew of female thieves to pull off the heist of the century.", poster_url: "https://image.tmdb.org/t/p/original/MvYpKlpFukTivnlBhizGbkAe3v.jpg", rating: 7.0)

require 'open-uri'
require 'json'

puts "Cleaning up database..."
Movie.destroy_all
puts "Database cleaned"

# Fetch movie data from the API
url = 'http://tmdb.lewagon.com/movie/top_rated'
movies_json = URI.open(url).read
movies_data = JSON.parse(movies_json)

# Retrieve the base URL from the /configuration API
config_url = 'http://tmdb.lewagon.com/configuration'
config_json = URI.open(config_url).read
config_data = JSON.parse(config_json)
base_url = config_data['images']['base_url']

# Iterate over the movie data and create movie records
  movies_data['results'].each do |movie_data|
  # Extract relevant attributes from movie_data
  title = movie_data['title']
  overview = movie_data['overview']
  poster_path = movie_data['poster_path']

  # Construct the full image URL
  poster_url = "#{base_url}w500#{poster_path}"

  # Create a new movie record in the database
  Movie.create(title: title, overview: overview, poster_url: poster_url)
end
puts "Movies created"
