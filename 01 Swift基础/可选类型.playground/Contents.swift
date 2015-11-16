//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//Optional 可选类型 1.拆包和绑定

let 昨天我买的彩票="50"
//let 昨天我买的彩票="谢谢惠顾";
//nil在swift中是Optional no value
let 中奖金额 = Int(昨天我买的彩票);

if (中奖金额 != nil) {
    print("恭喜，中了\(中奖金额!)元！");
}else{
    print("下一次加油");
}

if let 临时金额 = 中奖金额{
    var 税后金额 = Double(临时金额)*0.8
    print("恭喜你中了\(临时金额)元,税后\(税后金额)元")
}else{
    print("下次加油!");
}
