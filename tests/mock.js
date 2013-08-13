var level = require('level')

var db = level('tests/.db')

setInterval(function(){

  db.put('name',  "FTW", function(err) {
    if(err) return console.log(err)
       console.log("put") 
       db.get('name', function (err) {
          if(err) return console.log(err)      
          console.log("get")
          db.del('name', function(err) {
            if(err) return console.log(err)
              console.log("del") 
          })   
       })
  })

}, 2000)
