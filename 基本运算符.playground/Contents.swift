//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
//赋值运算符
//let b=10
//var a=5
//a=b

let (x,y)=(1,2)
//算术运算法
//if x=y{} 错误 x=y并不返回任何值
1+2
5-3
2*3
10.0/2.5
"Hello,"+"World"

9%4

-9%4

8%2.5

var i=0
++i //先自增，在返回
i++ //先返回，后自增

var a = 0
let b = ++a
let c = a++

let three = 3
let miusThree = -three
let plusThree = -miusThree

let minusSix = -6
let alsoMinusSix = +minusSix

//var a=1
//复合赋值
a+=2
//比较运算符
1 == 1
2 != 1
2 > 1
1 < 2
1 >= 1
2 <= 1


let name = "world"
if name == "world" {
    print("hello,world")
}else{
    print("I'm sorry \(name),but I don't recognize you")
}
//三目运算父
let contentHeight=40
let hasHeader = true
let rowHeight = contentHeight+(hasHeader ? 50 : 20)

//空合运算符
let defaultColorName = "red"
var userDefinedColorName:String? //默认为nil
var colorNameToUse = userDefinedColorName ?? defaultColorName

userDefinedColorName="green"
colorNameToUse = userDefinedColorName ?? defaultColorName

//区间运算符
for index in 1...5{
    print("\(index)*5=\(index*5)")
}

let names=["Anna","Alex","Brian","Jack"]
let count = names.count

for i in 0..<count{
    print("第\(i+1)个人叫\(names[i])");
}
//逻辑运算
let allowEntry = false
if !allowEntry {
    print("access denied")
}

let enteredDoorCode =  true
let passedRetianScan = false
if enteredDoorCode && passedRetianScan{
    print("Welcome!")
}else{
    print("access denied")
}

let hasDoorKey = false
let knowOverridePassword = true
if hasDoorKey || knowOverridePassword {
    print("Welcome")
}else{
    print("Access Denied")
}
if enteredDoorCode && passedRetianScan || hasDoorKey || knowOverridePassword{
    print("Welcome")
}else{
    print("Access Denied")
}


if (enteredDoorCode && passedRetianScan) || hasDoorKey || knowOverridePassword{
    print("Welcome")
}else{
    print("Access Denied")
}




















