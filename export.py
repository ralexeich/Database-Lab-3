import cx_Oracle
import csv
import io
username = 'ralexeich'
password = '123456789'
database = 'localhost:1521/xe'
connection = cx_Oracle.connect(username,password, database)

cursor = connection.cursor()

cursor.execute("""
SELECT 
charts.charts_place,
charts.track_name,
track.artist
FROM
charts
JOIN track ON charts.track_name=track.track_name""")

with io.open('text1.csv', "w", newline='', encoding='utf-8') as csv_file:
        writer = csv.writer(csv_file, delimiter=',')
        for row in cursor:
            string = ','.join(map(str, row))
            writer.writerow(string.split(","))

cursor.close()
