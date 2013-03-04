dm-status
=========

[![Build Status](https://secure.travis-ci.org/mbj/dm-status.png?branch=master)](http://travis-ci.org/mbj/dm-status)
[![Dependency Status](https://gemnasium.com/mbj/dm-status.png)](https://gemnasium.com/mbj/dm-status)
[![Code Climate](https://codeclimate.com/github/mbj/dm-status.png)](https://codeclimate.com/github/mbj/dm-status)

A small status site for datamappper 2. It is backed by some experiments for a web application toolchain.

* [request](https://github.com/mbj/request)
* [response](https://github.com/mbj/response)
* [joy](https://github.com/mbj/joy)
* [assets](https://github.com/mbj/assets)
* [html](https://github.com/mbj/html)

Running dm-status
-----------------

```
# Checkout the repo
git clone https://github.com/mbj/dm-status
cd dm-status
bundle install
bundle exec ruby run.rb
```

And steer a browser to `localhost:3000` the port and bind IP is currently not configurable.

Credits
-------

* [Markus Schirp (mbj)](https://github.com/mbj) Author

Contributing
-------------

* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a
  future version unintentionally.
* Commit, do not mess with Rakefile or version
  (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.

License
-------

This gem is published under the MIT license. See LICENSE file.
