
import Foundation

/*
 * Problem Title: Alternating Characters
 
 * Description: John works at a clothing store. He has a large pile of socks that he must pair by color for sale. Given an array of integers representing the color of each sock, determine how many pairs of socks with matching colors there are.
 
 * Example: There are 7 socks with colors ar = [1, 2, 1, 2, 1, 3, 2]. There is one pair of color 1 and one of color 2. There are three odd socks left, one of each color. The number of pairs is 2.
 
 * Link: http://hr.gs/bcafec
 
 */


func alternatingCharacters(s: String) -> Int {
    
    // Check for sufficient data.
    if s.count < 2 { return 0 }
    
    let letters = Array(s)
    var deletionCounter = 0
    for index in 0..<letters.count {
        let character = letters[index]
        if (index + 1) < letters.count {
            let nextChar = letters[index + 1]
            if character == nextChar {
                deletionCounter += 1
            }
        }
    }
    return deletionCounter
}

print(alternatingCharacters(s: "AAABBB"))
