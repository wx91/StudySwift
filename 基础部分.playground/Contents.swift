//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let maximumNumberOfLoginAttempts=10
var currentLoginAttempt=0
var x=0.0,y=0.0,z=0.0

var welcomeMessage:String
welcomeMessage="Hello"

var red,green,blue:Double

let π =  3.14159
let 你好 = "你好世界"
let 🐶🐮 = "dogcow"
var friendlyWelcome = "Hello!"
friendlyWelcome="Bonjour!"

let languageName="Swift"
//languageName="Swift++"
print(friendlyWelcome)
//这是一个注释
/*这是一个
多行注释*/
/*这是第一个多上注释的开头
/*这是第二个被嵌套的多行注释*/
这是第一个多行注释的结尾*/
let cat="🐱";print(cat)

let minValue=UInt8.min
let maxValue=UInt8.max

let meaningOfLife=42
let PI=3.14159
let anotherPI=3+0.14159

let decimalInteger=17
let binaryInteger=0b10001   //二进制的17
let octalInteger=0o21       //八进制的17
let hexadecimalInteger=0x11 //十六进制17

let decimalDouble=12.1875
let exponentDouble=1.21876e1
let hexadecimalDouble=0xC.3p0

let paddedDouble=000123.456
let oneMillion=1_000_000
let justOverOneMillion=1_000_000.000_000_1

//let cannotBeNegative:UInt8 = -1
//UInt8类型不能存储负数，所以会报错
//let tooBig:Int8 = Int8.max+1
//Int8类型不能存储超过最大值的数，所以会报错

let twoThousand:UInt16=2_000
let one:UInt8=1
let twoThousandAndOne=twoThousand+UInt16(one)


let three = 3
let pointOneFourOneFiveNine = 0.14159
let pi=Double(three)+pointOneFourOneFiveNine

let integerPi=Int(pi)
//类型别名
typealias AudioSample = UInt16

var maxAmplitudeFound=AudioSample.min
//等价与UInt16.min

let orangesAareOrange = true
let turnipsAreDelicious = false
if turnipsAreDelicious {
    print("Mmm,tasty turnips")
}else{
    print("Eww,turnips are horrible")
}

let i=1
//if i {} 会报错
if i==1{}
//元组
let http404Error=(404,"Not Found")
//(Int,String)
let (statusCode,statusMessage)=http404Error
print("The status code is \(statusCode)")
print("The status message is \(statusMessage)")

let (justTheStatusCode,_)=http404Error
print("The status code is \(justTheStatusCode)")

print("The status code is \(http404Error.0)")
print("The status message is \(http404Error.1)")

let http200Status=(statusCode:200,description:"OK")
print("The status code is \(http200Status.statusCode)")
print("The status message is \(http200Status.description)")

let possibleNumber="123"
let convertedNumber=Int(possibleNumber)
//convertedNumber被推测为类型 Int?或者 optional Int
var serverResponseCode:Int?=404
serverResponseCode=nil
var surveyAnswer:String?
if convertedNumber != nil{
    print("convertedNumber contains some integer value");
}
if convertedNumber != nil{
    print("convertedNumber has an integer value of \(convertedNumber)");
}

if let actualNumber = Int(possibleNumber){
    print("\'\(possibleNumber)\' has an integer value of \(actualNumber)");
}else{
    print("\'(possibleNumber)\' could not be converted to an integer")
}
if let firstNumber=Int("4"),secondNumber=Int("42") where firstNumber<secondNumber{
    print("\(firstNumber)<\(secondNumber)")
}

let possibleString:String?="An optional string."
let forcedString:String=possibleString!
//需要！来获取值

let assumedString:String!="An implicitly unwrapped optional Stirng."
let implicitString:String=assumedString
if assumedString != nil{
    print(assumedString)
}
if let definiteString = assumedString {
    print(definiteString)
}

//断言
let age = 3
assert(age >= 0 , "A person's age cannot be less than zero")

