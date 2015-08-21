# CUMULUS

The Soaring Book web backend.

![](https://travis-ci.org/soaringbook/cumulus.svg)
[![Code Climate](https://codeclimate.com/github/soaringbook/cumulus/badges/gpa.svg)](https://codeclimate.com/github/soaringbook/cumulus)
[![Test Coverage](https://codeclimate.com/github/soaringbook/cumulus/badges/coverage.svg)](https://codeclimate.com/github/soaringbook/cumulus/coverage)


## BOOTSTRAP

Setup the application by running the `./scripts/bootstrap` command in the project root.

## ENV

Copy the `.env.sample` to `.env` in order to use the correct environment variables. Replace the variables with your desired values.

    cp .env.sample .env

## SERVER

Use [Pow](http://pow.cx) to serve the application, or you just start the server with the `rails s` command. 

## TESTING

You can run the tests like this:

    $ rspec

Use guard to run your tests automagically during development.

    $ guard

## LICENSE

The MIT License (MIT)

Copyright (c) 2015 Jelle Vandebeeck

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
