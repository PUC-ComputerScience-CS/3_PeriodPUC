using System;

class JogoForca{
    static void Main(){
        List<string> personagens = new List<string>{"JOUI", "ARTHUR", "THIAGO", "VERISSIMO", "LIZ", "BALU", "KAISER", "AGATHA", "CRIS", "ARNALDO"};
        bool jogarNovamente = true;

        while(jogarNovamente){
            string palavraSecret = PalavraAleatoria(personagens);
            char[] espaco = new string('_', palavraSecret.Length).ToCharArray(); //.ToCharArray() = Converte a string em um vetor de caracteres (char[])
            List<char> tentativas = new List<char>(); //Lista de tentativa q guarda os caracteres das tentativas
            List<char> tentErradas = new List<char>(); //Lista de tentativa q guarda os caracteres das tentativas ERRADAS
            int totalTent= 10; //quantas tentativas o usuario tem
            int quantTent = totalTent;

            while(quantTent > 0 && !palavraCompleta(espaco)){
                Mostra(espaco, tentativas, tentErradas, quantTent); 

                Console.Write("Digite uma letra: ");
                char letra = char.ToUpper(Console.ReadKey(true).KeyChar); //transforma letra min em mai
                //ReadLine p/ strings e ReadKey p/ char // KeyChar extrai o caractere real da tecla que foi pressionada.
                Console.WriteLine($"\nLetra escolhida: {letra}");

                if(tentativas.Contains(letra) || tentErradas.Contains(letra)){
                    Console.Write("\nVocê já tentou essa letra antes...");
                    continue; //pula pro proximo if
                }

                if(!char.IsLetter(letra)) { //caso o usuario não use letras
                    Console.WriteLine("\nPara jogar forca usamos letras!! ¬_¬");
                    continue;
                }

                if(Revela(palavraSecret, letra, espaco)){
                    tentativas.Add(letra); //adiciona a letra na lista de tentativas corretas
                }
                else{ //se n estiver correta coloca na lista de tent. erradas
                    tentErradas.Add(letra);
                    quantTent--;
                }
            }

            if(palavraCompleta(espaco)){ //mensagem vitoria
                int Chutes = tentativas.Count + tentErradas.Count;
                Console.Write("PARABENS!! Voce sobreviveu a forca!!");
                Console.WriteLine($"Voce cometeu {totalTent - quantTent} erro(s) e descobriu a palavra em {Chutes}!!");
            }
            else{ //mensagem derrota
                Console.Write("Puts...Parece que alguem não sobreviveu a revolução francesa hoje...Quem sabe outro dia >;P");
                Console.WriteLine($"\nA palavra correta era: {palavraSecret}!\n");
            }

            jogarNovamente = ContinuaJogo();
        }
    }

    static void Titulo(){
        Console.Write("\n ==== JOGO DA FORCA DE ORDEM PARANORMAL ==== \n");
        Console.WriteLine();
    }

    //o comp. escolhe a palavra aleatoria a partir do indice da lista
    static string PalavraAleatoria(List<string> personagens){
        Random gerador = new Random();
        int indice = gerador.Next(personagens.Count);
        return personagens[indice];
    }

    //verifica se a palavra ja esta completa
    static bool palavraCompleta(char[] espaco){
        foreach (char i in espaco){//para cada c no espaco(underline)
            if (i == '_')
                return false;
        }
        return true;
    }

    // mostra o estado atual
    static void Mostra(char[] espaco, List<char> tentativas, List<char> tentErradas, int quantTentativa){
        Console.Clear();
        Titulo();
        Console.WriteLine("\nPalavra: " + string.Join(" ", espaco));
        Console.WriteLine();
        Console.WriteLine("Tentativas restantes: " + quantTentativa);
        Console.WriteLine();
        Console.WriteLine("Letras ja usadas: " + string.Join(", ", tentativas));
        Console.WriteLine();
        Console.WriteLine("Letras erradas: " + string.Join(", ", tentErradas));
        Console.WriteLine();
        
    }

    //revela a letra das palavras conforme o usuario vai tentando
    static bool Revela(string personagem, char letra, char[] espaco){
        bool correto = false;
        for (int i = 0; i < personagem.Length; i++){
            if (personagem[i] == letra){
                espaco[i] = letra;
                correto = true;
            }
        }
        return correto;
    }

    //verifica se o usuario quer continuar o jogo
    static bool ContinuaJogo(){
       Console.Write("\nDeseja continuar jogando? (S/N): ");
       string continua = Console.ReadLine().ToUpper();
       return continua == "S";
    }
}