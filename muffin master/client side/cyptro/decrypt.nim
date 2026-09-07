import crypto


proc decrypt(ciphertext, tag, key, iv: seq[byte]): seq[byte]


let ctx = EVP_CIPHER_CTX_new()
if ctx == nil:
  raise newException(...)

defer: EVP_CIPHER_CTX_free(ctx)

let ret = EVP_CIPHER_CTX_ctrl(ctx, EVP_CTRL_GCM_SET_IVLEN, 12, nil)
if ret != 1:
  raise newException(CatchableError, "iv long is errored.")

let ret2 = EVP_DencryptInit_ex(ctx, EVP_aes_256_gcm(), nil, key[0].addr, iv[0].addr)
if ret2 != 1:
  raise newException(CatchableError, " aes 256 gcm is failed....")
var ciphertext = newSeq[byte](plaintext.len)
var outl: cint