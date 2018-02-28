import os
CLS = lambda: os.system("CLS")
a = False
b = [[],[],[]]
c = 1
d = False
e = False
for i in range(3):
    for j in range(3):
        b[i].append(" ")
print (">>>Olá, seja bem vindo ao jogo da velha!<<<\n")
while True:
    for i in range(3):
        if i > 0:
            print ('---+---+---')
        for j in range(3):
            if b[i][j]==" ":
                d = True
            print (" %s "%(b[i][j]), end="")
            if j < 2:
                print("|",end="")
            else:
                print("")
    if a:
        break
    if not d:
        break
    d = False
    c = c + 1
    e = True
    while e:
        linha = int(input("Digite a linha da sua jogada jogador %i: "%(c%2+1)))
        coluna = int(input("Digite a coluna de sua jogada jogador %i: "%(c%2+1)))
        if linha>3 or coluna>3 :
            CLS()
            print("Por favor, digite um número entre 1 e 3!")
        else:
            e = False
            if b[linha-1][coluna-1] == " ":
                if c%2 == 0:
                    b[linha-1][coluna-1] = "X"
                else:
                    b[linha-1][coluna-1] = "O"
            else:
                print ("Está posição já está marcada. ")
                e = True
    for i in range(3):
        if b[i][0]==b[i][1] and b[i][1]==b[i][2] and b[i][0]!=" ":
            a = True
        if b[0][i]==b[1][i] and b[1][i]==b[2][i] and b[0][i]!=" ":
            a = True
    if b[0][0] == b[1][1] and b[1][1] == b[2][2] and b[1][1]!=" ":
        a = True
    if b[0][2] == b[1][1] and b[1][1] == b[2][0] and b[1][1]!=" ":
        a = True
    CLS()
if not d:
    print("Houve um empate!")
else:
    print("Parabéns Jogador %i, você ganhou!"%(c%2+1))
