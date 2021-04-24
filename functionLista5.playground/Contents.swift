import UIKit

var str = "Rafael Augusto Pena Pereira Mesquita - 11901322"

// 1
print("\n===EXE 1 =================================== \n")
func exe1(num: Int) -> Int {
    var response = 0
    for div in 1...num {
        if (num % div == 0) {
            response += 1
        }
    }
    return response
}
print(exe1(num: 52))

// 2
print("\n===EXE 2 =================================== \n")
func exe2(num: Int) -> Bool {
    if (num >= 0) {
        return true
    } else {
        return false
    }
}
print(exe2(num: -1))

// 3
print("\n===EXE 3 =================================== \n")
func exe3(num: Double) -> String {
    if (num >= 9 && num <= 10) {
        return "A"
    }
    if (num >= 7 && num <= 8.9) {
        return "B"
    }
    if (num >= 5 && num <= 6.9) {
        return "C"
    }
    if (num >= 0 && num <= 4.9) {
        return "D"
    }
    return "Nota inválida"
}
print(exe3(num: 7))

// 4
print("\n===EXE 4 =================================== \n")
func exe4(array: [Int]) -> Int {
    var response = 0
    for num in array {
        response += num
    }
    return response
}
print(exe4(array: [2, 3, 26, 37, 38, 48, 60, 62, 75, 78]))

// 5
print("\n===EXE 5 =================================== \n")
func exe5(num: Int, array: [Int]) {
    var responseArray = array
    for (index, numArray) in array.enumerated() {
        responseArray[index] = numArray * num
    }
    print(responseArray)
}
exe5(num: 2, array: [2, 3, 26, 37, 38, 48, 60, 62, 75, 78])

// 6
print("\n===EXE 6 =================================== \n")
func exe6(_ nums: Int...) {
    var arrayCalc = nums
    for (index, num) in arrayCalc.enumerated() {
        arrayCalc[index] = num / 2
        print(arrayCalc[index])
        if arrayCalc[index] >= 1 {
            exe6(arrayCalc[index])
        } else {
            print("END CALC")
        }
    }
}
exe6(52, 20)
