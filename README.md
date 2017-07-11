# Docker Elixir Ubuntu x64

Docker image for building Elixir releases.

## Usage

**First, you need to build the image**

```bash
$ docker build docker-elixir-ubuntu --tag user/image-name
```

**Then, run a container pointing to your project dir**

- The volume is loaded to `/root/project`
- `MIX_ENV` is configurable based on your need

```bash
$ docker run --rm -it -v $(pwd):/root/project -e MIX_ENV=staging user/image-name
```

**Finally, check your `_build/staging/rel/app/releases/[version]]/app.tar.gz`!**
