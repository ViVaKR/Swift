import Foundation

func help() {
    print("Helper's help")
}

// (1)
func greet(person: [String: String]) {
    print(person)
    guard let name = person["name"] else {
        return
    }

    print("Hello, \(name) World!")
}

// (2)
func greet(person: String, alreadyGreeted: Bool) -> String {
    let greeting = "Hello, \(person) World!"
    return alreadyGreeted ? greeting : "\(greeting)\n\nHello again, Jun!"
}

// 문자 반복
func repeatCharacter(_ char: Character, count: Int) -> String {
    guard count >= 0 else {
        return ""
    }
    return String(repeating: String(char), count: count)
}

// (3) 배열 최소/최대 - 1
func minMax(_ numbers: [Int]) -> (min: Int, max: Int) {
    guard !numbers.isEmpty else {
        return (min: Int.max, max: Int.min)
    }

    return numbers.reduce((min: numbers[0], max: numbers[0])) { currentResult, number in
        let newMin = min(currentResult.min, number)
        let newMax = max(currentResult.max, number)
        return (min: newMin, max: newMax)
    }
}

// (4) 렌덤함수 (1분 10 까지)

func randomNumber() -> Int {
    return Int.random(in: 1 ... 10)
}

// (5) reduce
func stringReduce(_ string: [String]) -> String {
    let sentence = string.reduce("") { currentResult, word in
        currentResult + word + " "
    }
    return sentence
}

// (6) 배열의 최소/최대 - 2
func minMax(array numbers: [Int]) -> (min: Int, max: Int)? {
    if numbers.isEmpty {
        return nil
    }
    var currentMin = numbers[0]
    var currentMax = numbers[0]

    for value in numbers[1 ..< numbers.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

// (7) 산술평균, Arithmetic Mean
func arithmeticMean(_ numbers: Double...) -> Double {
    var total: Double = 0

    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}

// (8) swap
func swapInts(_ a: inout Int, _ b: inout Int) {
    let temp = a
    a = b
    b = temp
}

// (9)
func addTwoInts(_ a: Int, _ b: Int) -> Int {
    return a + b
}

// (10)
func printMathResult(_ mathFunc: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    //
    print("Result: \(mathFunc(a, b))")
}

// (11) 함수 반환
func stepForward(_ input: Int) -> Int {
    return input + 1
}

func stepBackward(_ input: Int) -> Int {
    return input - 1
}

func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    return backward ? stepBackward : stepForward
}

func chooseStepFunctionNested(backward: Bool) -> (Int) -> Int {
    func forward(input: Int) -> Int { return input + 1 }
    func back(input: Int) -> Int { return input - 1 }
    return backward ? back : forward
}

// (14)
func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

func enumeratePoint(_ point: CompassPoint) {
    switch point {
    case .north:
        print("Lots of planets have a north")
    case .east:
        print("Where the sun rises")
    case .south:
        print("Watch out for penguins")
    case .west:
        print("Where the skies are blue")
    }

    let numberOfChoice = Planet.allCases.count
    print("Enum Count: \(numberOfChoice)")

    for planet in Planet.allCases {
        print("Planet: \(planet)")
    }
}

func productBarcode(_ barCode: Barcode) {
    //
    switch barCode {
    case let .upc(numberSytem, manufacturer, product, check):
        print("UPC: \(numberSytem), \(manufacturer), \(product), \(check)")

    case let .qrCode(productCode):
        print("QR code: \(productCode)")
    }
}
