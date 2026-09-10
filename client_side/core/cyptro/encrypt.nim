import libsodium/sodium

# Does it work? 
if sodium_init() < 0:
  quit("DATA İS CORRAPTED. SODİUM İS NOT STARTED.")

#curve25519 
proc deriveSharedKey*(mySecretKey: ptr byte, opponentPublicKey: ptr byte, sharedKeyOutput: ptr byte): bool =
  let res = crypto_scalarmult(
    sharedKeyOutput
    mySecretKey
    opponentPublicKey
  )
  return res == 0

#Xchacha20-Poly1305

proc encryptMessage*(message: string, sharedKey: ptr byte, nonce: ptr byte): seq[byte] = 

var ciphertext = newSeq[byte](message.len + crypto_aead_xchacha20poly1305_ietf_ABYTES)
var ciphertextLen: culonglong

let res = crypto_aead_xchacha20poly1305_ietf_encrypt(
    addr ciphertext[0],
    addr ciphertextLen,
    cast[ptr byte](cstring(message)),
    message.len.culonglong
    nil, 0,
    nil,
    nonce,
    sharedKey
)

if res != 0:
  quit("Something went wrong")
return ciphertext