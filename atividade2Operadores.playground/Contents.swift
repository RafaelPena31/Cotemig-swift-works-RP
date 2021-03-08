import UIKit

// 1

/*
 A diferença principal entre o IF e o GUARD está na sintaxe e legibilidade do código. Com o guard, evitamos a criação de uma
 espécie de pirâmide de código. O utilizamos como uma espécie de verificador quando das 2 opções existentes, somente uma
 for executar um bloco de código.
 */

//2

func lance() -> (Int, Double) {
    let gValue: (Int, Double) = (10, 9.81)
    print(gValue)
    return gValue
}

lance().0

// 3

func logar() {
    let login: String? = "user"
    let senha: String? = "senha"
    
    guard login != nil else {
        return
    }
    
    guard login != nil else {
        return
    }
    
    guard login == "user", senha == "senha" else {
        print("Dados incorretos")
        return
    }
    print("Login e senha corretos")
}

logar()

// 4

func HTTPReturn(log: Int) {
    switch log {
    case 200..<300:
        print("Sucesso")
    case 300..<400:
        print("Redirecionamento")
    case 400..<500:
        print("Erro no cliente")
    case 500..<600:
        print("Erro no servidor")
    default:
        print("Erro desconhecido")
    }
}
