var http = require('http'),
    link = process.argv[2],
    dataString = '';

http.get(link, function(res){
  res.setEncoding('utf8');
  res.on('data', function(data) {
    dataString += data;
  });
  res.on('error', console.error);
  res.on('end', function() {
    console.log(dataString.length);
    console.log(dataString);
  });
});