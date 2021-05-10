const { WebpackManifestPlugin } = require('webpack-manifest-plugin');

const path = require('path');

module.exports = {
  entry: {
    wanderer: './assets/wanderer.js'
  },
  output: {
    filename: '[name]-[contenthash].js',
    path: path.resolve(__dirname, 'public/assets'),
    publicPath: '/assets/'
  },
  plugins: [
    new WebpackManifestPlugin({})
  ]
}
