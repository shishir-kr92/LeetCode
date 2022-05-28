import mysql.connector
# import boto3
mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  password="1234",
  database="myDB"
)

cur = mydb.cursor()

table  = "RequestAccepted"
datas = [[1,2,"2016/06/03"],[1,3,"2016/06/08"],[2,3,"2016/06/08"],[3,4,"2016/06/09"]]
for data in datas:
    sql = f"insert into {table} values {tuple(data)};"
    print(sql)
    cur.execute(sql)
mydb.commit()

print(f" {len(datas)} data inserted")

