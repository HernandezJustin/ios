//: Playground - noun: a place where people can play

//: Here is a single line comment example
 /*: This is
 Multi line comment
 # We are family
 */



import UIKit

print("Welcome to swift")

var x = 10

for index in 1...20 {
    let y = index * x
    x -= 1
}

let myLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 50))

myLabel.backgroundColor = UIColor.red
myLabel.text = "Hello Swift"
myLabel.textAlignment = .center
myLabel.font = UIFont(name: "Georgia", size: 24)
myLabel

let image = UIImage(named: "waterfall")