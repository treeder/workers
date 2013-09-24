var fs = require('fs');
var params = null;
var task_id = null;
var config = null;

process.argv.forEach(function(val, index, array) {
  if (val == "-payload") {
    params = JSON.parse(fs.readFileSync(process.argv[index + 1], 'utf8'));
  }

  if (val == "-config") {
    config = JSON.parse(fs.readFileSync(process.argv[index + 1], 'utf8'));
  }

  if (val == "-id") {
    task_id = process.argv[index + 1];
  }
});

exports.params = params;
exports.config = config;
exports.task_id = task_id;
