//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//扩展语法
//extension SomeType{
    //加到SomeType的新功能写到这里
//}
//一个扩展可以扩展一个已有类型，使其能够适配一个或多个协议
//extension SomeType:SomeProtocol,AnohterProtocol{
    //协议实现写在这里
//}

//计算属性
extension Double{
    var km:Double{
        return self*1_000.0
    }
    var m : Double{
        return self
    }
    var cm : Double{
        return self/100.0
    }
    var mm : Double{
        return self/1_000.0
    }
    var ft : Double{
        return self/3.28084
    }
}
let oneInch = 25.4.mm
print("One inch is  \(oneInch) meters")
let threeFeet = 3.ft
print("Three feet is \(threeFeet) meters")
let aMarathon = 42.km+195.m
print("A marathon is \(aMarathon) meters long")

//构造器
struct Size{
    var width = 0.0 , height = 0.0
}
struct Point{
    var x = 0.0 , y = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
}
let defaultRect = Rect()
let memberwiseRect = Rect(origin: Point(x: 2.0, y: 2.0)
    , size: Size(width: 5.0, height: 5.0))
extension Rect{
    init(center:Point,size:Size){
        let originX = center.x - (size.width/2)
        let originY = center.y - (size.height/2)
        self.init(origin:Point(x: originX, y: originY),size:size)
    }
}
let centerRect = Rect(center: Point(x: 4.0, y: 4.0),
    size: Size(width: 3.0, height: 3.0))

//方法
extension Int{
    func repetitions(task:() -> ()){
        for _ in 0..<self{
            task()
        }
    }
}
3.repetitions { () -> () in
    print("hello!")
}
3.repetitions({
  print("hello!")
})
3.repetitions{
    print("GoodBye!")
}
//修改实例方法
extension Int{
    mutating func square(){
        self = self*self
    }
}
var someInt = 3
someInt.square()

//下标
extension Int{
    subscript(var digitIndex:Int) -> Int{
        var decimalBase = 1
        while digitIndex > 0{
            decimalBase *= 10
            --digitIndex
        }
        return (self/decimalBase)%10
    }
}

746381295[0]
746381295[1]
746381295[2]
746381295[8]

746381295[9]

0746381295[9]


//嵌套类型
extension Int{
    enum Kind {
        case negative , Zero , Positive
    }
    var kind:Kind{
        switch self{
        case 0:
            return .Zero
        case let x  where x>0:
            return .Positive
        default:
            return .negative
        }
    }
}
func printIntegerKinds(numbers:[Int]){
    for number in numbers {
        switch number.kind{
        case .negative:
            print("-")
        case .Zero:
            print("0")
        case .Positive:
            print("+")
        }
    }
    print("")
}
printIntegerKinds([3,19,-2,0,-6,0,7])



