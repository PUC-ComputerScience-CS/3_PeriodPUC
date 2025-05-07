using System;

class Exemplos{
    static void Main(){
        int[] valores = new int[5];
        Console.WriteLine("Digite 5 numeros inteiros: ");
        for(int i=0; i<5; i++){
        Console.WriteLine($"Numero {i+1}: ");
        valores[i] = int.Parse(Console.ReadLine());
        }

        Console.WriteLine("Os numeros na ordem inversa sao: ");
        for(int i=4; i>= 0; i--){
            Console.WriteLine($"{valores[i]}");
        }

        List<string> nomes = new List<string>(); //neste ponto aqui estamos trabalhando com objeto
        nomes.Add("Ana");
        nomes.Add("Jorge");
        nomes.Add("Batata");

        Console.WriteLine($"Total de nomes: {nomes.Count}");
        Console.Write($"Primeiro nome: {nomes[0]}");
    }
}