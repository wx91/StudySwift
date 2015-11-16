//: Playground - noun: a place where people can play

//间接拆包optionals
import UIKit

var str = "Hello, playground"
//可选类型？ 加入！算是拆包
//let 彩票金额:String?="5";
//print("此次彩票中奖金额是\(彩票金额!)");
//它在确定每一次给的值都是存在的，这种情况下是可以用的。不会出现空得问题。
let 彩票金额:String!="5";
print("此次彩票中奖金额是\(彩票金额)");

if let 临时金额 = 彩票金额{
    print("此次彩票中奖金额是\(临时金额)");
}
