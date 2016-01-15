
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
#
# + watch-coffee
#    watch the files for changes and automatically compile it
#
# + watch-coffee-in-background
#    watch the files in background
#    Note: this process cannot be killed while your computer is running.
#

COFFEE_DIR  := .
COFFEE_FILE := $(wildcard *.coffee)
JS_DIR      := ../js
JS_FILE     := $(patsubst %.coffee, %.js, $(COFFEE_FILE))

.PHONY: js watch-coffee watch-coffee-in-background

js:
	coffee --compile --output $(JS_DIR) $(COFFEE_DIR)

watch-coffee:
	coffee --output $(JS_DIR) --compile --watch $(COFFEE_DIR)

watch-coffee-in-background:
	coffee --output $(JS_DIR) --compile --watch $(COFFEE_DIR) &>/dev/null &
