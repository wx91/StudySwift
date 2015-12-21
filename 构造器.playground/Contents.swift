//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

struct Fahrenhit {
//    var temperature : Double
    var temperature = 32.0
    init(){
        temperature = 32.0
    }
}
var f = Fahrenhit()
print("The Default temperature is \(f.temperature) Fahrenhit")

//自定义构造过程
class Celsius{
    var temperatureInCelsius : Double
    init(fromFahrentheit fahrenheit:Double){
        temperatureInCelsius = (fahrenheit-32.0)/1.8
    }
    init(fromKelvin kelvin:Double){
        temperatureInCelsius = kelvin - 273.15
    }
    init(_ celsius:Double){
        temperatureInCelsius = celsius;
    }
}
let boilingOfWater = Celsius(fromFahrentheit: 212.0)
let freezingPointOfWater = Celsius(fromKelvin: 273.15)

struct Color{
    let red,green,blue:Double
    init(red:Double,green:Double,blue:Double){
        self.red = red
        self.green = green
        self.blue = blue
    }
    init(white:Double){
        red = white
        green = white
        blue = white
    }
}
let magenta = Color(red: 1.0, green: 0.0, blue: 1.0)
let halfGray = Color(white: 0.5)
//编译报错，需要外部名称
//let veryGreen = Color*(0.0,1.0,0.0)
let bodyTemperature = Celsius(37.0)

class SurveyQuestion {
//    var text:String
    let text:String
    var response:String?
    init(text:String){
        self.text = text
    }
    func ask(){
        print(text)
    }
}
let cheeseQuestion = SurveyQuestion(text: "Do you like cheese？")
cheeseQuestion.ask()
cheeseQuestion.response = "Yes,I do like cheese"

let beetsQuestion = SurveyQuestion(text: "How about beets")
beetsQuestion.ask()
beetsQuestion.response="I also like beets .(But not with cheese)"

//class ShoppingListItem{
//    var name:String?
//    var quantity = 1
//    var purchased = false
//}
//var item = ShoppingListItem()

struct Size{
    var width = 0.0,height = 0.0
}
let twoByTwo = Size(width: 2.0, height: 2.0)

struct Point {
    var x = 0.0 , y=0.0
}

struct Rect{
    var origin = Point()
    var size = Size()
    init() { }
    init(origin:Point,size:Size){
        self.origin = origin
        self.size = size
    }
    init(center:Point,size:Size){
        let originX = center.x - (size.width/2)
        let originY = center.y - (size.height/2)
        self.init(origin:Point(x: originX, y: originY),size:size)
    }
}
let basicRect = Rect()

let originRect = Rect(origin: Point(x: 2.0, y: 2.0),
    size: Size(width: 5.0, height: 5.0))
let centerRect = Rect(center: Point(x: 4.0, y: 4.0),
    size: Size(width: 3.0, height: 3.0))
//指定构造器
//init(parameter){
//    statements
//}
//便利构造器
//convenience init(parameter)
//指定构造器必须调用其直接父类的指定构造器
//便利构造器必须调用同一类中定义的其他构造器
//便利构造器必须最终调用一个指定构造器结束

//Swift 中类的构造过程包含两个阶段。第一个阶段，每个存储型属性通过引入它们的类的构造器来设置初始值。当每一个存储型属性值被确定后，第二阶段开始，它给每个类一次机会在新实例准备使用之前进一步定制它们的存储型属性。
//两段式构造过程的使用让构造过程更安全，同时在整个类层级结构中给予了每个类完全的灵活性。两段式构造过程可以防止属性值在初始化之前被访问；也可以防止属性被另外一个构造器意外地赋予不同的值。

class Vehicle{
    var numberOfWheels =  0
    var description:String{
        return "\(numberOfWheels) wheel(s)"
    }
}
let vehicle = Vehicle()
print("Vehicle:\(vehicle.description)")

class Bicycle:Vehicle{
    override init(){
        super.init()
        numberOfWheels = 2
    }
}

let bicycel = Bicycle()
print("Bicycle:\(bicycel.description)")


class Food{
    var name:String
    init(name:String){
        self.name = name
    }
    convenience init(){
        self.init(name:"[Unnamed]")
    }
}

let namedMeat = Food(name: "Bacon")
let mysteryMeat = Food()

class RecipeIngredient:Food{
    var quantity:Int
    init(name:String,quantity:Int){
        self.quantity = quantity
        super.init(name: name)
    }
    override convenience init(name:String){
        self.init(name:name,quantity:1)
    }
}

let oneMysteryItem = RecipeIngredient()
let oneBacon = RecipeIngredient(name: "Bacon")
let sixEggs = RecipeIngredient(name: "Eggs",quantity: 6)

