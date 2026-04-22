# homebrew-mcpbolt

Homebrew tap for [MCPBoltBar](https://github.com/vishmathpati/mcpbolt) — the menu bar app for managing MCP servers across AI coding tools.

## Install

```bash
brew install --cask vishmathpati/mcpbolt/mcpboltbar
```

Or tap first, then install:

```bash
brew tap vishmathpati/mcpbolt
brew install --cask mcpboltbar
```

## Uninstall

```bash
brew uninstall --cask mcpboltbar
```

## Update

```bash
brew upgrade --cask mcpboltbar
```

## What's in the tap

| Cask | Description |
|------|-------------|
| `mcpboltbar` | macOS menu bar app for managing MCP servers |

## Notes

The app is ad-hoc signed (not notarized). The cask's `postflight` runs
`xattr -cr` automatically so Gatekeeper doesn't block first launch.
