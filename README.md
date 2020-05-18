# math-tools

I'm learning PureScript and Calculus for the first time this summer.  Behold.

## Dependencies

* [Node](https://nodejs.org/en/) - JavaScript runtime.
* [PureScript](https://www.purescript.org/).  Try `npm i -g purescript`.  The `npm` Node Package Manager executable should have been installed alongside `node`.
* [Spago](https://github.com/purescript/spago) - the PureScript package manager.  Try `npm i -g spago`.

It's also helpful to set up [`stack`](https://docs.haskellstack.org/en/stable/README/).  After installing, run `stack config set resolver ghc-8.6.5` because GCH 8.6.* seems to have better ecosystem support than 8.8.*, and then run `stack setup` to install the Haskell compiler.  Make sure `$HOME/.local/bin` is in your path, as that's where `stack install` will place executable binaries.

## Usage

```
/path/to/ $ git clone git@github.com:deciduously/math-tools.git
$ cd math-tools
/path/to/math-tools/ $ spago build
[info] Installation complete.
Compiling Type.Data.RowList
Compiling Partial

// lots of output

[info] Build succeeded.

$
```

Use `spago repl` to enter a project REPL, `spago test` to run the tests, or `spago run` to execute `main`.