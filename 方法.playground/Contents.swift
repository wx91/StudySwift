//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//class Counter{
//    var count = 0
//    func increment(){
//        ++count
//    }
//    func incrementBy(amount:Int){
//        count += amount
//    }
//    func reset(){
//        count = 0
//    }
//}
//let counter = Counter()
//counter.increment()
//counter.incrementBy(5)
//counter.reset()

class Counter{
    var count:Int = 0
    func incrementBy(amount:Int,numberOfTimes:Int){
    count += amount*numberOfTimes
    }
    func increment(){
        self.count++
    }
}
let counter = Counter()
counter.incrementBy(5, numberOfTimes: 3)

//struct Point{
//    var x = 0.0 , y = 0.0
//    func isToTheRightOfX(x:Double) ->Bool {
//        return self.x > x
//    }
//}
//let somePoint = Point(x:4.0,y:5.0)
//if somePoint.isToTheRightOfX(1.0){
//    print("This point is to the right of the line where x == 1.0")
//}
//结构体和枚举是值类型。一般情况下，值类型的属性不能在它的实例方法中被修改。
//如果确定要修改可以使用mutating

//struct Point {
//    var x = 0.0,y = 0.0
//    mutating func moveByX(deltaX:Double,deltaY:Double){
//        x += deltaX
//        y += deltaY
//    }
//}
//var somePoint = Point(x: 1.0, y: 1.0)
//somePoint.moveByX(2.0, deltaY: 3.0)
//print("The Point is now at (\(somePoint.x),\(somePoint.y))")
//
////结构体常量不能调用mutating方法
//let fixedPoint = Point(x: 3.0, y: 3.0)
//fixedPoint.moveByX(2.0, deltaY: 3.0)


struct Point {
    var x = 0.0,y = 0.0
    mutating func moveByX(deltaX:Double,deltaY:Double){
        self = Point(x:x+deltaX,y: y+deltaY)
    }
}

enum TriStateSwitch {
    case Off,Low,High
    
    mutating func next(){
        switch self{
        case .Off:
            self = .Low
        case .Low:
            self = .High
        case .High:
            self = .Off
        }
    }
}

var ovenLight = TriStateSwitch.Low
ovenLight.next()
ovenLight.next()

class SomeClass {
    static func someTypeMethod(){
        
    }
}
SomeClass.someTypeMethod()

struct LevelTracker {
    static var highestUnlockedLevel = 1
    static func unlockLevel(level:Int){
        if level > highestUnlockedLevel {
            highestUnlockedLevel = level
        }
    }
    static func levellsUnlocked(level:Int) -> Bool{
        return level <= highestUnlockedLevel
    }
    var currentLevel = 1
    mutating func advanceToLevel(level:Int) -> Bool{
        if LevelTracker.levellsUnlocked(level){
            currentLevel = level
            return true
        }else{
            return false
        }
    }
}


class Player{
    var tracker = LevelTracker()
    let playerName:String
    func completedLevel(level:Int){
        LevelTracker.unlockLevel(level+1)
        tracker.advanceToLevel(level+1)
    }
    init(name:String){
        playerName = name
    }
}

var player = Player(name: "Argyrios")
player.completedLevel(1)
print("highest unlocked level is now \(LevelTracker.highestUnlockedLevel)")
player = Player(name:"Beto")
if player.tracker.advanceToLevel(6){
    print("player is now no level 6")
}else{
    print("level 6 has not yet been unlock")
}




