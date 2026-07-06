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

tally = Hash.new(0) #creates new array to story tally's in.
posts.each do |row| # walks each row.
 tally[row["userId"]] += 1 if row["completed"] # tally each row by user id and +1 if the row = completed.
end # why do we gotta end here?
tally.each { |user_id, count| puts "User #{user_id}: #{count} completed" } # grabs the user id, count and puts them on display


