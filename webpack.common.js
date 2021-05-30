const { WebpackManifestPlugin } = require('webpack-manifest-plugin');
const MiniCssExtractPlugin = require('mini-css-extract-plugin');

const path = require('path');

module.exports = {
  entry: {
    wanderer: path.resolve(__dirname, './assets/wanderer.js'),
    suit: path.resolve(__dirname, './assets/suit.css'),
  },
  output: {
    path: path.resolve(__dirname, 'public/assets'),
    publicPath: '/assets/'
  },
  module: {
    rules: [
      {
        test: /\.(js)$/,
        exclude: /node_modules/,
        use: ['babel-loader']
      },
      {
        test: /\.css$/i,
        use: [
          MiniCssExtractPlugin.loader,
          "css-loader",
          {
            loader: "postcss-loader",
            options: {
              postcssOptions: {
                plugins: [
                  [
                    "postcss-preset-env",
                    {
                      // Options
                    },
                  ],
                ],
              },
            },
          },
        ],
      }
    ]
  },
  resolve: {
    extensions: ['*', '.js']
  },
  plugins: [
    new MiniCssExtractPlugin({
      filename: '[name].css',
    }),
    new WebpackManifestPlugin({})
  ]
}
