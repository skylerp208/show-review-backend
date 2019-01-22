require 'rest-client'

Show.delete_all

ActiveRecord::Base.connection.tables.each do |t|
  ActiveRecord::Base.connection.reset_pk_sequence!(t)
end

n = 0
while n <= 2
 response = RestClient.get("http://api.tvmaze.com/shows?page=#{n}")
 response_hash = JSON.parse(response)
 response_hash.each do |show|
   if (show["name"] || show["genres"] || show["summary"] ||   show["image"]["medium"])
   Show.create( title: show["name"], description: show["summary"], genre: show["genres"].join(", "), image: show["image"]["medium"])
    end
 end
 n = n + 1
end


#
# response = RestClient.get("http://api.tvmaze.com/shows")
# response_hash = JSON.parse(response)
# response_hash.each do |show|
#   Show.create( title: show["name"], description: show["summary"], genre: show["genres"].join(", "), image: show["image"]["medium"])
# end
