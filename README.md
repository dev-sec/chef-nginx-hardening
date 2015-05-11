# nginx-hardening (Chef cookbook)

[![Supermarket](http://img.shields.io/cookbook/v/nginx-hardening.svg)][1]
[![Build Status](http://img.shields.io/travis/hardening-io/chef-nginx-hardening.svg)][2]
[![Code Coverage](http://img.shields.io/coveralls/hardening-io/chef-nginx-hardening.svg)][3]
[![Dependencies](http://img.shields.io/gemnasium/hardening-io/chef-nginx-hardening.svg)][4]
[![Gitter Chat](https://badges.gitter.im/Join%20Chat.svg)][5]

## Description

This cookbook provides a secure overlay for nginx configuration.

## Requirements

* Opscode chef

## Attributes

... wip ...

## Usage

... wip ...

## FAQ / Pitfalls

... wip ...


## Tests

```bash
# Install dependencies
gem install bundler
bundle install

# Do lint checks
bundle exec rake lint

# Fetch tests
bundle exec thor kitchen:fetch-remote-tests

# fast test on one machine
bundle exec kitchen test default-ubuntu-1204

# test on all machines
bundle exec kitchen test

# for development
bundle exec kitchen create default-ubuntu-1204
bundle exec kitchen converge default-ubuntu-1204
```

## Contributors + Kudos

* Dominik Richter
* Christoph Hartmann
* Patrick Meier
* Edmund Haselwanter

## Contributing

See [contributor guideline](CONTRIBUTING.md).

## License and Author

* Author:: Dominik Richter <dominik.richter@googlemail.com>
* Author:: Deutsche Telekom AG

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

[1]: https://supermarket.getchef.com/cookbooks/nginx-hardening
[2]: http://travis-ci.org/hardening-io/chef-nginx-hardening
[3]: https://coveralls.io/r/hardening-io/chef-nginx-hardening
[4]: https://gemnasium.com/hardening-io/chef-nginx-hardening
[5]: https://gitter.im/hardening-io/general
