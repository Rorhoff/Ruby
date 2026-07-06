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


