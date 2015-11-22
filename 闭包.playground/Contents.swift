//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let names = ["Chris","Alex","Ewa","Barry","Daniella"]

func backwards(s1:String,s2:String) -> Bool{
    return s1>s2
}
var reversed = names.sort(backwards)

reversed = names.sort({(s1:String , s2:String) -> Bool in
    return s1>s2
});

reversed = names.sort({s1,s2 in return s1 > s2})
reversed = names.sort({$0 > $1})
reversed = names.sort(>)
reversed = names.sort(){$0 > $1}

let digitNames = [0:"Zore",1:"One",2:"Two",3:"Threee",4:"Four",
    5:"Five",6:"Six",7:"Seven",8:"Eight",9:"Nine"]
let numbers = [16,58,510]

let strings = numbers.map{
    (var number) -> String in
    var output = ""
    while number > 0{
        output = digitNames[number % 10]!+output
        number /= 10
    }
    return output
}
func makeIncrementor(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementor() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementor
}

let incrementByTen = makeIncrementor(forIncrement: 10)
incrementByTen()
incrementByTen()
incrementByTen()

let incrementBySeven =  makeIncrementor(forIncrement: 7)
incrementBySeven()
incrementByTen()
let alsoIncrementByTen = incrementByTen
alsoIncrementByTen()



