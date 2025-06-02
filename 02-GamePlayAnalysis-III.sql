select player_id, event_date, sum(games_played) 
over (PARTITION BY player_id ORDER BY event_date) 
as games_played_so_far from activity

-- this will not work if we do not have order by event_date because the sum will be 
-- calculated for all rows in the partition, it will return each row with full sum (12 for player_id 1)


-- using subquery
select a1.player_id, a1.event_date, 
       (select sum(a2.games_played) 
        from activity a2 
        where a2.player_id = a1.player_id 
          and a2.event_date <= a1.event_date) as games_played_so_far
from activity a1

-- subquery is not efficient, it will be executed for each row in the outer query
-- so it takes O(n^2) time complexity, it will take 1st row then goes to the subquery 
-- and match the player_id and event_date and run the sum