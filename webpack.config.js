const { WebpackManifestPlugin } = require('webpack-manifest-plugin');

const path = require('path');

module.exports = {
  entry: {
    wanderer: path.resolve(__dirname, './assets/wanderer.js')
  },
  output: {
    filename: '[name]-[contenthash].js',
    path: path.resolve(__dirname, 'public/assets'),
    publicPath: '/assets/'
  },
  module: {
    rules: [
      {
        test: /\.(js)$/,
        exclude: /node_modules/,
        use: ['babel-loader']
      }
    ]
  },
  resolve: {
    extensions: ['*', '.js']
  },
  plugins: [
    new WebpackManifestPlugin({})
  ]
}
