
import Foundation

/*
 * Problem Title: Counting Valleys
 
 * Description: Gary is an avid hiker. He tracks his hikes meticulously, paying close attention to small details like topography. During his last hike he took exactly n   steps. For every step he took, he noted if it was an uphill, U, or a downhill, D step. Gary's hikes start and end at sea level and each step up or down represents a 1 unit change in altitude. We define the following terms:
 
 * A mountain is a sequence of consecutive steps above sea level, starting with a step up from sea level and ending with a step down to sea level.
 
 * A valley is a sequence of consecutive steps below sea level, starting with a step down from sea level and ending with a step up to sea level.
 
 * Given Gary's sequence of up and down steps during his last hike, find and print the number of valleys he walked through.
 
 * Example: If Gary's path is s = [DDUUUUDD], he first enters a valley 2 units deep. Then he climbs out an up onto a mountain 2 units high. Finally, he returns to sea level and ends his hike.
 
 * Link: http://hr.gs/aabeae
 
 */


func countingValleys(n: Int, s: String) -> Int {
    
    // Note: here 'n' is not required. Performing based on string's length.
    
    // Return if no sufficient data.
    if sequance.count < 1 { return 0 }
    
    let letters = Array(s)
    var counter = 0
    var level = 0
    for index in 0..<letters.count {
        let character = letters[index]
        if character == "U" {
            level += 1
            if level == 0 { counter += 1 }
        } else if character == "D" {
            level -= 1
        }
    }
    return counter
}

let sequance = "DDUUUUDD"
print(countingValleys(n: sequance.count, s: sequance))
