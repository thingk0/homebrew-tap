# thingk0's Homebrew Tap

Official Homebrew tap for [MacBay](https://github.com/thingk0/macbay) and developer tools maintained by [thingk0](https://github.com/thingk0).

## Available Formulae

| Formula | Description | Install Command |
| :--- | :--- | :--- |
| [`macbay`](Formula/macbay.rb) | Developer-first storage externalizer for Apple Silicon Macs | `brew install thingk0/tap/macbay` |

---

## Installation & Quick Start

```sh
# Install MacBay
brew install thingk0/tap/macbay

# Verify installation
mb --version
# Output: 1.0.0

# Explore available subcommands
mb --help
```

Both `mb` and `macbay` commands are installed to your Homebrew `bin` path.

---

## Updating

```sh
brew update
brew upgrade macbay
```

---

## Uninstallation

```sh
brew uninstall macbay
```

> [!NOTE]
> `brew uninstall macbay` removes only the CLI executables. Before uninstalling, remember to restore any docked applications (`mb undock <App>.app`) and revert cache environment variables (`mb cache --reset`).

---

## License

Formulae in this repository are available under the [MIT License](https://opensource.org/licenses/MIT).
