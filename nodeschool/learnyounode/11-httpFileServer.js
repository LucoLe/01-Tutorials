var http = require('http'),
    fs = require('fs');

var src = fs.createReadStream(process.argv[3], 'utf8');

var server = http.createServer(function (req, res) {
  src.pipe(res)
});
server.listen(process.argv[2]);