# Contributing

* [Fork it](https://github.com/vint21h/dart-daap-client/fork/)
* Install [GNU Make](https://www.gnu.org/software/make/)
* Install and configure [pyenv](https://github.com/pyenv/pyenv/) and [pyenv-virtualenv plugin](https://github.com/pyenv/pyenv-virtualenv/)
* Install and configure [direnv](https://github.com/direnv/direnv/)
* Create environment config from example

```console
cp .env.example .env
```

* Install development dependencies:

```console
make install
```

* Create your fix/feature branch:

```console
git checkout -b my-new-fix-or-feature
```

* Check code style and moreover:

```console
make check
```

* Run tests:

```console
make test -B
```

* Push to the branch:

```console
git push origin my-new-fix-or-feature
```

* [Create a new Pull Request](https://github.com/vint21h/dart-daap-client/compare/)