class ShoppingListItem : RecipeIngredient{
    var purchased = false
    var description : String{
        var output = "\(quantity)*\(name)"
        output  += purchased ? "打钩" : "叉叉"
        return output;
    }
}

var breakfastList = [
    ShoppingListItem(),
    ShoppingListItem(name: "Bacon"),
    ShoppingListItem(name: "Eggs",quantity: 6)
]
breakfastList[0].name = "Orange juice"
breakfastList[0].purchased = true
for item  in breakfastList {
    print(item.description)
}

struct Animal{
    let species:String
    init?(species:String){
        if species.isEmpty {
            return nil
        }
        self.species=species;
    }
}
let someCreature=Animal(species: "Giraffe")

if let giraffe=someCreature{
    print("An animal was initialized with a species of \(giraffe.species)")
}
let anonymousCreature=Animal(species: "")
if anonymousCreature == nil{
    print("The anonymouse creature could not be initialized")
}

//enum TemperatureUnit{
//    case Kelvin, Celsius, Fahrenheit
//    init?(symbol:Character){
//        switch symbol{
//        case "K":
//            self = .Kelvin
//        case "C":
//            self = .Celsius
//        case "F":
//            self = .Fahrenheit
//        default:
//            return nil
//        }
//    }
//}
//let fahrenheitUnit=TemperatureUnit(symbol: "F")
//if fahrenheitUnit != nil{
//    print("This is a defined temperature unit, so initialization succeeded.")
//}
//let unkownUnit = TemperatureUnit(symbol: "X")
//if unkownUnit == nil{
//    print("This is not a defined temperature unit, so initialization failed.")
//}

enum TemperatureUnit:Character{
    case Kelvin = "K" , Celsius = "C",Fahrenheit = "F"
}
let fahrenheitUnit=TemperatureUnit(rawValue: "F")
if fahrenheitUnit != nil{
    print("This is a defined temperature unit, so initialization succeeded.")
}
let unkownUnit = TemperatureUnit(rawValue: "X")
if unkownUnit == nil{
    print("This is not a defined temperature unit, so initialization failed.")
}
class Product{
    let name:String!
    init?(name:String){
        self.name=name;
        if name.isEmpty {return nil}
    }
}
if let bowTie = Product(name: "bow tie"){
    print("The product's name is \(bowTie.name)");
}
class CartItem :Product {
    let quantity : Int!
    init?(name:String,quantity:Int){
        self.quantity = quantity;
        super.init(name: name)
        if quantity < 1{
            return nil
        }
    }
}
if let twoSocks = CartItem(name: "sock", quantity: 2){
    print("Item:\(twoSocks.name),quantity:\(twoSocks.quantity)")
}
if let zoreShirts = CartItem(name: "shirt", quantity: 0){
    print("Item:\(zoreShirts.name),quantity:\(zoreShirts.quantity)")
}else{
    print("Unable to initalize zero shirt")
}

if let oneUnnamed = CartItem(name: "", quantity: 1){
    print("Item:\(oneUnnamed.name),quantity:\(oneUnnamed.quantity)")
}else{
    print("Unable to initalize zero shirt")
}

class Document{
    var name:String?
    //该构造器构建了一个name属性值为nil的document对象
    init(){ }
    //该构造器构建了一个name属性值为非空字符串的document对象
    init?(name:String){
        if name.isEmpty{return nil}
        self.name=name
    }
}
class AutomaticallyNamedDocument:Document{
    override init(){
        super.init();
        self.name="[Untitled]"
    }
    override init(name: String) {
        super.init()
        if name.isEmpty {
            self.name="[Untitled]"
        }else{
            self.name=name
        }
    }
}
class UntitledDocument:Document{
    override init(){
        super.init(name:"[Untitled]")!
    }
}
//class SomeClass{
//    required init(){
//        //在这里天机该必要构造器的实现代码
//    }
//}
//class SomeSubClass :SomeClass{
//    required init(){
//        //在这里添加子类必要构造器实现代码
//    }
//}
//class SomeClass{
//    let someProperty:SomeType={
//        //在这个闭包钟给someProperty创建一个默认值
//        //someValue 必须和SomeType类型相同
//        return someValue
//    }(){
//        
//    }
//}
struct Checkerboard{
    let boardColors:[Bool] = {
        var temporaryBoard=[Bool]()
        var isBlack = false
        for i in 1...10{
            for j in 1...10 {
                temporaryBoard.append(isBlack)
                isBlack = !isBlack
            }
            isBlack = !isBlack
        }
        return temporaryBoard
    }()
    func squareBlackAtRow(row:Int,column:Int) -> Bool{
        return boardColors[(row*10)+column]
    }
}
let board = Checkerboard()
print(board.squareBlackAtRow(0,column: 1));
print(board.squareBlackAtRow(9,column: 9));

