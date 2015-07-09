# ShopSync

Command line tool to help synchronize your Shopify stores for different environments.

## Installation

ShopSync is distributed as a Ruby gem.

```
$ gem install shop_sync
```

## Configuration

Configure the store you would like to work with.

```
$ ss config rageon
```

This will create a `rageon.env` file in the current directory with the following contents

```
API_KEY=shopifykey
API_PASSWORD=shopifypassword
API_HOST=rageon
```

## Usage

After installing, the `ss` command is available:

```
$ ss help
TODO: paste help output here
```

## Examples

Download a theme to the current directory

```
$ ss download rageon
```

Copy a theme from the rageon production store to the staging and development stores

```
$ ss copy-theme rageon rageon-staging rageon-development
```

Automatically upload files to the specified store when they are saved

```
$ ss watch rageon-development
```

Copy a product collection (including metadata) from one store to one or more stores

```
$ ss copy-collection 1234 rageon rageon-staging rageon-development
```

## License

ShopSync is available under the MIT license. See the LICENSE file for more info.
