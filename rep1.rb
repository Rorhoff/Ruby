require "net/http"
require "json"
require "uri"

body = Net::HTTP.get(URI("https://jsonplaceholder.typicode.com/posts"))
posts = JSON.parse(body)

posts.select { |post| post["userId"] == 1 }
     .each { |post| puts post["title"] }