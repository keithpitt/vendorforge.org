# vendorforge.org [![Build Status](https://secure.travis-ci.org/keithpitt/vendorforge.org.png)](http://travis-ci.org/keithpitt/vendorforge.org)

A site that allows you to publish and share iOS libraries created with the vendor gem. For more information, see: https://github.com/keithpitt/vendor

## Install

The vendorforge has been built to work with Ruby 1.9.2. I have not tried to run it under any version of Ruby.

```bash
$ git clone git://github.com/keithpitt/vendorforge.org.git
$ bundle
$ rake db:setup
```

## Development

While writing specs:

```bash
$ guard
````

To run the application:

```bash
$ foreman start
```

## Note on Patches/Pull Requests

1. Fork the project.
2. Make your feature addition or bug fix.
3. Add tests for it. This is important so I don't break it in a future version unintentionally.
4. Commit, do not mess with rakefile, version, or history. (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)
5. Send me a pull request. Bonus points for topic branches.

## Licence

Copyright &copy; 2011 Keith Pitt

MIT License

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
