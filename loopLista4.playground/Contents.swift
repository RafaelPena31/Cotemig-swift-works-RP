import UIKit

var str = "Rafael Augusto Pena Pereira Mesquita - 11901322"
print("\n - EXE 1 =============================================== \n")
// 1
var responseExe1 = 0
while responseExe1 <= 100  {
    let exe1Repeat = Int.random(in: 1...100)
    responseExe1 += exe1Repeat
    print(responseExe1)
}

print("\n - EXE 2 =============================================== \n")
// 2
var arrayExe2 = ["sair","novasenha"]
func randomWord() -> String {
    let carac = "abcdefghijklmnopqrstuvwxyz"
    var response = ""
    var index = 0
    let repeatAt = Int.random(in: 1...10)
    while index < repeatAt {
        response.append(carac.randomElement()!)
        index += 1
    }
    return response
}
for _ in 1...10 {
    arrayExe2.append(randomWord())
}

var indexExe2 = Int.random(in: 0..<arrayExe2.count)

while indexExe2 < arrayExe2.count {
    if (arrayExe2[indexExe2] == "novasenha") {
        print("Acesso concedido")
        break
    } else if (arrayExe2[indexExe2] == "sair") {
        print("Programa encerrado")
        break
    }
    indexExe2 = Int.random(in: 0..<arrayExe2.count)
}

print("\n - EXE 3 =============================================== \n")
// 3
// Como não é possível ir adicionando nota a nota, eu irei gerar as notas aleatoriamente
for _ in 0..<10 {
    let nota1 = Int.random(in: 0...10) * 2
    let nota2 = Int.random(in: 0...10) * 4
    let nota3 = Int.random(in: 0...10) * 3
    let result = (nota1 + nota2 + nota3) / 10
    print(result)
}

// 4
print("\n - EXE 4 =============================================== \n")
var arrayExe4: [Int] = []
var maior = Int.min
var menor = Int.max
for _ in 0..<50 {
    arrayExe4.append(Int.random(in: Int.min...Int.max))
}

for numExe4 in arrayExe4 {
    if (numExe4 < menor) {
        menor = numExe4;
    }
    
    if (numExe4 > maior) {
        maior = numExe4
    }
}

print("Menor número: ", menor)
print("Maior número: ", maior)

// 5
print("\n - EXE 5 =============================================== \n")
for _ in 0..<4 {
    let n = Int.random(in: 1...10)
    print("\nTabuada do \(n): (até o quadrado de seu valor. EX: n * n)")
    for i in 1...n {
        print("\(n) x \(i) = \(n*i)")
    }
}

// 6
print("\n - EXE 6 =============================================== \n")
var result = 0
for numExe6 in 92...1478 {
    var div = 0
    for divForExe6 in 1...numExe6 {
        if (numExe6 % divForExe6 == 0) {
            div += 1
        }
    }
    if (div == 2) {
        result += numExe6
    }
}
print(result)

// 7
print("\n - EXE 7 =============================================== \n")
var arrayExe7: [Int] = []

for _ in 1...10 {
    arrayExe7.append(Int.random(in: 1...10))
}
arrayExe7.sort()
print(arrayExe7)
