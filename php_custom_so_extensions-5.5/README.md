## Custom .so extensions for IronWorker php workers

Clone directory and upload this sample worker. that's all.
Note: example is brewed for stack 'php-5.5'

### How to add new .so extension
* Download/build desired extension
* Copy .so to modules directory
* Register extension in `php.ini`, e.g. `extension = oauth.so`



### How to build .so extension directly on IronWorker server

* Prepare remote builder

builder.worker:
```ruby
name 'php-builder'
stack 'php-5.5'
runtime 'php'
exec 'build.sh'
file 'build.sh'
build 'sh ./build.sh'

# Archive with extension
file 'oauth-1.2.3.tgz'
```

build.sh:
```bash
tar xzvf oauth-1.2.3.tgz
cd oauth-1.2.3
/usr/bin/phpize
CPPFLAGS=-I/usr/local/include LDFLAGS=-L/usr/local/lib ./configure
make
```

* Upload a builder

```bash
$ iron_worker upload builder
```

* Download a package. Go to https://hud.iron.io/ and download code named php-builder ("Code" tab)
* Unpack, grab .so file






