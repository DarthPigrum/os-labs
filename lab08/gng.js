'use strict';
const fs = require('fs');
function isFlag(str) {
  if (str[0] === '-') return true;
}
function parseArgs(argv) {
  const result = {};
  const args = argv.slice();
  for (let i = 0; i < args.length; i++) {
    if (isFlag(args[i])) {
      if (args[i + 1] !== undefined && !isFlag(args[i + 1])) {
        result[args[i][1]] = args[i + 1];
      } else {
        result[args[i][1]] = true;
      }
    }
  }
  return result;
}
const input = parseArgs(process.argv);
let exp = 'true';
let ext = 'if(true){console.log(line)}';
let file = '';
if (input.e && input.s && typeof input.s === 'string') {
  ext = fs.readFileSync(input.s, 'utf-8');
} else if (input.i && input.s && typeof input.s === 'string') {
  exp = fs.readFileSync(input.s, 'utf-8');
} else if (input.e && !input.s) ext = input.e;
else if (input.i && !input.s) exp = input.i;
if (input.f && typeof input.f === 'string') {
  file = fs.readFileSync(input.f, 'utf8');
}
const lines = file.split('\n');
if (input.i) {
  lines.forEach(line => {
    const last = line.length - 1;
    eval('if(' + exp + ')console.log(line)');
  });
} else if (input.e) {
  lines.forEach(line => {
    const last = line.length - 1;
    eval(ext);
  });
}
