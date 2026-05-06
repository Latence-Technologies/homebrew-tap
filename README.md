# Latence-Technologies/homebrew-tap

> Homebrew tap for [LatenceTech](https://latencetech.com) tools.

## Install ltping

```bash
brew tap Latence-Technologies/tap
brew install ltping
```

Or in a single command:

```bash
brew install Latence-Technologies/tap/ltping
```

## Verify

```bash
ltping --version
# ltping 1.7.5

ltping https://example.com
```

## Update

```bash
brew upgrade ltping
```

## Uninstall

```bash
brew uninstall ltping
brew untap Latence-Technologies/tap
```

---

## For maintainers — releasing a new version

After publishing `ltping` to PyPI:

```bash
# From the ltping-monorepo root
./scripts/update_homebrew_formula.sh

# Copy the updated formula to this tap repo
cp scripts/homebrew/ltping.rb Formula/ltping.rb

# Commit and push
git add Formula/ltping.rb
git commit -m "ltping x.y.z"
git push origin main
```

---

*LatenceTech — [latencetech.com](https://latencetech.com)*
