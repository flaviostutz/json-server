"use strict"

const fs = require('fs')

const collections = process.env.COLLECTIONS.split(",")

const file = '/db.json'

if(collections.length>0) {
    var dbobj = {}
    var any = false
    if (fs.existsSync(file)) {
        console.log("Adding to existing /db.json contents")
        var data = fs.readFileSync(file);
        dbobj = JSON.parse(data)
    }

    for(var i=0; i<collections.length; i++) {
        var c = collections[i].trim()
        if(c.length>0) {
            console.log("Adding collection '"+ c +"'")
            dbobj[c] = []
            any = true
        }
    }

    if(any) {
        console.log("Saving /db.json...")
        fs.writeFileSync(file, JSON.stringify(dbobj))
    }
}
