# dart-daap-client
# Makefile


.ONESHELL:
PHONY: dartfmt test help


dartfmt:
	dartfmt -w .;\


test:
	pub run test $(TESTS);\


help:
	@echo "    help:"
	@echo "        Show this help."
	@echo "    dartfmt:"
	@echo "        Reformats all Dart files."
	@echo "    test:"
	@echo "        Run tests, can specify tests with 'TESTS' argument."
