//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
//字符串字面量
let someString = "Some string literal value"
//初始化空字符串
var emptyString = ""
var anotherEmptyString = String()

if emptyString.isEmpty{
    print("Nothing to see here")
}
//字符串可变性
var variableString = "Horse"
variableString+=" and carriage"

let constantString = "Highlander"
//let 字符串不可被修改
//constantString += "and another Highlander"
//使用字符
for character in "Dog!🐶".characters {
    print(character)
}


let exclamationMark:Character = "!"
let catCharacters:[Character]=["C","a","t","!","🐱"]
let catString = String(catCharacters)
print(catString)
//连接字符串和字符
let string1 = "hello"
let string2 = " there"
//var welcome =  string1+string2

var instruction = "look over"
instruction += string2
//welcome.append(exclamationMark)

//字符串插值
let multipier = 3
let message = "\(multipier) times 2.5 is \(Double(multipier)*2.5)"

let wiseWords = "\"Imagination is more important than Knowledge\"-Einstein"

//可以扩展的字形群集
let dollarSign = "\u{24}"
let blackHeart = "\u{2665}"
let sparklingHeaer = "\u{1F496}"

let eAcute:Character = "\u{E9}"
let combinedEAcute:Character = "\u{65}\u{301}"

let precomposed: Character = "\u{D55C}"
let decomposed: Character = "\u{1112}\u{1161}\u{11AB}"
let enclosedEAcute: Character = "\u{E9}\u{20DD}"
let regionalIndicatorForUS:Character = "\u{1F1FA}\u{1F1F8}"

//计算字符数量
let unusualMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"
print("unusualMenagerie has \(unusualMenagerie.characters.count) characters")

var word = "cafe"
print("the number of characters in \(word) is \(word.characters.count)")

word+="\u{301}"
print("the number of characters in \(word) is \(word.characters.count)")

//访问和修改字符串
//字符串索引
let greeting = "Guten Tag!"
greeting[greeting.startIndex]

greeting[greeting.endIndex.predecessor()]
greeting[greeting.startIndex.successor()]
let index = greeting.startIndex.advancedBy(7)
greeting[index]
//越界出错
//greeting[greeting.endIndex]
//greeting[greeting.endIndex.successor()]

for index in greeting.characters.indices{
    print("\(greeting[index])",terminator:" ")
}
//插入和删除
var welcome = "hello"
welcome.insert("!", atIndex: welcome.endIndex)
welcome.insertContentsOf(" there".characters, at: welcome.endIndex.predecessor())
welcome.removeAtIndex(welcome.endIndex.predecessor())

let range = welcome.endIndex.advancedBy(-6)..<welcome.endIndex
welcome.removeRange(range)

//比较字符串

let quotation = "We're a lot alike , you and I"
let sameQuotation = "We're a lot alike , you and I"
if quotation == sameQuotation {
    print("These two strings are considered equal");
}

let eAcuteQuestion = "Voulez-vous un caf\u{E9}?"
let combinedEAcutteQuestion="Voulez-vous un caf\u{65}\u{301}?"
if eAcuteQuestion == combinedEAcutteQuestion{
    print("These two strings are considered equal");
}

let latinCapitalLetterA:Character = "\u{41}"
let cyrilliCapitalLetterA:Character = "\u{0410}"
if latinCapitalLetterA != cyrilliCapitalLetterA {
    print("These two characters are not equivalent")
}

let romeoAndJuliet = [
    "Act 1 Scene 1: Verona, A public place",
    "Act 1 Scene 2: Capulet's mansion",
    "Act 1 Scene 3: A room in Capulet's mansion",
    "Act 1 Scene 4: A street outside Capulet's mansion",
    "Act 1 Scene 5: The Great Hall in Capulet's mansion",
    "Act 2 Scene 1: Outside Capulet's mansion",
    "Act 2 Scene 2: Capulet's orchard",
    "Act 2 Scene 3: Outside Friar Lawrence's cell",
    "Act 2 Scene 4: A street in Verona",
    "Act 2 Scene 5: Capulet's mansion",
    "Act 2 Scene 6: Friar Lawrence's cell"
]
var act1SceneCount = 0
for scene in romeoAndJuliet {
    if scene.hasPrefix("Act 1"){
        ++act1SceneCount
    }
}
print("There are \(act1SceneCount) scenses in Act 1")

var mansionCount = 0
var cellCount = 0
for scense in romeoAndJuliet {
    if scense.hasSuffix("Capulet's mansion"){
        ++mansionCount
    }else if scense.hasSuffix("Friar Lawrence's cell"){
        ++cellCount
    }
}
print("\(mansionCount) mansion scense; \(cellCount) cell scenses")

//字符串的Unicode的表示形式
let dogString = "Dog!!🐶"
for codeunit in dogString.utf8{
    print("\(codeunit)",terminator:" ")
}
for codeunit in dogString.utf16{
    print("\(codeunit)",terminator:" ")
}

for scalar in dogString.unicodeScalars{
    print("\(scalar)")
    print("\(scalar.value)",terminator:" ")
}








