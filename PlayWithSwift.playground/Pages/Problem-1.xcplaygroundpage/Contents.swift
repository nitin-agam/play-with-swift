
import Foundation

/*
 * Problem Title: Stock Merchant
 
 * Description: John works at a clothing store. He has a large pile of socks that he must pair by color for sale. Given an array of integers representing the color of each sock, determine how many pairs of socks with matching colors there are.
 
 * Example: There are 7 socks with colors ar = [1, 2, 1, 2, 1, 3, 2]. There is one pair of color 1 and one of color 2. There are three odd socks left, one of each color. The number of pairs is 2.
 
 * Link: http://hr.gs/1a2p
 
 */


func findSocksPair(array: [Int]) -> Int {
    
    // Return from here if no sufficient data in array.
    if array.count < 2 { return 0 }
    
    // Build a dictionary with the key which is equal to the number and it's value will be the occurance of that number.
    var numberCountDictionary: [String: Int] = [:]
    array.forEach { (number) in
        numberCountDictionary["\(number)", default: 0] += 1
    }
    
    // Find out total pairs
    var totalPairs = 0
    for count in numberCountDictionary.values {
        
        // Check only for valid count
        if count > 1 {
            if count % 2 == 0 || count % 2 == 1 {
                totalPairs += (count / 2)
            }
        }
    }
    return totalPairs
}

let socks = [10, 20, 20, 10, 10, 30, 50, 10, 20]
print(findSocksPair(array: socks))

