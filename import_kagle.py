import cx_Oracle
import csv
import io
username = 'ralexeich'
password = '123456789'
database = 'localhost:1521/xe'
connection = cx_Oracle.connect(username,password, database)
cursor = connection.cursor()

cursor.execute("delete from charts")
cursor.execute("delete from track")
cursor.execute("delete from region")


csv_file = "spotify.csv"

csv_file = io.open('spotify.csv', encoding='utf-8', errors='ignore')
reader = csv.reader(csv_file, delimiter=',')

track_name_unique = []
artist_unique = []
region_name_unique = []

for row in reader:
    artist = row[1]
    track_name = row[2]
    track_duration = row[5]
    charts_place = row[0]
    popularity = row[4]
    region_name = row[17]
    if track_name not in track_name_unique:
            if region_name not in region_name_unique:
                region_name_unique.append(region_name)
                query2 = """insert into region(region_name) values (:region_name)"""
                cursor.execute(query2, region_name=region_name)
    if track_name not in track_name_unique:
        track_name_unique.append(track_name)
        query = """insert into track(artist, track_name, track_duration) values (:artist, :track_name, :track_duration)"""
        cursor.execute(query, artist=artist, track_name=track_name, track_duration=track_duration)
        query1 = """insert into charts(charts_place, track_name, popularity, region_name) values (:charts_place, :track_name, :popularity, :region_name)"""
        cursor.execute(query1, charts_place=charts_place, track_name=track_name, popularity=popularity, region_name=region_name)


connection.commit()
cursor.close()
connection.close()
csv_file.close()
