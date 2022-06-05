# Devos: Theme

based on [go-gitea/theme](https://github.com/go-gitea/theme)


## Install

You need an existing [Hugo](https://github.com/spf13/hugo) website, than you can
just download our prebuilt [theme](https://dl.gitea.io/theme/master.tar.gz), put
it into your `themes/gitea` folder and enable the theme with the
`theme = "gitea"` option of your website.

## Development

We choose [npm](https://npmjs.org) to fetch our dependencies and
[gulp](https://gulpjs.com/) for the pipeline. We won't cover the installation of
nodejs or npm, for that you can find enough guides depending on your operating
system. First of all you have to install the required dependencies:

```
npm install
```

After you have successfully installed the required dependencies you should be
able to use these commands to just clean and build generated sources of the
theme:

```
npm run clean
npm run build
npm run release
```

If you want to do more development on the theme we suggest to use the `watch`
task we have defined to get the changes directly built after saving changes to
a file:

```
npm run watch
```

## License

This project is under the Apache-2.0 License. See the [LICENSE](LICENSE) file
for the full license text.
