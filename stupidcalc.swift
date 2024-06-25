import Foundation

func inefficientAddition(_ a: Int, _ b: Int) -> Int {
    var sum = 0
    for _ in 0..<a {
        sum += 1
    }
    for _ in 0..<b {
        sum += 1
    }
    return sum
}

func inefficientSubtraction(_ a: Int, _ b: Int) -> Int {
    var result = a
    for _ in 0..<b {
        result -= 1
    }
    return result
}

func inefficientMultiplication(_ a: Int, _ b: Int) -> Int {
    var product = 0
    for _ in 0..<b {
        for _ in 0..<a {
            product += 1
        }
    }
    return product
}

func inefficientDivision(_ a: Int, _ b: Int) -> Int {
    guard b != 0 else {
        print("Error: Division by zero")
        return 0
    }
    var quotient = 0
    var temp = a
    while temp >= b {
        temp = inefficientSubtraction(temp, b)
        quotient += 1
    }
    return quotient
}

func main() {
    let arguments = CommandLine.arguments
    guard arguments.count == 4 else {
        print("Usage: calc <number1> <operator> <number2>")
        return
    }
    
    guard let number1 = Int(arguments[1]), let number2 = Int(arguments[3]) else {
        print("Error: Both operands must be integers.")
        return
    }
    
    let operatorSymbol = arguments[2]
    var result: Int = 0
    
    switch operatorSymbol {
    case "+":
        result = inefficientAddition(number1, number2)
    case "-":
        result = inefficientSubtraction(number1, number2)
    case "*":
        result = inefficientMultiplication(number1, number2)
    case "/":
        result = inefficientDivision(number1, number2)
    default:
        print("Error: Unsupported operator. Use +, -, *, or /.")
        return
    }
    
    print("Result: \(result)")
}

main()
