import crypto
proc encrypt(plaintext, key, iv: seq[byte]): tuple[ciphertext,
tag: seq[byte]]

#  nil değeri dönmüşmü onu kontrol etik
let ctx = EVP_CIPHER_CTX_new
if ctx == nil:
  raise newException(CatchableError, " ctx is not are create")


# deferle bellek güvenliği
defer: EVP_CIPHER_CTX_free(ctx)


# İV uzunluğunu ayarladık sanırım bu nonce gibi bir şey ???
let ret = EVP_CIPHER_CTX_ctrl(ctx, EVP_CTRL_GCM_SET_IVLEN, 12, nil)
if ret != 1:
  raise newException(CatchableError, "iv long is errored.")
#İNİT ÇAĞRISI YAPIYORUZ !

let ret2 = EVP_EncryptInit_ex(ctx, EVP_aes_256_gcm(), nil, key[0].addr, iv[0].addr)
if ret2 != 1:
  raise newException(CatchableError, " aes 256 gcm is failed....")
var ciphertext = newSeq[byte](plaintext.len)
var outl: cint


let ret3 = EVP_EncryptUpdate(ctx, ciphertext[0].addr, outl.addr, plaintext[0].addr, platintext.len.cint)
if ret3 != 1:
  raise newException(CatchableError, "encrypt update failed")
var finalLen: cint


let ret4 = EVP_EncryptInit_ex(ctx, ciphertext[outl].addr, finalLen.addr)
if ret4 != 1:
  raise newException(CatchableError, "encrypt final failed")

var tag = newSeq[byte](16)

let ret5 = EVP_CIPHER_CTX_ctrl(ctx, EVP_CTRL_GCM_SET_TAG, 16, tag[0].addr)
