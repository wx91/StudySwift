//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
//简单值
var myVariable = 42
myVariable=50;
let myConstant = 42

let implicitInteger = 70
let implicitDouble = 70.0
let explicitDouble:Double = 70
//声明变量的类型
let newConstant:Float=4

let label = "The width is "
let width = 94
//String(width)类型转换
let widthLabel=label+String(width)
//使用\()把已给浮点计算转换为字符串
let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples."
let fruitSummary = "I have \(apples+oranges) pieces of fruit."

//使用[]创建的数组
var shoppingList = ["Catfish","water","tulips","blue paint"]
shoppingList[1] = "bottle of water"

//使用[]创建的字典
var occupations = [
    "Malcolm":"Captain",
    "Kaylee":"Mechanic",
]
occupations["Jayne"] = "Public Relations"
occupations["Malcolm"]

//创建一个空数组
let emptyArray = [String]()
shoppingList=[]
//创建一个空字典
let emptyDictionary = [String:Float]()
occupations=[:]

//控制流
let individualScores=[75,43,103,87,12]
var teamScore = 0
for score in individualScores{
    if(score>50){
        teamScore+=3
    }else{
        teamScore+=1
    }
}
print(teamScore)
//?表示可选 !拆包
var optionalString:String?="Hello"
print(optionalString==nil)
//如果可选值有可能是nil
//var optionName:String? = "John Appleseed"
var optionName:String? = nil
var greeting = "Hello!"
if let name=optionName{
    greeting="Hello,\(name)"
}
//另一种处理可选值的方式是通过??操作符来提供一个默认值。如果可悬浮确实的话，可是使用默认值代替
let nickName:String?=nil
let fullName:String="John Appleseed"
let informalGreeting = "Hi \(nickName ?? fullName)"

//swich 支持任意类型的数据以及各种比较操作
//switch 中匹配到子句之后，程序会推出switch语句，不需要每个子句写break
let vegetable = "red pepper"
switch vegetable {
    case "celery":
        print("Addd some raisins and make ants on a log")
    case "cucumber","watercress":
        print("That would make a good tea sandwich.")
    case let x where x.hasSuffix("pepper"):
        print("Is it a spicy \(x)")
    default :
        print("Everything tastes good in soup")
}
//for in 遍历字典
let interestingNumber = [
    "Prime":[2,3,5,7,11,13],
    "Fibonacci":[1,1,2,3,5,7],
    "Square":[1,4,9,16,24]
]
var largest=0
for(kind,numbers) in interestingNumber{
    for number in numbers{
        if number > largest {
            largest = number
        }
    }
}
print("\(largest)")

var n=2
while n<100{
    n=n*2
}
print(n)

var m=2
repeat{
    m=m*2
}while m<100
print(m)

var firstForLoop = 0
for i in 0..<4{
    firstForLoop+=i;
}
print(firstForLoop);

var secondForLoop = 0;
for var i=0;i<4;++i{
    secondForLoop+=i
}
print(secondForLoop)

//函数和闭包
//使用func来声明一个函数，使用名字和参数来调用函数，使用->来指定函数返回类型
func greet(name:String,day:String)->String{
    return "Hello \(name),today is \(day)"
}
greet("Bob",day: "Tuesday" )
//使用元组来让一个函数返回多个值.
func calculateStatistics(scores:[Int])->(min:Int,max:Int,sum:Int){
    var min = scores[0];
    var max = scores[0];
    var sum = 0;
    for score in scores {
        if score > max {
            max=score
        }else if score < min{
            min=score
        }
        sum+=score
    }
    return (min,max,sum);
}

let statistics = calculateStatistics([5,3,100,3,9])
print(statistics.sum);
print(statistics.2)

//函数可以带有可变个数的参数，在函数表现为数组形式
func sumOf(numbers:Int...)->Int{
    var sum=0
    for number in numbers{
        sum+=number
    }
    return sum
}
sumOf(12)
sumOf(42,597,12)
//函数可以嵌套
func returnFifteen()->Int{
    var y=10
    func add(){
        y+5
    }
    add()
    return y
}
returnFifteen()
//函数可以作为另一个函数的返回值
func makeIncrementer() -> (Int -> Int){
    func addOne(number:Int) -> Int{
        return 1+number
    }
    return addOne
}
var increments = makeIncrementer()
increments(7)

//函数可以作为参数传入函数
func hasAnyMatches(list:[Int],condition:Int -> Bool) -> Bool{
    for item in list{
        if condition(item){
            return true
        }
    }
    return false
}
func lessThanTen(number:Int)->Bool{
    return number<10
}
var numbers=[20,19,7,12]
hasAnyMatches(numbers, condition: lessThanTen);

numbers.map({
    (number:Int)->Int in
    let result = 3*number
    return result;
})

let mappedNumbers=numbers.map({number in 3*number});
print(mappedNumbers)

let sortedNumbers = numbers.sort({$0>$1})
print(sortedNumbers)


//类和对象
class Shape{
    var numberOfSides = 0;
    
    func simpleDescription()->String{
        return "A shape with \(numberOfSides) sides."
    }
}
var shape=Shape();
shape.numberOfSides=7
var shapeDescription=shape.simpleDescription();

class NameShape{
    var numberOfSides = 0;
    var name:String
    
    init(name:String){
        self.name=name
    }
    
    func simpleDescription()->String{
        return "A shape with \(numberOfSides) sides."
    }
}


