# dart-daap-client
# Makefile


.ONESHELL:
PHONY: dartfmt test clean analyze check pipenv-install pub-install coveralls bumpversion release help
TRASH_DIRS ?= .dart_tool coverage
TRASH_FILES ?= .coverage pubspec.lock .packages
VERSION=`python -c "from yaml import load, Loader; config = load(open('pubspec.yaml'), Loader=Loader); print(config['version']);"`


dartfmt:
	dartfmt -w .;\


test:
	dart test $(TESTS) --coverage=coverage -r expanded;\


clean:
	for file in $(TRASH_FILES); do\
		find -iname $${file} -print0 | xargs -0 rm -rf;\
	done;\
	for dir in $(TRASH_DIRS); do\
		find -type d -name $${dir} -print0 | xargs -0 rm -rf;\
	done;\


analyze:
	dart analyze --no-fatal-warnings;\


check:
	pre-commit run --all-files;\


pipenv-install:
	pipenv install;\
	pipenv install --dev;\


pub-install:
	pub get;\


coveralls:
	coveralls;\


bumpversion:
	git tag -a $(VERSION) -m "v$(VERSION)";\


release:
	make clean && \
	make bumpversion && \
	git co master && \
	git merge dev && \
	git co dev && \
	git push --all && \
	git push --tags && \
	make clean;\


help:
	@echo "    help:"
	@echo "        Show this help."
	@echo "    dartfmt:"
	@echo "        Reformats all Dart files."
	@echo "    test:"
	@echo "        Run tests, can specify tests with 'TESTS' argument."
	@echo "    clean:"
	@echo "        Recursively delete useless autogenerated files and directories, directories and files lists can be overriden through 'TRASH_DIRS' and 'TRASH_FILES' variables."
	@echo "    analyze:"
	@echo "        Run dart analyze."
	@echo "    check:"
	@echo "        Perform some code checks."
	@echo "    pipenv-install:"
	@echo "        Install Python requirements."
	@echo "    pub-install:"
	@echo "        Install Dart requirements."
	@echo "    coveralls:"
	@echo "        Upload coverage report to Coveralls."
	@echo "    bumpversion:"
	@echo "        Tag current code revision with version."
	@echo "    release:"
	@echo "        Release code."
