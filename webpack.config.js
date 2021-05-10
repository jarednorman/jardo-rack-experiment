const path = require('path');

module.exports = {
  entry: './assets/wanderer.js',
  output: {
    filename: 'wanderer.js',
    path: path.resolve(__dirname, 'public/assets')
  }
}
