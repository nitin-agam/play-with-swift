//: [Previous](@previous)

import Foundation

// Sort the given dates in string array from past to present. For example:

/*
 Input: let dates = ["25 Jun 2017", "30 Jun 2018", "28 Jun 2019", "2 Jul 2016", "3 Jul 2016", "26 Jun 2017"]
 Output: ["02 Jul 2016", "03 Jul 2016", "25 Jun 2017", "26 Jun 2017", "30 Jun 2018", "28 Jun 2019"]
 */

func sortDates(dates: [String], isAscending: Bool = true, dateFormat: String) -> [String] {
    
    // Create date formatter object
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = dateFormat
    
    
    // Keep all the converted date objects.
    var convertedDates: [Date] = []
    dates.forEach { (dateString) in
        if let dateObject = dateFormatter.date(from: dateString) {
            convertedDates.append(dateObject)
        }
    }
    
    // Sort all date objects
    convertedDates = convertedDates.sorted(by: { (date1, date2) -> Bool in
        return date1.compare(date2) == (isAscending ? .orderedAscending : .orderedDescending)
    })
    
    // Convert each date object into string format
    let dateStringArray = convertedDates.map { (date) -> String in
        return dateFormatter.string(from: date)
    }
    
    return dateStringArray
}


// Input
let dates = ["25 Jun 2017", "30 Jun 2018", "28 Jun 2019", "2 Jul 2016", "3 Jul 2016", "26 Jun 2017"]

// Output
print("Sorted Dates: \(sortDates(dates: dates, isAscending: true, dateFormat: "dd MMM yyyy"))")

