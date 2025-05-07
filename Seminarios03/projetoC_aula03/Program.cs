using System;

class Program{
    static void Main(){
        //escolha pc
        Random gerador = new Random();
        int CompEscolha = gerador.Next(1, 3);

        //escolha usuario
        Console.Write("PEDRA, PAPEL OU TESOURA");
        Console.Write("\nEscolha entre PEDRA(1), PAPEL(2) ou TESOURA(3): ");
        string escUsuario = Console.ReadLine();
        int escolha = int.Parse(escUsuario);

        switch(escolha){
                case 1: 
                    if(CompEscolha == escolha){
                        Console.Write("\nDeu empate!!\n");
                    }
                    if(CompEscolha == 2){
                        Console.Write("\nO computador venceu...Papel vence pedra...┌( ಠ_ಠ)┘\n");
                    }
                    if(CompEscolha == 3){
                        Console.Write("\nParabens!! Pedra vence tesoura!! >:D\n");
                    }
                    break;

                case 2:
                    if(CompEscolha == escolha){
                        Console.Write("\nDeu empate!!\n");
                    }
                    if(CompEscolha == 1){
                        Console.Write("\nParabens!! Papel vence pedra!! >:D\n");
                    }
                    if(CompEscolha == 3){
                        Console.Write("\nO computador venceu...Tesoura vence papel...\n");
                    }
                    break;

                case 3: 
                    if(CompEscolha == escolha){
                        Console.Write("\nDeu empate!!\n");
                    }
                    if(CompEscolha == 2){
                        Console.Write("\nParabens!! Tesoura vence papel!! >:D\n");
                    }
                    if(CompEscolha == 1){
                        Console.Write("\nO computador venceu...Pedra vence tesoura...\n");
                    }
                    break;
        }
    }
}