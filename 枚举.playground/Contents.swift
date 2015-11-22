//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
//枚举语法
//enum CompassPoint {
//    case North
//    case South
//    case East
//    case West
//}

//enum Planent {
//    case Mercury,Venus,Earth,Mars,Jupiter,Saturn,Uranus,Neptune
//}
//var directionToHead = CompassPoint.West
//directionToHead = .East

//匹配枚举值得Switch语句
//directionToHead = .South
//switch directionToHead {
//case .North :
//    print("Lots of planets have a north")
//case .South:
//    print("Watch out for penguins")
//case .East:
//    print("Where the sun rise")
//case .West:
//    print("Where the skies are blue")
//}

//let somePlanet = Planent.Earth
//switch somePlanet {
//case .Earth:
//    print("Mostly harmless")
//default:
//    print("Not a safe place for humans")
//}
//相关值
enum Barcode {
    case UPCA(Int,Int,Int,Int)
    case QRCode(String)
}
var productBarcode = Barcode.UPCA(8, 85909, 51226, 3)
productBarcode = .QRCode("ABCDEFGHIJKLMNOP")

switch productBarcode {
case .UPCA(let numberSystem,let manufacture,let product,let check):
    print("UPC-A:\(numberSystem),\(manufacture),\(product),\(check)")
case .QRCode(let productCode):
    print("QR code : \(productCode)")
}

enum ASCIIControlCharacter:Character{
    case Tab = "\t"
    case LineFeed = "\n"
    case CarriageReturn = "\r"
}

enum Planent : Int{
    case Mercury=1 ,Venus,Earth,Mars,Jupiter,Saturn,Uranus,Neptune
}

enum CompassPoint : String{
    case North
    case South
    case East
    case West
}

let earthsOrder = Planent.Earth.rawValue
let sunsetDirection = CompassPoint.West.rawValue
let possiablePlant = Planent(rawValue: 7)
let positionToFind = 9
if let somePlant = Planent(rawValue: positionToFind){
    switch somePlant{
    case .Earth:
        print("Mostly harmless")
    default:
        print("Not a safe place for humans")
    }
}else{
    print("There isn't planet at position \(positionToFind)")
}

//enum ArithmeticExpression {
//    case Number(Int)
//    indirect case Addition(ArithmeticExpression,ArithmeticExpression)
//    indirect case Multiplication(ArithmeticExpression,ArithmeticExpression)
//}

indirect enum ArithmeticExpression {
    case Number(Int)
    case Addition(ArithmeticExpression,ArithmeticExpression)
    case Multiplication(ArithmeticExpression,ArithmeticExpression)
}

func evaluate(expression:ArithmeticExpression) -> Int{
    switch expression {
    case .Number(let value):
        return value
    case .Addition(let left, let right):
        return evaluate(left) + evaluate(right)
    case .Multiplication(let left, let right):
        return evaluate(left) * evaluate(right)
    }
}

let five = ArithmeticExpression.Number(5)
let four = ArithmeticExpression.Number(4)
let sum = ArithmeticExpression.Addition(five, four)
let product = ArithmeticExpression.Multiplication(sum, ArithmeticExpression.Number(2))
print(evaluate(product))
