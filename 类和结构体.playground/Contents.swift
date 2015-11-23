//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

struct Resolution {
    var width = 0
    var height = 0
}
class VideoMode {
    var resolution = Resolution()
    var interIaced = false
    var frameRate = 0.0
    var name:String?
}

let someResolution = Resolution()
let someVideoMode = VideoMode()

print("The width of SomeResolution is  \(someResolution.width)")
print("The width of SomeVideoMode  is  \(someVideoMode.resolution.width)")
someVideoMode.resolution.width = 1280
print("The width of SomeVideoMode  is now  \(someVideoMode.resolution.width)")

let vga = Resolution(width: 640, height: 480)
let hd = Resolution(width: 1920, height: 1080)
var cinema = hd
cinema.width = 2048
print("cinema is now \(cinema.width) pixels wide")
print("hd is still \(hd.width) pixels wide")

enum CompassPoint {
    case North , South ,East ,West
}
var currentDirection = CompassPoint.West
let rememberedDirection = currentDirection
currentDirection = .East
if rememberedDirection == .West {
    print("The remembered direction is stll .West")
}

let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interIaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0
let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0
print("The frameRate property of tenEighty is now \(tenEighty.frameRate)")

if tenEighty === alsoTenEighty {
    print("tenEight and also TenEighty refer to the same Resulition instance.")
}



