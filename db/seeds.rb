require 'rest-client'
# Show.delete_all
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# response = RestClient.get('http://api.tvmaze.com/shows')
# response_hash = JSON.parse(response)
#
response_hash.each do |show|
  Show.create( title: show["name"], description: show["summary"], genre: show["genres"].join(", "), image: show["image"]["medium"])
end
