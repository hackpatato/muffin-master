# FFI.nimble

version     = "0.1.0"
author      = "senin adin"
description = "AES-256-GCM FFI"
license     = "MIT"

# Bağımlılıklar
requires "nim >= 1.6.0"

# Derleme bayrakları
when defined(linux):
  switch("passL", "-lssl -lcrypto")
  switch("passC", "-I/usr/include/openssl")