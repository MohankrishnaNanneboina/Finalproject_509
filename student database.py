# -*- coding: utf-8 -*-
"""mkrishna.ipynb

Automatically generated by Colaboratory.

Original file is located at
    https://colab.research.google.com/drive/10vCWBP45EfUiry5pRAz8TrTPsXFud-BD
"""

import sqlite3

connection = sqlite3.connect(":memory:")

cursor = connection.cursor()

sql_file = open("student.sql")
sql_as_string = sql_file.read()
cursor.executescript(sql_as_string)

for row in cursor.execute("SELECT * FROM teacher"):
    print(row)

