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
function removeLine(file, alias) {
  let data = fs.readFileSync(file, 'utf8');
  data = data.split('\n');
  let result = '';
  data.forEach(element => {
    if (element.split('=')[0] !== ('alias ' + alias) && element !== '') {
      result += (element + '\n');
    }
  });
  fs.writeFileSync(file, result);
}
const input = parseArgs(process.argv);
if (input.p) {
  if (!fs.existsSync('/usr/bin/backpack')) {
    fs.mkdirSync('/usr/bin/backpack');
  }
  const alias = 'alias ' + input.p + '="/usr/bin/backpack/' + input.p + '"';
  fs.copyFileSync(input.p, '/usr/bin/backpack/' + input.p);
  fs.appendFileSync('/etc/bash.bashrc', '\n' + alias);
  removeLine('/etc/bash.bashrc', 'sudo');
  fs.appendFileSync('/etc/bash.bashrc', '\nalias sudo="sudo "');
  console.log('Package ' + input.p + ' installed');
}
if (input.r) {
  removeLine('/etc/bash.bashrc', input.r);
  fs.unlink('/usr/bin/backpack/' + input.r, (err) => {
    if (err) throw err;
    console.log('Package ' + input.r + ' deleted');
  });
}
