import os
CLS = lambda: os.system('CLS')
erros = 0
acertos = []
chance = ""
chutes = []
CLS()
print("Olá humano. Estou aqui para te desafiar a jogar contra mim! MUHHAAHA BIP HAHA")
palavra = input("Não entendo muito bem porque, mas sinto que tenho que te perguntar uma palavra, então vamos, digite algo:  ")
palavra = palavra.lower()
CLS()
print(".:.:.:.:. AGORA NOSSO DUELO COMEÇA .:.:.:.:.\n")
chute = input("         >>>>>> VAMOS LÁ, COMECE SUA TENTATIVA DE REALIZAR O IMPOSSÍVEL <<<<<<<<               \n")
CLS()
while True:
    CLS()
    chute = chute.lower()
    if chute in chutes:
        print("NÃO TENTE ME LUDIBRIAR USUÁRIO, VOCÊ JÁ DIGITOU ISSO!")
    elif chute in palavra or chute == palavra :
        print(".:.:.:. QUE, COMO PODE TER ACERTADO? PELO JEITO O PROGRAMADOR ESTÁ AO SEU LADO .:.:.")
        if (chute in acertos)==False:
            acertos.append(chute)
        if (chute in chutes)==False:
            chutes.append(chute)
        for i in palavra:
            if i in acertos:
                chance = chance + i
        if chance == palavra or chute == palavra:
            break
        chance = ""
    else:
        print("HAHAHA! NUNCA PODERAR GANHAR DE UMA MÁQUINA MEU JOVEM (︶︹︺)")
        erros = erros + 1
        if (chute in chutes)==False:
            chutes.append(chute)
    print("PARA LHE DAR ALGUMA ESPERANÇA, ANTES DE TIRA-LA, CLARO, OLHE SEUS ACERTOS : ", end = "")
    print("\n")
    print("\n")
    print("X==:==    ")
    print("X  :      ")
    if erros > 0:
        print("X  O      ")
    else:
        print("X         ")
    if erros == 2:
        print("X /       ")
    elif erros == 3:
        print("X /|      ")
    elif erros >= 4:
        print("X /|\     ")
    else:
        print("X         ")
    if erros == 5:
        print("X /-      ")
    elif erros >5:
        break
    print("X         ")
    print("==========\n")
    for i in palavra:
        if i in acertos:
            chance = chance + i
            print(i, end="")
        else:
            print('_', end="")
    chance = ""
    chute = input("\n\n>>>>>>>>>> VAMOS CONTINUAR PARA QUE EU POSSA GANHAR HAHAH <<<<<<<<<<")
if erros > 5:
    CLS()
    print(".:.:.:.:.:. COM O PROGRAMADOR AO MEU LADO NADA ME FALTARÁ HAHAHA .:.:.:.:.:.\n")
    print(".:.:.:.:.:.      VOLTE MAIS VEZES, GOSTEI DE GANHAR DE VOCÊ      .:.:.:.:.:.\n")
    print(".:.:.:.:.:.    QUASE EU ME ESQUECIA, A PALAVRA DE SUA DERROTA ERA %s"%(palavra.upper()))
else:
    CLS()
    print("")
    CLS()
    print("QUE, COMO EU PERDI PARA UM HUMANO? NÃO É POSSíVEL, EU... AGH")
    print("QUE TIPO DE TRAPAÇA VOCÊ USOU... ME SINTO HACKEADO")
    print("<<<<<<<<<<<< G A M E   O V E R >>>>>>>>>>>                 (...para mim...)")
