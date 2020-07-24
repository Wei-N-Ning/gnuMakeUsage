# make install

## Bare makefile

out of all the posts I read, this really helped me:
<https://stackoverflow.com/questions/3239343/make-install-but-not-to-default-directories>

```text


I tried the above solutions. None worked.

In the end I opened Makefile file and manually changed prefix path to desired installation path like below.

PREFIX ?= "installation path"

When I tried --prefix, "make" complained that there is not such command input. However, perhaps some packages accepts --prefix which is of course a cleaner solution.

```

The **problems** are, some gnu packages are configured by autoconf and come with
`configure` script; in this cases, `make` is given a lot more variables
to tune the installation behavior;

For bare makefile, chances are it defines the `PREFIX` variable (to
prevent to be compatible with those managed by autoconf), therefore I
can use the standard make set-variable-in-cmd mechanism to redefine
the value of `PREFIX`:

`make install PREFIX=<some>`

recall DA's makefiles heavily rely on this pass-by-cmd feature.

### Example: install redis binaries

```shell
git clone https://github.com/redis/redis
cd redis
make all

# install binaries to $HOME/.local; this directory is created by haskell
# stack but I find it quite handy to be a general purpose location for
# home-made binaries

make install PREFIX=~/.local

# the binaries are installed to $HOME/.local/bin (bin is created by
# redis makefile)
```

## Autoconf

I need to run `./configure --prefix=<some>` to tell `make` where to
install the artifact; `make install` will just work.

