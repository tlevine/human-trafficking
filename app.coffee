#!/usr/bin/env coffee

fs = require 'fs'

restify = require 'restify'
# http://mcavage.github.com/node-restify/

sqlite3 = require 'sqlite3'
# https://github.com/developmentseed/node-sqlite3/wiki/API

node_static = require 'node-static'
# https://github.com/cloudhead/node-static

server = restify.createServer()
server.use (restify.bodyParser { mapParams: false })

server.get '/', (req, res, next) ->
    res.send 200, '''
    <html>
        <head>
        </head>
        <body>
            <form method="post" action="/import">
                <textarea name="phone_numbers" width="100%" height="90%" placeholder="Paste phone numbers here."></textarea>
            </form>
        </body>
    </html>
    '''
    next()

server.post '/import', (req, res, next) ->
    phone_numbers = (req.body.phone_numbers.replace(/[^0-9]+/g, ' ').split ' ')
    sql = "INSERT INTO kidphone (phone) VALUES (#{number});"
    phone_numbers.map (number) -> sql
    db = new sqlite3.Database 'trafficking.db'
    db.run sql, (err) ->
        res.send 204
        next()

server.get '/', (req, res, next) ->
    fs.readFile 'traffic.csv', (err, data) ->
        res.setHeader 'content-type', 'text/csv'
        res.send data
        next()

server.listen 1420
