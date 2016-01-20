
SHELL = /bin/sh
.SUFFIXES:
.SUFFIXES: .coffee .js

### Commands
#
# + test
#    launch mocha to test test/*.js
#    requires: mocha
#      feature-rich JavaScript test framework running on Node.js and the browser.
#      to install, type `npm install -g mocha`
#

REPORTER ?= spec

test:
	@mocha \
		--reporter $(REPORTER) \
		--growl test/*.js

.PHONY: test
