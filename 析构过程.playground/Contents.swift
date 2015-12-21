//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
//deinit{
//    //执行析构过程
//}
struct Bank{
    static var coinsInBlank = 10_000
    static func vendCoins(var numberOfCoinsToVend:Int) ->Int{
        numberOfCoinsToVend = min(numberOfCoinsToVend,coinsInBlank)
        coinsInBlank -= numberOfCoinsToVend
        return numberOfCoinsToVend
    }
    static func receiveCoins(coins:Int){
        coinsInBlank += coins
    }
}
class Player {
    var coinsInPurse:Int
    init(coins:Int){
        coinsInPurse = Bank.vendCoins(coins)
    }
    func winCoins(coins:Int){
        coinsInPurse += Bank.vendCoins(coins)
    }
    deinit{
        Bank.receiveCoins(coinsInPurse)
    }
}
var playOne:Player?=Player(coins: 100)
print("A new player has joined the game with \(playOne!.coinsInPurse) coins")
print("There are now \(Bank.coinsInBlank) coins left in the bank");
playOne?.winCoins(2_000)
print("PlayOne won 2000 coins& now has \(playOne!.coinsInPurse) coins")
print("There are now \(Bank.coinsInBlank) coins left in the bank");
playOne = nil
print("PlayerOne has left the game")
print("There are now \(Bank.coinsInBlank) coins left in the bank");

