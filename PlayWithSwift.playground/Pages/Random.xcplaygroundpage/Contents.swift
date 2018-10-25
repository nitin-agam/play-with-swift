
import Foundation

// Random numbers API in Swift 4.2

// This is an C language based APIs so you required to import 'Foundation' framework.
let oldWayRandomNumber = Int(arc4random_uniform(20))
print("Random value using old way: \(oldWayRandomNumber)")


// 1. Random with numeric data types.

print("Random Int using range operator: ", Int.random(in: 10 ... 30))

if let randomDigit = (5...50).randomElement() {
    print("Random Int using range operator directly: ", randomDigit)
}

// You can perform random operation on other data type too.
print("Random Float using range operator: ", Float.random(in: 0.5 ... 2.5))
print("Random Double using range operator: ", Double.random(in: 1.5 ... 5.5))


// Surprise: even you can perform random on Bool
print("Random Bool: ", Bool.random())



// Next: Now we are going to perform Random function on Collection types
var friendNames = ["Mike", "John", "Nicol", "Hussey", "Virat"]
if let randomName = friendNames.randomElement() {
    print("Random name: ", randomName)
}


// Shuffling: Before Swift 4.1, we didn't contain any standard function to suffle objects. But now in Swift 4.2, it is easier.
friendNames.shuffle()
print("Names after suffling: ", friendNames)

let suffledNames = friendNames.shuffled()
print("Suffled Names: ", suffledNames)


