
PREFIX ?= /usr/local

install: bin/deploy
	@cp -p $< $(PREFIX)/$<

uninstall:
	rm -f $(PREFIX)/bin/deploy

.PHONY: install uninstall