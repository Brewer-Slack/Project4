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
	plain = open(plain_txt, "w")
	rawText = ""
	for line in raw:
		rawText += line
	rawText = rawText.replace(' ', '')
	rawText = rawText.replace('\n', '')
	rawText = rawText.upper()
	# add an eol every 50
	lst = list(rawText)
	for index in range(len(lst)):
		if index % 50 == 0:
			lst.insert(index, '\n')
			
	plainText = "".join(lst)
	print plainText
	plain.write(plainText)
	plain.close()
	raw.close()

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
def enc_trans(key,plain_txt,cipher_txt):
	cipherFile = open(cipher_txt,"w")
	plainFile = open(plain_txt, "r")
	
	plainFromFile = ""
	for line in plainFile:
		plainFromFile += line.strip()
	
	pln = strToList(plainFromFile)
	plr = [key[pln[i]]-1 for i in range(len(plainFromFile))]
	stringToWrite = lstToStr(plr)
	
	cipherFile.write(stringToWrite)
	cipherFile.close()
	plainFile.close()

#reads and decrypts cipher_txt using the alphabetic transpositon cipher and key 
#and writes the output to the file plain_txt
def dec_trans(key,plain_txt,cipher_txt):
	cipherFile = open(cipher_txt,"r")
	plainFile = open(plain_txt, "w")
	
	
	cipherFromFile = cipherFile.readline()
	cipherFromFile = strToList(cipherFromFile)
	
	invperm = Permutation(key).inverse()
	pls = [invperm[cipherFromFile[i]]-1 for i in range(len(cipherFromFile))]
	plainFile.write(lstToStr(pls))
	plainFile.close()
	cipherFile.close()
	

#MAIN
key = key_gen_trans()
raw_file= "raw_file.txt"
plain_txt = "plain_txt.txt"
tokenize(raw_file, plain_txt)

cipher_txt = "cipher_txt.txt"
enc_trans(key, plain_txt, cipher_txt)
dec_trans(key, plain_txt, cipher_txt)




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