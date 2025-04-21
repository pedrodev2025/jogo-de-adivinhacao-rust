use std::io;
use rand::Rng;
use std::cmp::Ordering;

fn main() {
    println!("Bem-vindo ao Jogo de Adivinhação!");

    let secret_number = rand::thread_rng().gen_range(1..=100);

    println!("Estou pensando em um número entre 1 e 100.");

    loop {
        println!("Por favor, digite seu palpite:");

        let mut guess = String::new();

        io::stdin()
            .read_line(&mut guess)
            .expect("Falha ao ler a linha");

        let guess: u32 = match guess.trim().parse() {
            Ok(num) => num,
            Err(_) => {
                println!("Por favor, digite um número!");
                continue;
            }
        };

        println!("Você palpitou: {}", guess);

        match guess.cmp(&secret_number) {
            Ordering::Less => println!("Muito baixo!"),
            Ordering::Greater => println!("Muito alto!"),
            Ordering::Equal => {
                println!("Você acertou!");
                break;
            }
        }
    }
}
