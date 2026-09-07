# ✅ Böyle olmalı
EVP_CIPHER_CTX = distinct ptr pointer
EVP_CIPHER     = distinct ptr pointer
const
  EVP_CTRL_GCM_SET_IVLEN = 0x9
  EVP_CTRL_GCM_GET_TAG   = 0x10
  EVP_CTRL_GCM_SET_TAG   = 0x11
  # Bağlam oluştur / yok et
proc EVP_CIPHER_CTX_new(): EVP_CIPHER_CTX
  {.importc, header: "openssl/evp.h".}

proc EVP_CIPHER_CTX_free(ctx: EVP_CIPHER_CTX)
  {.importc, header: "openssl/evp.h".}

# Algoritmayı seç
proc EVP_aes_256_gcm(): EVP_CIPHER
  {.importc, header: "openssl/evp.h".}

# Şifreleme
proc EVP_EncryptInit_ex(ctx: EVP_CIPHER_CTX, cipher: EVP_CIPHER,
                        impl: pointer, key: pointer, iv: pointer): cint
  {.importc, header: "openssl/evp.h".}

proc EVP_EncryptUpdate(ctx: EVP_CIPHER_CTX, output: pointer,
                       outl: ptr cint, input: pointer, inl: cint): cint
  {.importc, header: "openssl/evp.h".}

proc EVP_EncryptFinal_ex(ctx: EVP_CIPHER_CTX,
                         output: pointer, outl: ptr cint): cint
  {.importc, header: "openssl/evp.h".}

# Çözme
proc EVP_DecryptInit_ex(ctx: EVP_CIPHER_CTX, cipher: EVP_CIPHER,
                        impl: pointer, key: pointer, iv: pointer): cint
  {.importc, header: "openssl/evp.h".}

proc EVP_DecryptUpdate(ctx: EVP_CIPHER_CTX, output: pointer,
                       outl: ptr cint, input: pointer, inl: cint): cint
  {.importc, header: "openssl/evp.h".}

proc EVP_DecryptFinal_ex(ctx: EVP_CIPHER_CTX,
                         output: pointer, outl: ptr cint): cint
  {.importc, header: "openssl/evp.h".}

# Tag al / ver  (GCM'e özel)
proc EVP_CIPHER_CTX_ctrl(ctx: EVP_CIPHER_CTX, typ: cint,
                         arg: cint, ptr_arg: pointer): cint
  {.importc, header: "openssl/evp.h".}