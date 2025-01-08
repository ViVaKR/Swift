import Foundation

// (1) 시작점
class EntryPoint {
    func displayMenu() {
        let menus: [Int: String] = [
            1: "시작\t",
            2: "함수\t",
            3: "최대최소",
            4: "렌덤함수",
            5: "Reduce",
            6: "최대최소",
            7: "산술평균",
            8: "스왑\t",
            9: "함수전달1",
            10: "함수전달2",
            11: "함수반환1",
            12: "클로우저1",
            13: "클로우저2",
            14: "함수반환2",
            15: "Enum\t",
            16: "구조체",
            100: "Exit"
        ]
        print(repeatCharacter("-", count: 100))
        for menu in menus.sorted(by: { $0.key < $1.key }) {
            let (key, value) = menu
            let str = String(format: "%3d. %@", arguments: [key, value])
            print(str, terminator: key % 5 != 0 ? "\t\t" : "\n")
        }
        print(repeatCharacter("-", count: 100))
    }

    func start() {
        while true {
            displayMenu()
            
            print("\n메뉴선택:", terminator: "\t")
            
            let input = readLine()!
            
            if input == "100" {
                break
            }
            
            print(repeatCharacter("\u{2236}", count: 100))
            
            switch input {
            case "1":
                greet(person: ["name": "John"])
            case "2":
                print(greet(person: "Kim Bun Jun", alreadyGreeted: true))
            case "3":
                let numbers = [3, 1, 4, 1, 5, 9]
                let result = minMax(numbers)
                print("Min: \(result.min), Max: \(result.max)") // Min: 1, Max: 9
            case "4": // 렌덤함수
                print("1 - 10 사이의 랜덤한 숫자:", randomNumber())
            case "5":
                print(stringReduce(["Hello", "World", "Fine", "Thanks", "And", "You", "?"]))
            case "6": // 최대/최소
                let numbers = [102, 94, 5, 204, 9, 15, 38]
                let result = minMax(array: numbers)!
                print("Min: \(result.min), Max: \(result.max)")
            case "7": // 산술평균
                let result: Double = arithmeticMean(3, 8.25, 18.34, 3.1241592)
                print("평균 값: \(result)")
            case "8":
                var a = 12
                var b = 34
                print("원본 -> ", "a: \(a), b: \(b)")
                swapInts(&a, &b)
                print("스왑 -> ", "a: \(a), b: \(b)")
            case "9": // 함수전달 1
                let mathFunc: (Int, Int) -> Int = addTwoInts
                print(mathFunc(34, 67))
            case "10": // 함수전달 2, 델리게이트
                let a = 123
                let b = 456
                printMathResult(addTwoInts, a, b)
                let fn = addTwoInts
                printMathResult(fn, 45, 55)
            case "11": // 함수전달, 델리게이트
                var currentValue = 3
                let moveneareToZero = chooseStepFunction(backward: currentValue > 0)
                let result = moveneareToZero(currentValue)
                print("\(currentValue) -> \(result)")
                currentValue = 5
                print("Counting to zero")
                while currentValue != 0 {
                    print("\(currentValue)...")
                    currentValue = moveneareToZero(currentValue)
                }
                print("zero!")
                
                currentValue = -4
                let moveneareToZero2 = chooseStepFunctionNested(backward: currentValue > 0)
                while currentValue != 0 {
                    print("\(currentValue)...")
                    currentValue = moveneareToZero2(currentValue)
                }
                print("zero")
            case "12": // Closure, 클로우저 1
                
                // --> 반환 타입 추론
                let add = { (a: Int, b: Int) in
                    a + b
                }
                let result = add(3, 4)
                print("\(result)")
                let multiply: (Int, Int) -> Int = { $0 * $1 }
                print(multiply(12, 8))
                
                // -->
                let numbers = Array(1 ... 5)
                let sum = numbers.map { $0 * $0 }
                print("Sum: ", sum)
            // -->
            case "13": // Closure, 클로우저 2
                let numbers = [59, 1, 17, 2, 3, 4, 5, 6, 7, 8, 9]
                let squared = numbers.map { $0 * $0 }
                print(squared)
                
                let filtered = numbers.filter { $0 % 2 == 0 }
                print(filtered)
                
                let hello = { message in
                    print(message)
                }
                
                hello("Hello, World!")
                
                let arr = numbers.sorted { $0 > $1 }
                let arr2 = numbers.sorted(by: { a, b in a < b })
                let arr3 = numbers.sorted(by: >)
                print(arr)
                print(arr2)
                print(arr3)
            case "14": // 함수반환 : 누적합계
                let incrementByTen = makeIncrementer(forIncrement: 10)
                for _ in 1 ... 3 {
                    let result = incrementByTen()
                    print(result)
                }
            case "15": // Enum
                let direction: CompassPoint = .east
                enumeratePoint(direction)
                
                var barCode = Barcode.upc(8, 85909, 51226, 3)
                productBarcode(barCode)
                barCode = .qrCode("KIM BUM JUN")
                productBarcode(barCode)
            case "16":
                let someResolution = Resolution(width: 30, height: 30)
                var cinema = someResolution
                cinema.width = 40
                print(someResolution.width, someResolution.height)
                print(cinema.width, cinema.height)
            case "100":
                print("Exit")
            default: break
            }
            print(repeatCharacter("\u{2236}", count: 100))
        }
    }
}
