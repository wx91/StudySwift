//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//存储属性
struct FixedLengthRange {
    var firstValue:Int
    let length:Int
}
var rangeOfThreeItems=FixedLengthRange(firstValue: 0, length: 3)
rangeOfThreeItems.firstValue = 6

let rangeOfFourItems = FixedLengthRange(firstValue: 0, length: 4)
//错误 let关键字 常量
//rangeOfFourItems.firstValue = 6
//当值类型实例被声明为常量的时候，他所有属性也就成了常量
//把一个引用类型的实例赋值给一个常量后，仍然可以修改该实例的变量属性
//延迟存储属性
class DataImporter {
    /**
    *  DataImporter 是一个将外部文件中的数据导入的类。
    *  则个类的初始化会消耗不少时间
    */
    var fileName = "data.txt"
    //这里提供数据导入功能
}
class DataManager {
    lazy var importer = DataImporter()
    var data = [String]()
    //这里提供数据管理功能
}
let manager = DataManager()
manager.data.append("Some data")
manager.data.append("Some more Data")
print(manager.importer.fileName)

//计算属性
struct Point {
    var x=0.0,y=0.0
}
struct Size {
    var width = 0.0 , height = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
    var center:Point {
        get{
            let centerX = origin.x+(size.width/2)
            let centerY = origin.y+(size.height/2)
            return Point(x:centerX,y:centerY)
        }
        set(newCenter){
            origin.x = newCenter.x - (size.width/2)
            origin.y = newCenter.y - (size.height/2)
        }
    }
}
var square = Rect(origin: Point(x:0.0,y:0.0), size: Size(width: 10.0, height: 10.0))
let initalSquareCenter = square.center
square.center = Point(x:15.0,y:15.0)
print("square.origin is now at (\(square.origin.x),\(square.origin.y))")

struct AlternativeRect {
    var origin = Point()
    var size = Size()
    var center : Point{
        get{
            let centerX = origin.x+(size.width/2)
            let centerY = origin.y+(size.height/2)
            return Point(x: centerX, y: centerY)
        }
        set{
            origin.x = newValue.x - (size.width/2)
            origin.y = newValue.y - (size.height/2)
        }
    }
}
struct Cuboid {
    var width = 0.0,height = 0.0 ,depth = 0.0
    var volume:Double {
        return width*height*depth
    }
}
let fourByFieveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
print("The volume of fourByFiveByTwo is \(fourByFieveByTwo.volume)")


//属性观察器
class StepCounter {
    var totalSteps:Int = 0 {
            willSet(newTotalSteps){
                print("About to set totalSteps to \(newTotalSteps)")
            }
            didSet{
                if totalSteps > oldValue {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}
let stepCounter = StepCounter()
stepCounter.totalSteps = 200
stepCounter.totalSteps = 360
stepCounter.totalSteps = 896

struct SomeStructure {
    static var storedTypeProperty = "Some Value."
    static var computedTypeProperty:Int{
        return 1
    }
}
enum SomeEnumeration {
    static var storedTypeProperty = "Some Value."
    static var computedTypeProperty:Int{
        return 6
    }
}

class SomeClass{
    static var storedTypeProperty = "Some Value."
    static var  computedTypeProperty:Int{
        return 27
    }
    class var overrideablecomputedTypeProperty:Int{
        return 107
    }
}

print(SomeStructure.storedTypeProperty)
SomeStructure.storedTypeProperty = "Another value."
print(SomeStructure.storedTypeProperty)
print(SomeEnumeration.computedTypeProperty)
print(SomeClass.computedTypeProperty)

struct AudioChannel{
    static let thresholdLevel = 10
    static var maxInputLevelForAllChannels = 0
    var currentLevel:Int=0{
        didSet{
            if currentLevel > AudioChannel.thresholdLevel{
                currentLevel = AudioChannel.thresholdLevel
            }
            if currentLevel < AudioChannel.maxInputLevelForAllChannels{
                AudioChannel.maxInputLevelForAllChannels = currentLevel
            }
        }
    }
}

var leftChannel = AudioChannel()
var rigthChannel = AudioChannel()
leftChannel.currentLevel = 7
print(leftChannel.currentLevel)
print(AudioChannel.maxInputLevelForAllChannels)
rigthChannel.currentLevel = 11
print(rigthChannel.currentLevel)
print(AudioChannel.maxInputLevelForAllChannels)