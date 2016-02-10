
SHELL = /bin/sh
.SUFFIXES:
.SUFFIXES: .coffee .js

### Requires
#
# + coffee
#    this command will compile coffeescript into javascript.
#    to install, type `npm install -g coffee-script`

### Commands
#
# + js
#    compile coffee into js
#    requires: coffee
#
# + watch-coffee
#    watch the files for changes and automatically compile it
#    requires: coffee
#

.PHONY: js watch-coffee

COFFEE_DIR  := ./coffee
JS_DIR      := ./js

js:
	coffee --compile --output $(JS_DIR) $(COFFEE_DIR)

watch-coffee:
	coffee --output $(JS_DIR) --compile --watch $(COFFEE_DIR)
