## How to use mason if you did not install mason yet
```bash
# 🎯 Activate mason globally from pub.dev
dart pub global activate mason_cli

# 🚀 Initialize mason
mason init

# 🧱 Get all bricks registered in mason.yaml
mason get

# ▶️ Use the mason to create a new feature by running
mason make FEATURE_NAME
```

For more information, see https://pub.dev/packages/mason_cli

---

## How to Change the domain for the project in the .env file?

1. Open the `.env` file in your project.
2. Find the line that starts with `DOMAIN=`.
3. Replace the value after `=` with the new domain name without the ending `/`, i.e., `https://example.com`.

❌ `DOMAIN=https://example.com/`
✅ `DOMAIN=https://example.com`

---