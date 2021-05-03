import UIKit

/*
AUTOR DO PROJETO
 Número de matrícula: 11901322
 Número de chamada: 46
 Nome completo: Rafael Augusto Pena Pereira Mesquita
*/

// Constante de controle: quantidade de personagens
let quantCharacter = Int.random(in: 1...10)

// Constante de controle: tipo dos personagens
let type = ["A", "E", "H", "M", "X"]

// Constante de controle: caracteres para gerar nome do personagem
let caracToGenerate = "abcdefghijklmnopqrstuvwxyz"

// Função: geradora de personagem
func randomicCharacter() -> String {
    var name = ""
    for _ in 1...8 {
        name.append(caracToGenerate.randomElement()!)
    }
    let characterType = type.randomElement()!
    let response = "\(name) \(characterType)"
    return response
}

// Variável de controle: array que receberá as entradas
var characterArray: [String] = []

// Loop: gerador de entrada
for _ in 1...quantCharacter {
    characterArray.append(randomicCharacter())
}

var countHobbit = 0
var countHumano = 0
var countElfo = 0
var countAnao = 0
var countMago = 0

// Loop: classificador de personagem
for item in characterArray {
    // Constante de controle: responsável por pegar o caracter classificador da string do personagem
    let characterType = item.split(separator: " ", maxSplits: 1, omittingEmptySubsequences: false)[1]
    switch characterType {
    case "A":
        countAnao += 1
    case "E":
        countElfo += 1
    case "H":
        countHumano += 1
    case "M":
        countMago += 1
    case "X":
        countHobbit += 1
    default:
        continue
    }
}

// Constante de resposta
let response = "\(countHobbit) Hobbit (s)\n\(countHumano) Humano (s)\n\(countElfo) Elfo (s)\n\(countAnao) Anao (s)\n\(countMago) Mago (s)"

// Print da resposta
print(response)

