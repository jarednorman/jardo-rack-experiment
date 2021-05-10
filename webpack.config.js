const { WebpackManifestPlugin } = require('webpack-manifest-plugin');

const path = require('path');

module.exports = {
  entry: './assets/wanderer.js',
  output: {
    filename: 'wanderer.js',
    path: path.resolve(__dirname, 'public/assets'),
    publicPath: '/assets/'
  },
  plugins: [
    new WebpackManifestPlugin({
    })
  ]
}
