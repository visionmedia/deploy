
# deploy

  Minimalistic shell deployment shell script.

## Installation

    $ make install

  Visit the [wiki](https://github.com/visionmedia/deploy/wiki) for additional usage information.

## Usage


      Usage: deploy [options] <env> [command]

      Options:

        -C, --chdir <path>   change the working directory to <path>
        -c, --config <path>  set config path. defaults to ./deploy.conf
        -T, --no-tests       ignore test hook
        -V, --version        output program version
        -h, --help           output help information

      Commands:

        setup                run remote setup commands
        update               update deploy to the latest release
        revert [n]           revert to [n]th last deployment or 1
        config [key]         output config file or [key]
        curr[ent]            output current release commit
        prev[ious]           output previous release commit
        exec|run <cmd>       execute the given <cmd>
        console              open an ssh session to the host
        list                 list previous deploy commits
        [ref]                deploy to [ref], the 'ref' setting, or latest tag

## Configuration

 By default `deploy(1)` will look for _./deploy.conf_, consisting of one or more environments, `[stage]`, `[production]`, etc, followed by directives.

    [stage]
    key /path/to/some.pem
    user deployer
    host n.n.n.n
    repo git@github.com:visionmedia/express.git
    path /var/www/myapp.com
    ref origin/master
    post-deploy /var/www/myapp.com/update.sh

## Directives

### key (optional)

  Path to identity file used by `ssh -i`.
  
      key /path/to/some.pem

### ref (optional)

  When specified, __HEAD__ is reset to `ref`. When deploying
  production typically this will _not_ be used, as `deploy(1)` will
  utilize the most recent tag by default, however this is useful
  for a staging environment, as shown below where __HEAD__ is updated
  and set to the develop branch.
    
        ref origin/develop

### user

  User for deployment.
   
       user deployer

### host

  Server hostname.
   
       host 50.17.255.50

### repo

  GIT repository to clone.
   
       repo git@github.com:visionmedia/express.git

### path

  Deployment path.
    
        path /var/www/myapp.com

### Hooks

  All hooks are arbitrary commands, executed relative to `path/current`,
  aka the previous deployment for `pre-deploy`, and the new deployment
  for `post-deploy`. Of course you may specify absolute paths as well.

### pre-deploy

      pre-deploy ./bin/something

### post-deploy

      post-deploy ./bin/restart

### test

  Post-deployment test command after `post-deploy`. If this
  command fails, `deploy(1)` will attempt to revert to the previous
  deployment, ignoring tests (for now), as they are assumed to have run correctly.

      test ./something

## License 

(The MIT License)

Copyright (c) 2011 TJ Holowaychuk &lt;tj@vision-media.ca&gt;

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.