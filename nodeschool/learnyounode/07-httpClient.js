var http = require('http'),
    link = process.argv[2];

http.get(link, function(res){
  res.setEncoding('utf8');
  res.on('data', function(data) {
    console.log(data);
  });
});