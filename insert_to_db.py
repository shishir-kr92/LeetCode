import mysql.connector
# import boto3
mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  password="1234",
  database="myDB"
)

cur = mydb.cursor()

table  = "Activities"
datas = [[1, "Eating"], [2, "Singing"], [3, "Horse Riding"]]
for data in datas:
    sql = f"insert into {table} values {tuple(data)};"
    print(sql)
    cur.execute(sql)
mydb.commit()

print(f" {len(datas)} data inserted")

