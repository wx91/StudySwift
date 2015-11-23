//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
//协议的语法
//protocol SomeProtocal{
    //协议内容
//}
//struct SomeStructure:FirstProtocol,AnotherProtocol{
    //结构体类型
//}
//如果类在遵守协议的同时，拥有父类，应该将父类名放在协议名的之前，以逗号分隔
//class SomeClass:SomeSuperClass,FirstProtocol,AnotherProtocol{
//  类的内容
//}
//对属性的规定 提供实例属性和类属性 不指定 存储型型属性和计算型属性
//protocol SomeProtocol{
//    var mustBeSettable:Int{get set}
//    var doesNotNeedToBeSettable:Int{get}
//}
protocol AnotherProrocol {
    static var SomeTypeProperty:Int{get set}
}
protocol FullyNamed{
    var fullName:String{get}
}
//struct Person:FullyNamed{
//    var fullName:String
//}
//let john = Person(fullName: "John Appleseed")

class Starship:FullyNamed{
    var prefix:String?
    var name:String
    init(name:String,prefix:String? = nil){
        self.name = name
        self.prefix = prefix
    }
    var fullName:String{
        return (prefix != nil ? prefix!: ":")+name
    }
}
var ncc1701 = Starship(name: "Enterprise",prefix: "USS")

//对方法的规定
//protocol SomeProtocol{
//    static func someTypeMethod()
//}
protocol RandomNumberGenerator{
    func random() -> Double
}
class LinearCongruentialGenerator:RandomNumberGenerator{
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    func random() -> Double {
        lastRandom = ((lastRandom*a+c)%m)
        return lastRandom/m
    }
}
let generator = LinearCongruentialGenerator()
print("Here's a random number:\(generator.random())")
print("And another one:\(generator.random())")

//对Mutating方法的规定
protocol Togglable{
    mutating func toggle()
}
enum OnOffSwitch:Togglable{
    case Off,On
    mutating func toggle() {
        switch self{
        case .Off:
            self = .On
        case .On:
            self = .Off
        }
    }
}

var lightSwitch = OnOffSwitch.Off
lightSwitch.toggle()

//对构造器的规定
//protocol SomeProtocol{
//    init(SomeParameter:Int)
//}
//class SomeClass:SomeProtocol{
//    required init(SomeParameter:Int){
//        构造器实现
//    }
//}
//protocol SomeProtocol{
//    init()
//}
//class SomeSuperClass{
//    init{
//        //构造器的实现
//    }
//}
//class SomeSubClass:SomeSuperClass,SomeProtocol{
//    //因为遵守协议，需要加上"required"；因为继承自父类，需要加上override
//    required override init(){
//        //构造器实现
//    }
//}

//协议类型
//协议可以像其他普通类型一样使用，使用场景：
//1.作为函数、方法或构造器中的参数或返回值类型
//2.作为常量、变量或属性的类型
//3.作为数组、字典或其他容器中的元素类型

class Dice{
    let sides:Int
    let generator:RandomNumberGenerator
    init(sides:Int,generator:RandomNumberGenerator){
        self.sides = sides
        self.generator = generator
    }
    func roll() -> Int{
        return Int(generator.random()*Double(sides))+1
    }
}
 var d6 = Dice(sides: 6, generator: LinearCongruentialGenerator())
for _ in 1...5 {
    print("Random dice roll is \(d6.roll())")
}


//委托代理模式
protocol DiceGame {
    var dice:Dice{get}
    func play()
}
protocol DiceGameDelegate {
    func gameDidStart(game:DiceGame)
    func game(game:DiceGame,didStartNewTurnWithDiceRoll diceRoll:Int)
    func gameDidEnd(game:DiceGame)
}
class SnakesAndLadders:DiceGame{
    let finalSquare = 25
    let dice = Dice(sides: 6, generator: LinearCongruentialGenerator())
    var square = 0
    var board:[Int]
    init(){
        board = [Int](count: finalSquare+1, repeatedValue: 0)
        board[03] = +08;board[06] = +11;board[09] = +09;board[10] = +02
        board[14] = -10;board[19] = -11;board[22] = -02;board[24] = -08
    }
    var delegate:DiceGameDelegate?
    func play() {
        square = 0
        delegate?.gameDidStart(self)
        gameLoop:while square != finalSquare{
            let diceRoll = dice.roll()
            delegate?.game(self, didStartNewTurnWithDiceRoll: diceRoll)
            switch square + diceRoll {
            case finalSquare:
                break gameLoop
            case let newSqaure where newSqaure > finalSquare:
                continue gameLoop
            default:
                square += diceRoll
                square += board[square]
            }
        }
        delegate?.gameDidEnd(self)
    }
}
class DiceGameTracker:DiceGameDelegate{
    var numberOfTurns = 0
    func gameDidStart(game: DiceGame) {
        numberOfTurns = 0
        if game is SnakesAndLadders{
            print("Started a new game of Snake and Ladders")
        }
        print("The game is using a \(game.dice.sides)-sided dice")
    }
    func game(game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int) {
        ++numberOfTurns
        print("Rolled a \(diceRoll)")
    }
    func gameDidEnd(game: DiceGame) {
        print("The game lasted for \(numberOfTurns) turns")
    }
}
let tracker = DiceGameTracker()
let game = SnakesAndLadders()
game.delegate = tracker
game.play()

