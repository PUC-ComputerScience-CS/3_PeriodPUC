using System;

class Program{
    static void Main(){
        //vezes que o dado será lançado
        Console.Write("Quantas vezes o dado sera lançado?(digite um numero inteiro): ");
        string vezesAux = Console.ReadLine(); 
        int vezes = int.Parse(vezesAux);

        for(int i=1; i <= vezes; i++){
            //valor do resultado
            Random num = new Random();
            int resultado = num.Next(1, 20);
            Console.WriteLine($"Rolagem {i}: {resultado}\n");
        }
    }
}