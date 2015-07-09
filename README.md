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
Commands:
  ss config STORE                             # Generate a configuration file for the Shopify store named STORE
  ss copy SOURCE_STORE DESTINATION_STORES...  # Replaces the destination store's themes with the source store's theme
  ss download STORE                           # Download the theme assets into the current directory for the configured STORE
  ss help [COMMAND]                           # Describe available commands or one specific command
  ss replace STORE                            # Replace the theme assets from the current directory to the configured STORE
  ss watch STORE                              # Automatically upload modified theme assets to the configured STORE
```

## License

ShopSync is available under the MIT license. See the LICENSE file for more info.
