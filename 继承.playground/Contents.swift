//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
//定义一个基类
class Vehicle {
    var currentSpeed = 0.0
    var description:String{
        return "traveling at \(currentSpeed) miles per hour"
    }
    func makeNoise(){
        
    }
}

let someVehicle = Vehicle()
print("Vehicle: \(someVehicle.description)")
//子类生成
class Bicycle:Vehicle{
    var hasBasket = false
}

let bicycle = Bicycle()
bicycle.hasBasket = true
bicycle.currentSpeed = 15.0
print("Bicycke: \(bicycle.description)")

class Tandem:Bicycle {
    var currentNumberOfPassengers = 0
}
let tandem = Tandem()
tandem.hasBasket = true
tandem.currentNumberOfPassengers = 2
tandem.currentSpeed = 22.0
print("Tandem: \(tandem.description)")
//重写 方法，属性，下标脚

class Train : Vehicle{
    override func makeNoise() {
        print("Choo Choo")
    }
}
let train = Train()
train.makeNoise()

class Car:Vehicle {
    var gear = 1
    override var description:String {
        return super.description + "in gear \(gear)"
    }
}
let car = Car()
car.currentSpeed = 25.0
car.gear = 3
print("Car : \(car.description)")

class AutomaticCar:Car{
    override var currentSpeed : Double{
        didSet{
            gear = Int(currentSpeed/10.0)+1
        }
    }
}
let automatic = AutomaticCar()
automatic.currentSpeed = 35.0
print("AutomaticCar:\(automatic.description)")



















