import crypto


proc decrypt*(ciphertext, tag, key, iv: seq[byte]): seq[byte]


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
var outl: cint = 0
let ret3 = EVP_DencryptUpdate(
  ctx,
  plaintext[0].addr,
  outl.addr,
  ciphertext[0].addr,
  ciphertext.len.cint
)
if ret3 != 1:
  raise newException(CatchableError, " decreUpdate failed ")


#tagss


let ret4 = EVP_CIPHER_CTX_ctrl(
  ctx,
  EVP_CTRL_GCM_SET_TAG,
  16,
  tah[0].addr
)
if ret4 != 1:
  raise newException(CatchableError, "failed at gcm tag things")



var finalLen: cint = 0
let ret5 = EVP_DencryptFinal_ex(ctx, plaintext[outl.int].addr, finalLen.addr)
if ret != 1:
  raise newException(CatchableError, "TAG VERİFİCTROİN FAİLED . DATA İS DUCKED !")


let totalLen = outl.int + finalLen.int
return plaintext[0 ..< totalLen]
