# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)



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
