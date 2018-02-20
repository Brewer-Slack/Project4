import random
import math

def strToList(s):
	return[ord(x)-65 for x in s]

def lstToStr(lst):
	newStr = ''
	return newStr.join([chr(int(x)+65) for x in lst])

#tokenize is shared by all functions
#raw_file is a file with the message to be encrypted
#plain_txt is raw_file with alpha chars transformed to uppercase, white space removed, 
#and eol inserted every fifty characters.
def tokenize(raw_file,plain_txt):
	raw = open(raw_file, "r")
	

#returns a randomly generated upper-case alphabet
def key_gen_trans():
	#Generate the alphabet
	lst = [chr(i) for i in range(ord('A'),ord('Z')+1)]
	
	#Permute the list
	lst = Permutations(lst).random_element()
	
	alp = ''.join(lst)
	perm = [ord(x)-64 for x in alp]
	return perm
	
#reads and encrypts plain_txt using the alphabetic transposition cipher and key 
#and writes the output to the file cipher_txt.
def enc_trans(key,plain_txt_t,cipher_txt_t):
	cipherFile = open(cipher_txt_t,"w")
	plainFile = open(plain_txt_t, "r")
	
	plainFromFile = plainFile.readline()
	
	pln = strToList(plainFromFile)
	plr = [key[pln[i]]-1 for i in range(len(plainFromFile))]
	stringToWrite = lstToStr(plr)
	
	cipherFile.write(stringToWrite)
	cipherFile.close()
	plainFile.close()

#reads and decrypts cipher_txt using the alphabetic transpositon cipher and key 
#and writes the output to the file plain_txt
def dec_trans(key,plain_txt_t,cipher_txt_t):
	cipherFile = open(cipher_txt_t,"r")
	plainFile = open(plain_txt_t, "w")
	
	cipherFromFile = cipherFile.readline()
	cipherFromFile = strToList(cipherFromFile)
	
	invperm = Permutation(key).inverse()
	pls = [invperm[cipherFromFile[i]]-1 for i in range(len(cipherFromFile))]
	plainFile.write(lstToStr(pls))
	
'''
pl = "WITHDRAWONEHUNDEREDDOLLARS"
pln = [ord(x)-65 for x in pl]
print pln

ct = caesar(pl)
print ct
'''

#MAIN
key = key_gen_trans()
raw_file_t = "raw_file_t.txt"
plain_txt_t = "plain_txt_t.txt"
tokenize(raw_file_t, plain_txt_t)

cipher_txt_t = "cipher_txt_t.txt"
enc_trans(key, plain_txt_t, cipher_txt_t)
dec_trans(key, plain_txt_t, cipher_txt_t)




'''
p = 'ZAYBXCWDVEUFTGSHRIQJPKOLNM'
perm  = [ord(x)-64 for x in p]

#pln = input('input plain text: ')
pln = strToList(pl)
plr = [perm[pln[i]]-1 for i in range(len(pl))]
print(lstToStr(plr))

invperm = Permutation(perm).inverse()
pls = [invperm[plr[i]]-1 for i in range(len(pl))]
print(lstTostr(pls))
'''