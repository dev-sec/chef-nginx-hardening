# nginx-hardening (Chef cookbook)

[![Supermarket](http://img.shields.io/cookbook/v/nginx-hardening.svg)][1] [![Build Status](http://img.shields.io/travis/dev-sec/chef-nginx-hardening.svg)][2] [![Code Coverage](http://img.shields.io/coveralls/dev-sec/chef-nginx-hardening.svg)][3] [![Dependencies](http://img.shields.io/gemnasium/dev-sec/chef-nginx-hardening.svg)][4] [![Gitter Chat](https://badges.gitter.im/Join%20Chat.svg)][5]

## Description

This cookbook provides a secure overlay for nginx configuration.

## Requirements

- Chef 12+

### Platform

- Debian 7, 8
- Ubuntu 14.04, 16.04
- CentOS 6, 7
- OracleLinux 6.6, 6.7, 7.1

## Attributes

- `['nginx']['client_body_buffer_size']` - `1k` Sets buffer size for reading client request body. In case the request body is larger than the buffer, the whole body or only its part is written to a temporary file.
- `['nginx']['default_site_enabled']` - `false` to disable the default site. Set to `on` to enable the default site in nginx.
- `['nginx']['client_max_body_size']` - `1k` to set the maximum allowed size of the client request body, specified in the "Content-Length" request header field. If the size in a request exceeds the configured value, the 413 (Request Entity Too Large) error is returned to the client.
- `['nginx']['keepalive_timeout']` - `5 5` The first parameter sets a timeout during which a keep-alive client connection will stay open on the server side. The zero value disables keep-alive client connections. The optional second parameter sets a value in the "Keep-Alive: timeout=time" response header field.
- `['nginx']['server_tokens']` - `off` to disable disables emitting nginx version in error messages and in the "Server" response header field. Set to `on` to enable the nginx version in error messages and "Server" response header.
- `['nginx-hardening']['source']['http_autoindex_module']` - `false` to disable the HTTP Autoindex module. Set to `true` to enable http_autoindex_module.
- `['nginx-hardening']['source']['http_ssi_module']` - `false` to disable the HTTP SSI module. Set to `true` to enable http_ssi_module.
- `['nginx-hardening']['options']['ssl_protocols']` - `'TLSv1.2'` to specify the SSL protocol which should be used.
- `['nginx-hardening']['options']['ssl_ciphers']` - `'ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-CHACHA20-POLY1305:ECDHE-RSA-CHACHA20-POLY1305:ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES256-SHA384:ECDHE-RSA-AES256-SHA384:ECDHE-ECDSA-AES128-SHA256:ECDHE-RSA-AES128-SHA256'` to specify the TLS ciphers which should be used.
- `['nginx-hardening']['options']['ssl_prefer_server_ciphers']` - `'on'` Specifies that server ciphers should be preferred over client ciphers when using the TLS protocols. Set to `false` to disable it.
- `['nginx-hardening']['dh-size']` - `2048` Specifies the length of DH parameters for EDH ciphers.

You can also use the complete attributes from the [nginx cookbook](https://supermarket.chef.io/cookbooks/nginx)

## Usage

Add the recipes to the run_list:

```
"recipe[apt]"
"recipe[nginx-hardening::upgrades]"
"recipe[nginx]"
"recipe[nginx-hardening]"
```

Configure attributes:

```
"nginx-hardening" : {
  "dh-size" : "4096"
}
```

## Local Testing

For local testing you can use vagrant or docker to run tests locally. You will have to install VirtualBox and Vagrant or docker on your system. See [Vagrant Downloads](http://downloads.vagrantup.com/) for a vagrant or [Docker Downloads](https://docs.docker.com/mac/) package suitable for your system. For all our tests we use `test-kitchen`. If you are not familiar with `test-kitchen` please have a look at [their guide](http://kitchen.ci/docs/getting-started).

```bash
# Install dependencies
gem install bundler
bundle install

# Do lint checks
bundle exec rake lint

# fast test on one machine
bundle exec kitchen test default-ubuntu-1404

# test on all machines
bundle exec kitchen test

# for development
bundle exec kitchen create default-ubuntu-1404
bundle exec kitchen converge default-ubuntu-1404
bundle exec kitchen verify default-ubuntu-1404
```

## Contributors + Kudos

- Dominik Richter [arlimus](https://github.com/arlimus)
- Christoph Hartmann [chris-rock](https://github.com/chris-rock)
- Patrick Muench [atomic111](https://github.com/atomic111)
- Edmund Haselwanter [ehaselwanter](https://github.com/ehaselwanter)

## Contributing

See [contributor guideline](CONTRIBUTING.md).

## License and Author

- Author:: Dominik Richter [dominik.richter@googlemail.com](mailto:dominik.richter@googlemail.com)
- Author:: Deutsche Telekom AG


```
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```

[1]: https://supermarket.getchef.com/cookbooks/nginx-hardening
[2]: https://travis-ci.org/dev-sec/chef-nginx-hardening
[3]: https://coveralls.io/r/dev-sec/chef-nginx-hardening
[4]: https://gemnasium.com/dev-sec/chef-nginx-hardening
[5]: https://gitter.im/dev-sec/general
