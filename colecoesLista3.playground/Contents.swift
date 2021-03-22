import UIKit

print("Rafael Augusto Pena Pereira Mesquita - 11901322 - 3B1 - 46")

// 1
/*
Variável opcional é a variável que pode ou não conter um valor, podendo receber como valor "nill" que é uma forma de deixar a variável vazia.
*/

// 2

let arrayExe2 = [0, 1]
let setExe2 = Set<Double>(arrayLiteral: 3.14, 9.81, 0.33)
let dictionaryExe2 = ["Rafael": "Desenvolvedor Mobile", "Fernando": "Desenvolvedor Backend", "Pedro": "Desenvolvedor Backend", "membroFaltante": "Designer UX"]

print(arrayExe2, setExe2, dictionaryExe2)

// 3

/*
A diferença principal entre os 2 é que o Set não é ordenado e não pode ter nenhum item repetido.
*/

// 4
let arrayExe3 = [1, 13, 13, 26, 38, 38, 39, 41, 50, 50, 74, 74, 80, 90, 100]
var arrayNaoRepetirExe3: [Int] = []

func addItensToArrayExe3(array: [Int]) {
    for item in array {
        guard arrayNaoRepetirExe3.contains(item) else {
            arrayNaoRepetirExe3.append(item)
            continue
        }
        continue
    }
    print(arrayNaoRepetirExe3)
}

addItensToArrayExe3(array: arrayExe3)

// 5
var soma = 0
for number in arrayNaoRepetirExe3 {
    soma += number
}
print(soma)
