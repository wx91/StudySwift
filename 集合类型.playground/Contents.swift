//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
//创建一个空数组
var someInts = [Int]()
print("someInts is of type [Int] with \(someInts.count) items")
someInts.append(3)
someInts=[]
//创建一个带有默认值得数组
var threeDoubles = [Double](count: 3, repeatedValue: 0.0)
//通过两个数组相加创建一个数组
var anotherThreeDoubles=Array(count: 3, repeatedValue: 2.5)
var sixDoubles = threeDoubles+anotherThreeDoubles

//用字面量构造数组
var shoppingList:[String]=["Eggs","Milk"]
//var shoppingList=["Eggs","Milk"]
print("The shopping list contains \(shoppingList.count) item.")

if shoppingList.isEmpty{
    print("The shopping list is empty")
}else{
    print("The shopping list is not empty")
}
shoppingList.append("Flour")
shoppingList+=["Baking powder"]
shoppingList+=["Chocolate Spread","Cheese","Butter"]
var firstItem=shoppingList[0]
shoppingList[0]="Six eggs"
shoppingList[4...6]=["Bananas","Apples"]

shoppingList.insert("Maple Syrup", atIndex: 0)

let mapleSyrup = shoppingList.removeAtIndex(0)
firstItem = shoppingList[0]

let apples = shoppingList.removeLast()

for item in shoppingList {
    print(item)
}
for (index,value) in shoppingList.enumerate() {
    print("Item \(String(index+1)):\(value)")
}


//集合
//创建和构造一个空集合
var letters = Set<Character>()
print("letter is of type Set<Character> with \(letters.count) items")
letters.insert("a")
letters=[]
//用数组字面量创建集合
var favoriteGenres:Set<String>=["Rock","Classical","Hip Hop"]
//var favoriteGenres:Set=["Rock","Classical","Hip Hop"]

print("I have \(favoriteGenres.count) favorite muisic genres")

if favoriteGenres.isEmpty{
    print("As far as music goes, I'm not picky.");
}else{
    print("I have particular music preferences.")
}
favoriteGenres.insert("Jazz")

if let removeGenre = favoriteGenres.remove("Rock"){
    print("\(removeGenre)? I'm over it.")
}else{
    print("I never much cared for that")
}

if favoriteGenres.contains("Funk"){
    print("I get up on the good foot")
}else{
    print("It's too funky in here")
}

for genre in favoriteGenres{
    print("\(genre)")
}
for genre in favoriteGenres.sort(){
    print("\(genre)")
}


let oddDigits:Set = [1,3,5,7,9]
let evenDigits:Set = [0,2,4,6,8]
let singleDigitPrimeNumbers:Set = [2,3,5,7]

oddDigits.union(evenDigits).sort()
oddDigits.intersect(evenDigits).sort()
oddDigits.subtract(singleDigitPrimeNumbers).sort()
oddDigits.exclusiveOr(singleDigitPrimeNumbers).sort()

let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]
houseAnimals.isStrictSubsetOf(farmAnimals)
farmAnimals.isSupersetOf(houseAnimals)
farmAnimals.isDisjointWith(cityAnimals)
//字典
var namesOfInteger = [Int:String]()
namesOfInteger[16]="sixteen"
namesOfInteger=[:]

var airports:[String:String]=["YYZ":"Toronto Pearson","DUB":"Dublin"]
//var airports=["YYZ":"Toronto Pearson","DUB":"Dublin"]
print("The dictionary of airports contains \(airports.count) items.")
if airports.isEmpty{
    print("The airports dictinary is empty.")
}else{
    print("The airports dictionary is not empty");
}
airports["LHR"]="London"
airports["LHR"]="London Heathrow"

if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB"){
    print("The old value for DUB was \(oldValue)")
}

if let airportName=airports["DUB"] {
    print("The name of the airport is \(airportName).")
}else{
    print("That airport is not in the airports dictionary.")
}

airports["APL"]="Apple Internation"
airports["APL"]=nil

if let removedValue=airports.removeValueForKey("DUB"){
    print("The removed airport's name is \(removedValue).")
}else{
    print("The airports dictionary does not contain a value for DUB.")
}

for (airportCode,airportName) in airports {
    print("\(airportCode):\(airportName)")
}

for airportCode in airports.keys {
    print("Airport code:\(airportCode)")
}
for airportNames in airports.values {
    print("Airport name : \(airportNames)")
}
let airportCodes = [String](airports.keys)
let airportNames = [String](airports.values)

