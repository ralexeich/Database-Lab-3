import csv
import cx_Oracle
username = 'ralexeich'
password = '123456789'
database = 'localhost:1521/xe'
connection = cx_Oracle.connect(username,password, database)
cursor = connection.cursor()




csv_file="spotify.csv"


with open(csv_file, newline='') as file:
    reader = csv.DictReader(file)
    i=1

    try:
        for row in reader:
            track_name = row['track_name']
            artist = row['artist_name']
            track_duration = row['duration_ms']
            

            insert = """ INSERT INTO track ( track_name, artist, track_duration)
                values (:track_name, :artist_name, :track_duration)"""
            cursor.execute(insert, track_name=track_name, artist_name=artist, track_duration=track_duration)
            


            i += 1

    except:
        print(f"Error in line: {i}")
        raise

connection.commit()
cursor.close()
