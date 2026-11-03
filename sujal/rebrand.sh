#!/bin/bash
# Sujal Live iOS — minimal rebrand of Moblin, applied at build time.
set -euo pipefail
cd "$(dirname "$0")/.."

# Build settings normally kept in the (git-ignored) Config/User.xcconfig.
# No Apple team: the IPA is built unsigned and signed later by the sideload tool.
cat > Config/User.xcconfig <<'EOF'
DEVELOPMENT_TEAM =
BASE_PRODUCT_BUNDLE_IDENTIFIER = com.toolsbysujal.live.ios
CAPABILITIES = free
EOF

# Home-screen name.
sed -i '' 's/INFOPLIST_KEY_CFBundleDisplayName = Moblin;/INFOPLIST_KEY_CFBundleDisplayName = "Sujal Live";/g' Moblin.xcodeproj/project.pbxproj
grep -c 'INFOPLIST_KEY_CFBundleDisplayName = "Sujal Live";' Moblin.xcodeproj/project.pbxproj
