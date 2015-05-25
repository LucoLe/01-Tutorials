var fs = require('fs'),
    path = require('path');

module.exports = function (dirName, fileExt, callback) {
  var filteredFiles = [];

  fs.readdir(dirName, function(err, data){
    if (err) {
      return callback(err);
    }

    data.forEach(function (file){
      if (path.extname(file) === '.' + fileExt) {
        filteredFiles.push(file);
      }
    });

    callback(null, filteredFiles);
  });
};