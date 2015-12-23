//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
//自动引用计数
//class Person{
//    let name:String
//    init(name:String){
//        self.name=name
//        print("\(name) is being initialized")
//    }
//    deinit{
//        print("\(name) is being deinitalized")
//    }
//}
//var reference1:Person?
//var reference2:Person?
//var reference3:Person?
//reference1 =  Person(name: "John Appleseed")
//reference2 = reference1
//reference3 = reference1
//reference1 = nil
//reference2 = nil
//reference3 = nil
//类实例之间的循环引用
//class Person {
//    let name:String
//    init(name:String){
//        self.name=name
//    }
//    var apartment:Apartment?
//    deinit{
//        print("\(name) is being deinitialized")
//    }
//}
//class Apartment{
//    let unit:String
//    init(unit:String){
//        self.unit=unit;
//    }
//    var tenant:Person?
//    deinit{
//        print("Apartment \(unit) is being deinitialized")
//    }
//}
//var john:Person?
//var unit4A:Apartment?
//john = Person(name: "John Appleseed")
//unit4A = Apartment(unit: "4A")
//john!.apartment=unit4A
//unit4A!.tenant=john;
//john=nil
//unit4A=nil
//解决实例之间的循环强引用
//对于生命周期中会变为nil的实例使用弱引用。相反地，对于初始化赋值后再也不会被赋值为nil的实例，使用无主引用。

//class Person {
//    let name:String
//    init(name:String){
//        self.name=name
//    }
//    var apartment:Apartment?
//    deinit{
//        print("\(name) is being deinitialized")
//    }
//}
//class Apartment{
//    let unit:String
//    init(unit:String){
//        self.unit=unit;
//    }
//    weak var tenant:Person?
//    deinit{
//        print("Apartment \(unit) is being deinitialized")
//    }
//}
//var john:Person?
//var unit4A:Apartment?
//john = Person(name: "John Appleseed")
//unit4A = Apartment(unit: "4A")
//john!.apartment=unit4A
//unit4A!.tenant=john;
//john = nil
//unit4A=nil

class Customer{
    let name:String
    var card:CreditCard?
    init(name : String){
        self.name=name
    }
    deinit{
        print("\(name) is being deinitialized")
    }
}
class CreditCard{
    let number:UInt64
    unowned let customer:Customer
    init(number : UInt64,customer:Customer){
        self.number=number
        self.customer=customer
    }
    deinit{
        print("Card #\(number) is being deinitialized");
    }
}
var john:Customer?
john =  Customer(name: "John Appleseed")
john!.card = CreditCard(number: 1234_5678_9012_3456, customer: john!)
john = nil

class Country{
    let name:String
    var capitalCity:City!
    init(name:String , capitalName:String){
        self.name = name
        self.capitalCity = City(name: capitalName, country: self)
    }
}
class City{
    let name:String
    unowned let country:Country
    init(name:String,country:Country){
        self.name=name
        self.country = country
    }
}
var country = Country(name: "Canada", capitalName: "Ottawa")
print("\(country.name)'s capital city is called \(country.capitalCity.name)")

//class HTMLElement{
//    let name:String
//    let text:String?
//    lazy var asHTML:Void -> String = {
//        if let text = self.text{
//            return "<\(self.name)>\(text)</\(self.name)>"
//        }else{
//            return "<\(self.name)>"
//        }
//    }
//    init(name:String ,text:String? = nil){
//        self.name = name
//        self.text = text
//    }
//    deinit{
//        print("\(name) is being deinitialized")
//    }
//}
//let heading = HTMLElement(name: "h1")
//let defaultText = "some default text"
//heading.asHTML = {
//    return "<\(heading.name)>\(heading.text ?? defaultText)</\(heading.name)>"
//}
//print(heading.asHTML())
//
//var paragraph:HTMLElement? = HTMLElement(name: "p", text: "Hello World")
//print(paragraph!.asHTML())
//paragraph = nil

class HTMLElement{
    let name:String
    let text:String?
    lazy var asHTML:Void -> String = {
        [unowned self] in
        if let text = self.text{
            return "<\(self.name)>\(text)</\(self.name)>"
        }else{
            return "<\(self.name)>"
        }
    }
    init(name:String ,text:String? = nil){
        self.name = name
        self.text = text
    }
    deinit{
        print("\(name) is being deinitialized")
    }
}
var paragraph:HTMLElement? = HTMLElement(name: "p", text: "Hello World")
print(paragraph!.asHTML())
paragraph = nil
