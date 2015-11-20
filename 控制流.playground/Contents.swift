//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
//for
for index in 1...5 {
    print("\(index) times 5 is  \(index*5)")
}

let base = 3
let power = 10
var answer = 1
for  _ in 1...power {
    answer*=base
}
print("\(base) to the power of \(power) is \(answer)")

let names = ["Anna","Alex","Brian","Jack"]
for name in names {
    print("Hello,\(name)!")
}

let numberOfLegs = ["Spider":8,"ant":6,"cat":4]
for (animalName,legCount) in numberOfLegs {
    print("\(animalName)s have \(legCount) legs")
}

for var index = 0;index<3;++index {
    print("index is \(index)")
}
var index:Int
for index = 0;index<3;++index {
    print("index is \(index)")
}
print("The loop statements were executed \(index) times.")

//while

let finalSquare = 25
var board = [Int](count: finalSquare+1, repeatedValue: 0)
board[03] = +08; board[06] = +11;board[09] = +09;board[10] = +02
board[14] = -10; board[19] = -11;board[22] = -02;board[24] = -08

var square = 0
var diceRoll = 0
while square < finalSquare {
    if ++diceRoll == 7 { diceRoll==1 }
    square+=diceRoll
    if square < board.count {
        square+=board[square]
    }
}
print("Game over")

square = 0
diceRoll = 0
repeat{
    square += board[square]
    if ++diceRoll == 7{
        diceRoll=1
    }
    square+=diceRoll
}while square<finalSquare
print("Game over")

//条件语句
var temperatureInFahrenheit = 30
if temperatureInFahrenheit <= 32{
    print("It's very cold .Consider waearing a scarf.")
}

temperatureInFahrenheit = 40
if temperatureInFahrenheit <= 32{
    print("It's very cold .Consider waearing a scarf.")
}else{
    print("It's not that cold,Wearing a t-shirt.")
}

temperatureInFahrenheit = 90
if temperatureInFahrenheit <= 32{
    print("It's very cold .Consider waearing a scarf.")
}else if temperatureInFahrenheit >= 86{
    print("It's really warm.Don't forget to wear sunscreen")
}else{
    print("It's not that cold,Wearing a t-shirt.")
}
temperatureInFahrenheit = 90
if temperatureInFahrenheit <= 32{
    print("It's very cold .Consider waearing a scarf.")
}else if temperatureInFahrenheit >= 86{
    print("It's really warm.Don't forget to wear sunscreen")
}

let someCharacter:Character = "e"
switch someCharacter {
case "a","e","i","o","u":
    print("\(someCharacter) is a vowel")
case "b","c","d","f","g","h","j","k","i","m",
    "n","p","q","r","s","t","v","w","x","y","z":
    print("\(someCharacter) is consonant")
default:
    print("\(someCharacter) is not a vowel or a consonant.")
}






