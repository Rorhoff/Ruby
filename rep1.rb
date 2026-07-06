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

# --- piece 1: todos and the tally ---
todos_body = Net::HTTP.get(URI("https://jsonplaceholder.typicode.com/todos"))
todos = JSON.parse(todos_body)

tally = Hash.new(0)
todos.each do |row|
  tally[row["userId"]] += 1 if row["completed"]
end

# --- piece 2: fetch the users ---
users_body = Net::HTTP.get(URI("https://jsonplaceholder.typicode.com/users"))
users = JSON.parse(users_body)

# --- piece 3: join and print ---
users.each do |user|
  count = tally[user["id"]]
  puts "#{user["name"]}: #{count} completed"
end


TEST

