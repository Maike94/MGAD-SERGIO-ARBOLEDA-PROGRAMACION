SELECT 
	t.date, 
	SUM(t.confirmed),
	sum(t.deaths),
	sum(t.recovered)
	FROM timeseries t  
	WHERE t.id IN (
			SELECT l.id
			FROM location l
			WHERE l.iso_alpha_2 = "CO")
	GROUP BY t.date 
	ORDER BY t.date ASC ;