//在扩展中添加协议成员
protocol TextRepressentable{
    func asText() -> String
}
extension Dice:TextRepressentable{
    func asText() -> String {
        return "A \(sides)-sided dice"
    }
}
let d12 = Dice(sides: 12, generator: LinearCongruentialGenerator())
print(d12.asText())
extension SnakesAndLadders : TextRepressentable{
    func asText() -> String {
        return "A game of Snake and Ladders wit \(finalSquare) squares"
    }
}
print(game.asText())

//通过扩展补充协议声明
struct Hamster{
    var name:String
    func asText() -> String{
        return "A hamster named \(name)"
    }
}
extension Hamster:TextRepressentable{}
//Hamster的实例可以作为TextRepressentable 类型使用
let simonTheHamster = Hamster(name: "Simon")
let somethingTextRepresentable:TextRepressentable = simonTheHamster
print(somethingTextRepresentable.asText())

//集合中的协议类型
let things:[TextRepressentable]=[game,d12,simonTheHamster]
for thing in things {
    print(thing.asText())
}

//协议的继承
protocol PrettyTextRepressentable : TextRepressentable {
    func asPrettyText() -> String
}
extension SnakesAndLadders:PrettyTextRepressentable{
    func asPrettyText() -> String {
        var output = asText()+":\n"
        for index in 1...finalSquare{
            switch board[index]{
            case let ladder where ladder > 0:
                output += "▲"
            case let snake where snake < 0:
                output += "▼"
            default:
                output += "○"
            }
        }
        return output
    }
}
print(game.asPrettyText())

//类专属协议
//protocol SomeClassOnlyProtocol:class,SomeInheritedProctocol{
//    //class-only protocol definition goes here
//}

//协议和合成
protocol Named{
    var name:String {get}
}
protocol Aged{
    var age:Int {get}
}
struct Person:Named,Aged{
    var name:String
    var age:Int
}
func wishHappyBirthday(celebrator:protocol<Named,Aged>){
    print("Happy birthday \(celebrator.name) - you're \(celebrator.age)!")
}
let birthdayPerson = Person(name: "Malcolm", age: 21)
wishHappyBirthday(birthdayPerson)

//检验协议的一致性
// is操作符用来检查实例是否遵循了某个协议
// as?返回一个可选值，当实例遵循协议时，返回该协议类型，否者返回nil
// as用以强制向下转型，如果强转失败，会引起运行时错误

protocol HasArea{
    var area:Double{get}
}
class Circel:HasArea{
    let PI = 3.1415927
    var radius:Double
    var area:Double {
        return PI*radius*radius
    }
    init(radius:Double){
        self.radius = radius
    }
}
class Country:HasArea{
    var area:Double
    init(area:Double){
        self.area = area
    }
}
class Animal{
    var legs : Int
    init(legs:Int){
        self.legs = legs
    }
}
let objects:[AnyObject] = [
    Circel(radius: 2.0),
    Country(area: 243_610),
    Animal(legs: 4)
]
for object in objects {
    if let objectWithArea = object as? HasArea{
        print("Area is \(objectWithArea.area)")
    }else{
        print("Something that doesn't hava an area")
    }
}

//对可选协议的规定
@objc protocol CounterDataSource{
    optional func incrementForCount(count:Int) -> Int
    optional var fixedIncrement:Int{get}
}
class Counter{
    var count = 0
    var dataSource:CounterDataSource?
    func increment(){
        if let amount = dataSource?.incrementForCount?(count){
            count += amount
        }else if let amount = dataSource?.fixedIncrement{
            count += amount
        }
    }
}
class ThreeSource:CounterDataSource{
    @objc let fixedIncrement = 3
}
var counter = Counter()
counter.dataSource = ThreeSource()
for _ in 1...4{
    counter.increment()
    print(counter.count)
}
class TowardsZeroSource:CounterDataSource{
    @objc func incrementForCount(count: Int) -> Int {
        if count == 0{
            return 0
        }else if count < 0 {
            return 1
        }else{
            return -1
        }
    }
}
counter.count = -4
counter.dataSource = TowardsZeroSource()
for _ in 1...5{
    counter.increment()
    print(counter.count)
}
//协议扩展
extension RandomNumberGenerator{
    func randomBool() -> Bool{
        return random() > 0.5
    }
}
let generator1 = LinearCongruentialGenerator()
print("Here's a random number: \(generator1.random())")
print("And here's a random Boolean: \(generator1.randomBool())")

//提供默认实现
//extension PrettyTextRepressentable{
//    var prettyTextualDescription:String{
//        return textualDescription
//    }
//}
extension CollectionType where Generator.Element : TextRepressentable{
    var textualDescription:String{
        let itemsAsText = self.map {$0.asText()}
        return "["+itemsAsText.joinWithSeparator(",")+"]"
    }
}
let murrayTheHamster = Hamster(name: "Murray")
let morganTheHamster = Hamster(name: "Morgan")
let mauriceTheHamster = Hamster(name: "Maurice")
let hamsters = [murrayTheHamster, morganTheHamster, mauriceTheHamster]
print(hamsters.textualDescription)


