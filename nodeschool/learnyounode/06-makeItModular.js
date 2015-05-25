var myFirstModule = require('./myFirstModule.js'),
    files;

myFirstModule(process.argv[2], process.argv[3], function(err, data){
  if (err) {
    console.log('An error happened when reading ' + process.argv[2]);
    return err;
  }

  data.forEach(function(fileName){
    console.log(fileName);
  });
});

