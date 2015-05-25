var fs = require('fs'),
    path = require('path'),
    ext = "." + process.argv[3]
    allFiles = fs.readdir(process.argv[2], function function_name (err, list) {
      if (!err) {
        for (var i = 0; i < list.length; i++) {
          if (path.extname(list[i]) == ext) {
            console.log(list[i]);
          }
        }
      }
    });