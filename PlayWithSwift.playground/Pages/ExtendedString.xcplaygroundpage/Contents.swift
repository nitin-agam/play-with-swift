//: [Previous](@previous)

import Foundation
import UIKit

// You can download this Swift file to use in your project directly: https://www.dropbox.com/s/gqcb04qm3tbe16v/ExtendedString.swift?dl=0

extension String {
    
    // MARK: - Instance Methods
    func isValidEmail() -> Bool {
        let emailRegression = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
        let predicate = NSPredicate(format: "self matches %@", emailRegression)
        return predicate.evaluate(with: self)
    }
    
    func isValidString() -> Bool {
        if self == "<null>" || self == "(null)" || self == "null" {
            return false
        }
        return true
    }
    
    func isStringEmpty() -> Bool {
        return self.trimWhiteSpace().count == 0 ? true : false
    }
    
    mutating func removeSubString(subString: String) -> String {
        if self.contains(subString) {
            guard let stringRange = self.range(of: subString) else { return self }
            return self.replacingCharacters(in: stringRange, with: "")
        }
        return self
    }
    
    func trimWhiteSpaceAndNewLine() -> String {
        return self.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
    }
    
    func trimWhiteSpace() -> String {
        return self.trimmingCharacters(in: NSCharacterSet.whitespaces)
    }
    
    
    // MARK: - Class Methods
    static func getString(_ message: Any?) -> String {
        guard let strMessage = message as? String else {
            guard let doubleValue = message as? Double else {
                guard let intValue = message as? Int else {
                    guard let int64Value = message as? Int64 else {
                        return ""
                    }
                    return String(int64Value)
                }
                return String(intValue)
            }
            
            let formatter = NumberFormatter()
            formatter.minimumFractionDigits = 0
            formatter.maximumFractionDigits = 2
            formatter.minimumIntegerDigits = 1
            guard let formattedNumber = formatter.string(from: NSNumber(value: doubleValue)) else {
                return ""
            }
            return formattedNumber
        }
        return strMessage.trimWhiteSpaceAndNewLine()
    }
    
    static func getLength(_ message: Any?) -> Int {
        return String.getString(message).trimWhiteSpaceAndNewLine().count
    }
}