class Square:NameShape{
    var sideLength:Double
    
    init(sideLength:Double,name:String){
        self.sideLength=sideLength;
        super.init(name: name)
        numberOfSides=4
    }
    
    func area()->Double{
        return sideLength*sideLength
    }
    
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)";
    }
}
let test=Square(sideLength: 5.2, name: "my test Square");
test.area();
test.simpleDescription()

class EquilaterralTriangle:NameShape{
    var sideLength:Double=0.0
    
    init(sideLength : Double,name : String){
        self.sideLength=sideLength
        super.init(name: name);
        numberOfSides=3
    }
    
    var perimeter:Double{
        get{
            return 3.0*sideLength;
        }
        set{
            sideLength=newValue/3.0;
        }
    }
    override func simpleDescription() -> String {
        return "A equilaterral triangle with sides of length \(sideLength)";
    }
}
var triangle=EquilaterralTriangle(sideLength: 3.1, name: "a triangle")
print(triangle.perimeter);
triangle.perimeter=9.9
print(triangle.sideLength)

//需要在设置一个新值之前或者之后运行代码，使用willSet和didSet
class TriangleAndSquare{
    
    var triangle:EquilaterralTriangle{
        willSet{
            square.sideLength=newValue.sideLength
        }
    }

    var square:Square{
        willSet{
            triangle.sideLength=newValue.sideLength
        }
    }
    
    init(size:Double,name:String){
        square=Square(sideLength: size, name: name)
        triangle=EquilaterralTriangle(sideLength: size , name: name)
    }
}

var triangeleAndSquare=TriangleAndSquare(size: 10, name: "another test shape")
print(triangeleAndSquare.square.sideLength)
print(triangeleAndSquare.triangle.sideLength)
triangeleAndSquare.square=Square(sideLength: 50, name: "larger square");
print(triangeleAndSquare.triangle.sideLength);

let optionalSquare:Square?=Square(sideLength: 2.5, name: "optional Square")
let sideLength=optionalSquare?.sideLength;

//枚举和结构体
enum Rank:Int{
    case Ace=1
    case Two,Three,Four,Five,Six,Seven,Eight,Nine,Ten
    case Jack,Queen,King
    
    func simpleDescription()->String{
        switch self{
        case .Ace:
            return "ace"
        case .Jack:
            return "Jack"
        case .Queen:
            return "Queen"
        case .King:
            return "King"
        default:
            return String(self.rawValue)
        }
    }
}

let ace=Rank.King
let aceRawValue=ace.rawValue
if let convertedRank=Rank(rawValue: 3){
    let threeDescription=convertedRank.simpleDescription()
}

enum Suit{
    case Spades,Hearts,Diamonds,Clubs
    func simpleDescription()->String{
        switch self{
        case .Spades:
            return "spades"
        case .Hearts:
            return "hearts"
        case .Diamonds:
            return "diamonds"
        case .Clubs:
            return "clubs"
        }
    }
}
let hearts=Suit.Hearts
let heartsDescription = hearts.simpleDescription()

struct Card{
    var rank:Rank
    var suit:Suit
    
    func simpleDescription()->String{
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}
let threeOfSpades=Card(rank: .Three, suit: .Spades)
let threeOfSpadesDescription=threeOfSpades.simpleDescription()

enum ServerResponse{
    case Result(String,String)
    case Error(String)
}
let success = ServerResponse.Result("6:00 am", "8:09 pm")
let failure = ServerResponse.Error("Out of cheese.")

switch success{
case let .Result(sunrise,sunset):
    let serverResponse="Sunrise is at \(sunrise) and sunset is at\(sunset)."
case let .Error(error):
    let serverReponse="Failure ...\(error)"
}

//协议和扩展

protocol ExampleProtocol{
    var simpleDescription:String{get}
    mutating func adjust()
}

class SimpleClass:ExampleProtocol{
    var simpleDescription:String="A very simple class."
    var anotherProperty:Int = 69105
    func adjust() {
        simpleDescription+="Now 100% adjusted."
    }
}
var a=SimpleClass()
a.adjust()
let aDescription=a.simpleDescription

struct SimpleStrcture:ExampleProtocol{
    var simpleDescription:String="A Simple structure"
    mutating func adjust() {
        simpleDescription+="(adjusted)"
    }
}
var b=SimpleStrcture()
b.adjust()
let bDescription=b.simpleDescription



extension Int:ExampleProtocol{
    var simpleDescription:String{
        return "The number \(self)"
    }
    mutating func adjust() {
        self+=42
    }
}
print(7.simpleDescription)
let protocolValue:ExampleProtocol=a
print(protocolValue.simpleDescription)

//泛型
func repeatItem<Item>(item:Item,numberofTime:Int)->[Item]{
    var result=[Item]()
    for _ in 0..<numberofTime{
        result.append(item)
    }
    return result
}
repeatItem("knock", numberofTime: 4)


enum OptionalValue<Wrapped>{
    case None
    case Some(Wrapped)
}
var possibleInteger:OptionalValue<Int> = .None
possibleInteger = .Some(100)

func anyCommonElements <T: SequenceType, U: SequenceType where T.Generator.Element: Equatable, T.Generator.Element == U.Generator.Element> (lhs: T, _ rhs: U) -> Bool {
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                return true
            }
        }
    }
    return false
}

anyCommonElements([1, 2, 3], [3])
