-- Problem 1 : Game Play Analysis II	(https://leetcode.com/problems/game-play-analysis-ii/)

select player_id, device_id 
from 
(select player_id, device_id, min(event_date) from activity group by player_id) as a