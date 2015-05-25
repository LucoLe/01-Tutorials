var fs = require('fs'),
    buf = fs.readFileSync(process.argv[2]),
    newLines;

newLines = buf.toString().split('\n').length - 1;
console.log(newLines);
