CREATE view charts_view AS
SELECT DISTINCT
 track.track_duration,
 track.artist,
 charts.charts_place,
 charts.popularity
FROM
 charts
JOIN track ON track.track_name=charts.track_name;
