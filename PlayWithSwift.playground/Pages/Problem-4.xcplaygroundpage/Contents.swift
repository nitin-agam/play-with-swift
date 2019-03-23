
import Foundation

/*
 * Problem Title: Repeated Strings
 
 * Description: Lilah has a string 's', of lowercase English letters that she repeated infinitely many times.
 
 * Given an integer n, find and print the number of letter a's in the first  letters of Lilah's infinite string.
 
 * Example: If the string s = 'abcac' and n = 10, the substring we consider is abcacabcac, the first 10 characters of her infinite string. There are 4 occurrences of a in the substring.
 
 * Link: http://hr.gs/bdedbb
 
 */


// Solution 1 (Not Optimized)
func repeatedString(s: String, n: Int) -> Int {
    
    // Return if data is not sufficient.
    if s.count == 0 || n < 1 { return 0 }
    
    let targetChar: Character = "a"
    var formattedString = String(s)
    let extraCharCount = n - formattedString.count
    
    if extraCharCount > 0 {
        let moreRound = extraCharCount / formattedString.count
        for _ in 0..<moreRound {
            formattedString.append(s)
        }
        
        if extraCharCount % s.count != 0 {
            formattedString.append(String(s.prefix(extraCharCount % s.count)))
        }
    } else {
        formattedString = String(s.prefix(n))
    }
    
    return formattedString.filter { (character) -> Bool in
        return character == targetChar
        }.count
}


// Solution 2 (Optimized solution)
func repeatedString2(s: String, n: Int) -> Int {
    
    // Return if data is not sufficient.
    if s.count == 0 || n < 1 { return 0 }
    
    var characters = Array(s)
    var countInString = 0
    var extraAdded = 0
    
    let extraCharCount = n - s.count
    if extraCharCount < 1 {
        let chars = Array(s)
        characters = Array(chars[0..<n])
    }
    // Here, we are performing this loop only on the given string.
    for index in 0..<characters.count {
        if characters[index] == "a" {
            countInString += 1
            
            if index < (n % characters.count) {
                extraAdded += 1
            }
        }
    }
    
    let repeats = (n - (n % characters.count)) / characters.count
    let counter = repeats * countInString + extraAdded
    return counter
}

let text2 = "ababa"
print(repeatedString2(s: text2, n: 3))
print(repeatedString(s: text2, n: 3))
