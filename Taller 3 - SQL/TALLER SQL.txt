SELECT a.ArtistId , COUNT(*) 
	FROM artists a ;

--Tenemos 275 artistas--

SELECT *
	FROM albums alb
	INNER JOIN artists art on  alb.ArtistId = art.ArtistId 
	WHERE alb.Title = "Voodoo Lounge";

--THE ROLLING STONES--

SELECT *
	FROM artists art
	INNER JOIN albums alb on  art.ArtistId = alb.ArtistId 
	WHERE art.Name = "Ozzy Osbourne";

-- Bark at the Moon (Remastered)
-- Blizzard of Ozz 
--	Diary of a Madman (Remastered)
--	No More Tears (Remastered)
--	Tribute
--	Speak of the Devil


SELECT Name, Milliseconds 
	FROM tracks tra
	ORDER BY Milliseconds DESC 
	LIMIT 3;
	
--	Name                       |Milliseconds|
---------------------------+------------+
--Occupation / Precipice     |     5286953|
--Through a Looking Glass    |     5088838|
--Greetings from Earth, Pt. 1|     2960293|


SELECT gen.Name , SUM(tra.Bytes) AS suma_total_bytes
	FROM tracks tra
	INNER JOIN genres gen on tra.GenreId = gen.GenreId 
	GROUP BY gen.GenreId 
	ORDER BY suma_total_bytes ASC 
	LIMIT 3;

--Name         |suma_total_bytes|
-------------+----------------+
--Opera        |         2.861.468|
--Rock And Roll|        25.479.147|
--Bossa Nova   |       108.585.855|
	

SELECT gen.Name , COUNT(tra.Name) as numero_canciones 
	FROM genres gen
	INNER JOIN tracks tra on gen.GenreId = tra.GenreId 
	GROUP BY gen.GenreId 
	ORDER BY numero_canciones DESC 
	LIMIT 3;

-- Name |numero_canciones|
-----+----------------+
--Rock |            1297|
--Latin|             579|
--Metal|             374|



SELECT art.Name, COUNT(tra.Name) AS total_canciones_artista
FROM artists art
INNER JOIN albums alb ON art.ArtistId = alb.ArtistId
INNER JOIN tracks tra ON alb.AlbumId = tra.AlbumId
GROUP BY art.Name
ORDER BY total_canciones_artista DESC
LIMIT 12;

--Name           |total_canciones_artista|
---------------+-----------------------+
--Iron Maiden    |                    213|
--U2             |                    135|
--Led Zeppelin   |                    114|
--Metallica      |                    112|
--Lost           |                     92|
--Deep Purple    |                     92|
--Pearl Jam      |                     67|
--Lenny Kravitz  |                     57|
--Various Artists|                     56|
--The Office     |                     53|
--Van Halen      |                     52|
	


SELECT emp.EmployeeId , emp.FirstName , emp.LastName , emp.Title, SUM(iin.Quantity) as total_facturas 
	FROM invoice_items iin
	INNER JOIN invoices inv on iin.InvoiceId = inv.InvoiceId 
	INNER JOIN customers cus on inv.CustomerId = cus.CustomerId 
	INNER JOIN employees emp on cus.SupportRepId = emp.EmployeeId 
	GROUP BY emp.EmployeeId 
	ORDER BY total_facturas DESC ;
	

--EmployeeId|FirstName|LastName|Title              |total_facturas|
------------+---------+--------+-------------------+--------------+
--         3|Jane     |Peacock |Sales Support Agent|           796|
--         4|Margaret |Park    |Sales Support Agent|           760|
--         5|Steve    |Johnson |Sales Support Agent|           684|


SELECT tra.Name , COUNT(tra.Name) AS Cancion_q_mas_repite 
	FROM playlists pla
	INNER JOIN playlist_track ptr on pla.PlaylistId = ptr.PlaylistId 
	INNER JOIN tracks tra on ptr.TrackId = tra.TrackId 
	GROUP BY tra.Name 
	ORDER BY Cancion_q_mas_repite DESC 
	LIMIT 7;
	
--Name                   |Cancion_q_mas_repite|
-----------------------+--------------------+
--2 Minutes To Midnight  |                  13|
--Wrathchild             |                  12|
--The Trooper            |                  12|
--The Number Of The Beast|                  12|
--Iron Maiden            |                  12|
--Hallowed Be Thy Name   |                  12|
--Fear Of The Dark       |                  11|