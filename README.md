# nas.js

Not Another Spinner (nas.js) is a decent loading animation done with jquery.transit and CSS3.

## Usage

nas.js requires:

* jQuery
* jquery.transit

```javascript
var nas = new Nas("selector")
nas.start()
nas.stop()
```

## Development

The files are compiled with Grunt.

```shell
# Compile LESS
$ grunt less
# Compile CoffeeScript
$ grunt coffee
# Minify JavaScript
$ grunt uglify
```
