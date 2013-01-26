#!/usr/bin/env coffee

fs = require 'fs'

express = require 'express'

sqlite3 = require 'sqlite3'
# https://github.com/developmentseed/node-sqlite3/wiki/API

server = express()
server.use(express.bodyParser())

server.get '/', (req, res) ->
  res.setHeader 'content-type', 'text/html'
  res.send '''
  <html>
      <head>
      </head>
      <body>
          <form method="post" action="/import">
              <textarea name="phone_numbers" style="width: 100%; height: 90%;" placeholder="Paste phone numbers here."></textarea>
              <input type="submit" name="submit" value="Submit" />
          </form>
      </body>
  </html>
  '''

server.post '/import', (req, res) ->
  phone_numbers = (req.body.phone_numbers.replace(/[^0-9]+/g, ' ').split ' ')
  schema = '''
  DROP TABLE IF EXISTS kidphone;
  CREATE TABLE kidphone ( phone TEXT NOT NULL );
  '''
  sql = 'BEGIN TRANSACTION;' + schema + (phone_numbers.map (number) -> "INSERT INTO kidphone (phone) VALUES (#{number});").join('') + 'COMMIT;'
  db = new sqlite3.Database 'trafficking.db'
  db.exec sql, (err) ->
    res.send err

server.get '/traffic.csv', (req, res) ->
  fs.readFile 'traffic.csv', (err, data) ->
    res.setHeader 'content-type', 'text/csv'
    res.send data

server.listen 1420
