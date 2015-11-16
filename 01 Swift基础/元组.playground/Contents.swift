//: Playground - noun: a place where people can play
//Tuple 元组类型
import UIKit

var str = "Hello, playground"

//let 昨天我网购的意见衬衫=(70,"黑色",true)

//let (价格,颜色,合身)=昨天我网购的意见衬衫
//
//print(颜色);

//let (价格,_,_)=昨天我网购的意见衬衫
//print(价格)
//print(昨天我网购的意见衬衫.1)
let 昨天我网购的一件衬衫=(价格:70,颜色:"黑色",合身:true);

昨天我网购的一件衬衫.价格

if(昨天我网购的一件衬衫.合身){
    print("看，我昨天去品牌店买得一件\(昨天我网购的一件衬衫.颜色)衬衫,合身不？才多少钱,遇上打折才\(昨天我网购的一件衬衫.价格)元");
}else{
    print("昨天网购的一件衬衫不合身，上当了！");
}