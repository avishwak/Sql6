-- Problem 3 : Shortest Distance in a Plane		(https://leetcode.com/problems/shortest-distance-in-a-plane/)

select round(min(sqrt(pow(p1.x-p2.x,2) + pow(p1.y-p2.y,2))),2) as 'shortest' 
from point2D p1
inner join point2D p2
on (p1.x < p2.x OR (p1.x = p2.x AND p1.y < p2.y))
-- to my understanding: forward comparing, make p1x < p2x then include this
-- p1x = p2x, then compare y — include only if p1y < p2y

select round(min(sqrt(pow(p1.x-p2.x,2) + pow(p1.y-p2.y,2))),2) as 'shortest' 
from point2D p1
inner join point2D p2
on (p1.x, p1.y) < (p2.x, p2.y)
-- doesn't run on MySQL?!