brew cask install alfred

# Below doesn't work... but I really wish it did.
# /usr/libexec/PlistBuddy ~/Library/Preferences/com.apple.symbolichotkeys.plist \
#   -c "Delete AppleSymbolicHotKeys:64" \
#   -c "Add AppleSymbolicHotKeys:64 dict" \
#   -c "Add AppleSymbolicHotKeys:64:enabled bool false" \
#   -c "Add AppleSymbolicHotKeys:64:value dict" \
#   -c "Add AppleSymbolicHotKeys:64:value:type string standard" \
#   -c "Add AppleSymbolicHotKeys:64:value:parameters array" \
#   -c "Add AppleSymbolicHotKeys:64:value:parameters: integer 32" \
#   -c "Add AppleSymbolicHotKeys:64:value:parameters: integer 49" \
#   -c "Add AppleSymbolicHotKeys:64:value:parameters: integer 1048576" \
