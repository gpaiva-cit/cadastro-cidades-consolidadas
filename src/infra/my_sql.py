import mysql.connector

class MySQL:
	def __init__(self):
		self.con = mysql.connector.connect(
			user='root', 
			password='root', 
			host='localhost', 
			database='Cidades_Consolidadas'
		)

		self.cursor = self.con.cursor()

	def close(self):
			self.cursor.close()
			self.con.close()