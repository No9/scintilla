var spawn = require('child_process').spawn;
var test = require('tap').test;
var path = require('path');

var s = path.join(__dirname, '..','scintilla')
 
test('test usgage info', function(t){
   t.plan(1) 
   var test_cp1 = spawn(s, [])
   var test_output = '';
   
   test_cp1.stderr.on('data', function(data){
        var isOK = false
        if(data.toString().indexOf("Usage") == 1){
           isOK = true
        } 
        t.ok(isOK, "Message as expected")
      })
   
   test_cp1.stdout.on('data', console.log)
})
