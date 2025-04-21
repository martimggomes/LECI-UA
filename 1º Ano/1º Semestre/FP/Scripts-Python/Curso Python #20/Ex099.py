def maior(* núm):
    cont = maior = 0
    print("\nAnalisando os valores passados...")
    for valor in núm:
        print(f"{valor}", end = " ")
        if cont == 0:
            maior = valor
        else: 
            if valor > maior:
                maior = valor
        cont += 1
    print(f".Foram informados {cont} valores ao todo")
    print(f"O maior valor foi o {maior}")
            
        
maior(2, 8, 4, 5, 7, 11)

    
    
