# dart-daap-client
# Makefile


.ONESHELL:
PHONY: dartfmt test coverage help


dartfmt:
	dartfmt -w .;\


test:
	pub run test $(TESTS);\


coverage:
	pub run test_coverage && genhtml -o coverage coverage/lcov.info;\


help:
	@echo "    help:"
	@echo "        Show this help."
	@echo "    dartfmt:"
	@echo "        Reformats all Dart files."
	@echo "    test:"
	@echo "        Run tests, can specify tests with 'TESTS' argument."
	@echo "    coverage:"
	@echo "        Collect coverage information from tests."
