//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//函数的定义和调用
func sayHello(personName:String) -> String{
    let greeting = "Hello, " + personName + "!"
    return greeting
}
print(sayHello("Anna"))
print(sayHello("Brian"))

func sayHelloAgain(personName:String) -> String{
    return "Hello again, "+personName+"!"
}
print(sayHelloAgain("Anna"))


func halfOpenRangeLength(start:Int,end:Int) -> Int{
    return end-start
}
print(halfOpenRangeLength(1,end:10))

func sayHelloWorld() -> String{
    return "hello world"
}
print(sayHelloWorld())

func sayHello(personName:String , alreadyGreeted:Bool)->String{
    if alreadyGreeted {
        return sayHelloAgain(personName)
    }else{
        return sayHello(personName)
    }
}
print(sayHello("Tim",alreadyGreeted: true))

func sayGoodbye(personName:String){
    print("Goodbye,\(personName)")
}
sayGoodbye("Dave")

func printAndCount(stringToPrint:String)->Int{
    print(stringToPrint)
    return stringToPrint.characters.count
}
func printWithoutCounting(stringToPrint:String){
    printAndCount(stringToPrint)
}
printAndCount("hello,world")
printWithoutCounting("hello,world")


func minMax(array:[Int])->(min:Int,max:Int)?{
    if array.isEmpty { return nil}
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        }else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin,currentMax)
}

if let bounds = minMax([8,-6,2,109,3,71]){
    print("min is \(bounds.min) and max is  \(bounds.max)")
}

func someFunction(firstParameterName:Int,secondParameterName:Int){
    //function body goes here
    //firstParameterName and secondParameterName refer to
    //the argument values for the first and second parameters
}
func someFunction(exteranlParameterName localParameterName:Int){
    //function body goes here,and can use localParameterName
    //to refer to the argument value for that parameter
}
func sayHell(to person:String,and anotherPerson:String)->String{
    return "Hello \(person) and \(anotherPerson)!"
}
print(sayHell(to: "Bill", and: "Ted"))

func someFunction(firstParameterName:Int, _ secondParameterName:Int){
    //function body goes here
    //firstParameterName and secondParameterName refer to
    //the argument values for the first and second parameters
}
someFunction(1, 2)

func someFunction(parameterWithDefault:Int = 12){
    //function body goes here
    //if no arguments are passed to the function call,
    //value of parameterWithDefault is 12
}
someFunction(6)
someFunction()

func arithmeticMean(numbers:Double...)->Double{
    var total:Double = 0
    for number in numbers {
        total += number
    }
    return total/Double(numbers.count)
}
arithmeticMean(1,2,3,4,5)
arithmeticMean(3,8.25,18.75)

func alignRight(var string:String,totalLength:Int,pad:Character)->String{
    let amountToPad = totalLength - string.characters.count
    if amountToPad < 1{
        return string
    }
    let padString = String(pad)
    for _ in 1...amountToPad{
        string = padString+string
    }
    return string
}
let origianlString = "hello"
let paddedString = alignRight(origianlString, totalLength: 10, pad: "-")

func swapTwoInts(inout a:Int,inout _ b:Int){
    let temporaryA = a
    a = b
    b = temporaryA
}
var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")

func addTwoInts(a:Int,_ b:Int)->Int{
    return a+b
}
func multiplyTwoInts(a:Int,_ b:Int)->Int{
    return a*b
}
func printHelloWorld(){
    print("hello,world")
}

var mathFunction:(Int,Int)->Int=addTwoInts
print("Result:\(mathFunction(2,3))")
mathFunction=multiplyTwoInts
print("Result:\(mathFunction(2,3))")

func printMathResult(mathFunction:(Int,Int)->Int, _ a:Int, _ b:Int){
    print("Result:\(mathFunction(a,b))")
}
printMathResult(addTwoInts,3,5)

//func stepForward(input:Int) -> Int{
//    return input+1
//}
//func stepBackward(input:Int) -> Int{
//    return input-1
//}
//func chooseStepFunction(backwards:Bool)-> (Int)->Int{
//    return backwards ? stepBackward : stepForward
//}
//var currentValue = 3
//let moveNearerToZore = chooseStepFunction(currentValue>0)
//print("Counting to Zero")
//while currentValue != 0{
//    print("\(currentValue)...")
//    currentValue = moveNearerToZore(currentValue)
//}
func chooseStepFunction(backwards:Bool)-> (Int)->Int{
    func stepForward(input:Int) -> Int{
        return input+1
    }
    func stepBackward(input:Int) -> Int{
        return input-1
    }
    return backwards ? stepBackward : stepForward
}
var currentValue = -4
let moveNearerToZore = chooseStepFunction(currentValue>0)
print("Counting to Zero")
while currentValue != 0{
    print("\(currentValue)...")
    currentValue = moveNearerToZore(currentValue)
}
