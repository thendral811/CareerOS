import hashlib

p = int(input("Enter p: "))
q = int(input("Enter q: "))
g = int(input("Enter g: "))

x = int(input("Enter private key x: "))
k = int(input("Enter random k: "))

message = input("Enter message: ")
hash_choice = input("Enter hash algorithm (MD5/SHA-512): ").upper()

message_bytes = message.encode()

if hash_choice == "MD5":
    hash_hex = hashlib.md5(message_bytes).hexdigest()
elif hash_choice in ["SHA-512", "SHA512"]:
    hash_hex = hashlib.sha512(message_bytes).hexdigest()
else:
    raise ValueError("Choose MD5 or SHA-512")

print("\n========== HASH ==========")
print("Message       :", message)
print("Hash algorithm:", hash_choice)
print("Hash (hex)    :", hash_hex)

H = int(hash_hex, 16)

print("Hash (integer):", H)

y = pow(g, x, p) # public key

print("\n========== KEY GENERATION ==========")
print("Private key x :", x)
print("Public key y  :", y)
print("y = g^x mod p =", y)

import math

if not (1 <= k < q):
    raise ValueError("k must satisfy 1 <= k < q")

if math.gcd(k, q) != 1:
    raise ValueError("k must have a modular inverse modulo q")

r = pow(g, k, p) % q

k_inverse = pow(k, -1, q)

s = (k_inverse * (H + x * r)) % q

print("\n========== DIGITAL SIGNATURE ==========")
print("k             :", k)
print("k^(-1) mod q  :", k_inverse)
print("r             :", r)
print("s             :", s)

print("\nDigital Signature = (r, s)")
print("Signature       =", (r, s))

if s == 0:
    print("\nSignature cannot be verified because s = 0")
else:
    w = pow(s, -1, q)

    u1 = (H * w) % q
    u2 = (r * w) % q

    v = ((pow(g, u1, p) * pow(y, u2, p)) % p) % q

    print("\n========== VERIFICATION ==========")
    print("w  = s^(-1) mod q :", w)
    print("u1 = H*w mod q    :", u1)
    print("u2 = r*w mod q    :", u2)
    print("v                 :", v)
    print("r                 :", r)

    if v == r:
        print("\nSignature is VALID")
    else:
        print("\nSignature is INVALID")