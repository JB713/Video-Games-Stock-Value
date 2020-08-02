-- Regular queries for the created tables:

select count(*) from games_sales
select count(*) from game_platform
select count(*) from video_game
select count(*) from platform_catalog
select count(*) from stock_history
select count(*) from stock

-----------
-- Queries:
-----------

-- Video game and the ticker symbol of their platform company.
select v.game_name, s.ticker 
from video_game v, stock s, platform_catalog pc, game_platform gp
where
	v.id = gp.id_game and
	pc.id = gp.id_platform and
	s.company_name = pc.company_name

-- Sales by company.
select v.game_name, s.ticker 
from video_game v, stock s, platform_catalog pc, game_platform gp
where
	v.id = gp.id_game and
	pc.id = gp.id_platform and
	s.company_name = pc.company_name


