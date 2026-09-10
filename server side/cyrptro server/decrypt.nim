import libsodium/sodium

if sodium_init() < 0:
  quit("DATA İS CORRAPTED. SODİUM İS NOT STARTED!")

# XChaCha20-Poly1305 
proc decryptMessage*(ciphertext: seq[byte], sharedKey: ptr byte, nonce: ptr byte): string =
  var decrypted = newSeq[byte](ciphertext.len - crypto_aead_xchacha20poly1305_ietf_ABYTES)
  var decryptedLen: culonglong

  let res = crypto_aead_xchacha20poly1305_ietf_decrypt(
    addr decrypted[0],
    addr decryptedLen,
    nil, 
    addr ciphertext[0],
    ciphertext.len.culonglong,
    nil, 0,
    nonce,
    sharedKey
  )

  if res != 0:
    return "" 

 
  return cast[string](decrypted)