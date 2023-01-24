## Contributing

1. [Fork it](https://github.com/vint21h/dart-daap-client/)
2. Install [GNU Make](https://www.gnu.org/software/make/)
3. Install and configure [pyenv](https://github.com/pyenv/pyenv/) and [pyenv-virtualenv plugin](https://github.com/pyenv/pyenv-virtualenv/)
4. Install and configure [direnv](https://github.com/direnv/direnv/)
5. Create environment config from example
```console
cp .env.example .env
```
6. Install development dependencies:
```console
make install
```
7. Create your fix/feature branch:
```console
git checkout -b my-new-fix-or-feature
```
8. Check code style and moreover:
```console
make check
```
9. Run tests:
```console
make test -B
```
10. Push to the branch:
```console
git push origin my-new-fix-or-feature
```
11. [Create a new Pull Request](https://github.com/vint21h/dart-daap-client/compare/)
