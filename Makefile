
SHELL = /bin/sh
.SUFFIXES:
.SUFFIXES: .coffee .js

### Requires
#
# + coffee
#    this command will compile coffeescript into javascript.
#    to install, type `npm install -g coffee-script`
#
# + mocha
#    feature-rich JavaScript test framework running on Node.js and the browser.
#    to install, type `npm install -g mocha`

### Commands
#
# + test
#    launch mocha to test test/*.js
#    requires: mocha
#
# + js
#    compile coffee into js
#    requires: coffee
#
# + watch-coffee
#    watch the files for changes and automatically compile it
#    requires: coffee
#

.PHONY: test js watch-coffee watch-coffee-in-background

TEST_REPORTER ?= spec

test:
	@mocha \
		--reporter $(TEST_REPORTER) \
		--growl test/*.js


COFFEE_DIR  := ./coffee
JS_DIR      := ./js

js:
	coffee --compile --output $(JS_DIR) $(COFFEE_DIR)

watch-coffee:
	coffee --output $(JS_DIR) --compile --watch $(COFFEE_DIR)
