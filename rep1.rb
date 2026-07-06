require "net/http"
require "json"
require "uri"

body = Net::HTTP.get(URI("https://jsonplaceholder.typicode.com/todos"))
posts = JSON.parse(body)


#Side notes:
#Ruby            SQL
#.select   →     WHERE      (keep the rows that match)
#.map      →     SELECT     (pick or transform a value from each row)
#.sort_by  →     ORDER BY   (reorder the rows)
#.group_by →     GROUP BY   (bucket the rows by some key)
#.each     >        

#posts.select { |row|  row["userId"]  == 1 }

#SELECT title FROM todos WHERE userId = 2
#posts.select {|row| row["userId"] == 2}
#	.map {|row| }
#	.each {|title| puts title}

# lookup 1: todos summarized by userId
todo_tally = Hash.new(0)
todos.each { |t| todo_tally[t["userId"]] += 1 }

# lookup 2: posts summarized by userId
post_tally = Hash.new(0)
posts.each { |p| post_tally[p["userId"]] += 1 }

# main loop: walk users, look each side up by id
users.each do |user|
  id = user["id"]
  puts "#{user["name"]}: #{todo_tally[id]} todos, #{post_tally[id]} posts"
end



