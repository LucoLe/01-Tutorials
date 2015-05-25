var http = require('http'),
    url = require('url');

var server = http.createServer(function (req, res){
  if (req.method == 'GET') {
    var urlObj = url.parse(req.url, true),
        date = new Date(urlObj.query.iso);
    if (urlObj.pathname == '/api/parsetime') {
      res.writeHead(200, { 'Content-Type': 'application/json' })
      return res.end(JSON.stringify({hour: date.getHours(), minute: date.getMinutes(), second: date.getSeconds()}))
    }
    if (urlObj.pathname == '/api/unixtime') {
      res.writeHead(200, { 'Content-Type': 'application/json' })
      return res.end(JSON.stringify({unixtime: date.getTime()}))
    }
  }
});
server.listen(process.argv[2]);
