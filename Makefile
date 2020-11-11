# daap-client
# Makefile


.ONESHELL:
PHONY: dartfmt help


dartfmt:
	dartfmt -w .


help:
	@echo "    help:"
	@echo "        Show this help."
	@echo "    dartfmt:"
	@echo "        Reformats all Dart files."
