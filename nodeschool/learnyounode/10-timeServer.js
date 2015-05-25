var net = require('net'),
    port = process.argv[2];

function zeroFill(i) {
  return (i < 10 ? '0' : '') + i
};

var dateString = function(){
  var d = new Date(),
      dateStr = '';

  dateStr = d.getFullYear() + '-'
        + zeroFill(d.getMonth() + 1) + '-'
        + zeroFill(d.getDate()) + ' '
        + zeroFill(d.getHours()) + ':'
        + zeroFill(d.getMinutes());

  return dateStr;
};

// console.log(dateString())

var server = net.createServer(function (socket) {
  socket.end(dateString() + '\n');
});
server.listen(port);