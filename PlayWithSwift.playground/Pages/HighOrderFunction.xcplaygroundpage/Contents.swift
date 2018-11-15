//: [Previous](@previous)

import Foundation

struct Employee {
    var name: String
    var companyName: String
    var id: String
    var city: String
    var projects: [String]?
    
    static let employees = [
        Employee(name: "Amit", companyName: "Microsoft", id: "101", city: "Banglore", projects: ["A1", "A2", "A3"]),
        Employee(name: "Sahil", companyName: "Robo Soft", id: "102", city: "Delhi", projects: ["B1", "B2", "B3"]),
        Employee(name: "Jacob", companyName: "Google Inc", id: "103", city: "Noida", projects: ["C1", "C2", "C3"]),
        Employee(name: "Vijay", companyName: "TCS", id: "550", city: "Pune", projects: ["D1", "D2", "D3"]),
        Employee(name: "Rahul", companyName: "Infosys", id: "551", city: "Banglore", projects: ["E1", "E2", "E3"]),
        Employee(name: "Amir", companyName: "Facebook", id: "601", city: "Noida", projects: ["F1", "F2", "F3"])]
}


// Without using high order functions
print("------------ Without using High Order Functions -------------")

var names = [String]()
for employee in Employee.employees {
    names.append(employee.name)
}
print("Result using for loop: ", names)




// Map: It performs on every element in a collection and perform an operation to each element in the given collection.
print("\n\n\n\n------------ Map Examples -------------")
let names1 = Employee.employees.map { (emp) -> String in
    return emp.name
}
print("Names 1: ", names1)

// OR: Another short syntax (When we have only single argument in map closure then we can use like below)
let names2 = Employee.employees.map{$0.name} // here $0 called Numbered Argument shorthand
print("Names 2: ", names2)

let projects = Employee.employees.map( {$0.projects} )
print("Array of projects: ", projects)


// Here, notice that return type of result is not limited to type of original element.
let empIds = Employee.employees.map { (emp) -> Int in
    return Int(emp.id) ?? 0 // Original empID is type of String but we are returning as Int.
}
print("Employee IDs: ", empIds)


// MAP with Dictionary object
let persons = ["name1": "Alex", "name2": "John", "name3": "Mickie"]
let personNames = persons.map { key, value in value}
print("Person Names: \(personNames)")

let pointsInMeter = ["point1": 500.0, "point2": 325.0, "point3": 1000.0, "point4": 5000.0]
let pointsInKm = pointsInMeter.map { key, value -> Double in
    return value / 1000
}
print("Points in KM: \(pointsInKm)")




// FlatMap: It's a variation on "map". It give us a single set of elements and will remove unnecessery or 'nil'.
print("\n\n\n\n------------ FlatMap Examples -------------")
let allProjects = Employee.employees.flatMap { (emp) -> [String] in
    return emp.projects!
}
print("All projects list: ", allProjects)

let marks = [[2, 4, 67, 3], [7, 8, 5, 90], [12, 34, 21, 0]]
let allMarks = marks.flatMap{$0}
print("All marks: \(allMarks)")

let passingMarks = marks.flatMap{ $0.filter{ $0 > 20} }
print("Passing marks: \(passingMarks)")



// CompactMap: It's a variation on "map". It is use to strip nil from given collection. It's a close variation of "flatMap". Before Swift 4.1, we were used "flatMap" in case also when collection contains optional type value. In Swift 4.1, flatMap has renamed as "compactMap" which is used when collection returns optional value.
let studentNames = ["Nicke", "John", nil, "Shera", "Johnson", nil]
let allNames = studentNames.compactMap{ $0 } // short syntax
print("All student names: \(allNames)")

let allNames1 = studentNames.compactMap { (name) -> String? in // full syntax
    return name
}
print("All student names 1: \(allNames1)")

let nameCharCounts = studentNames.compactMap{ $0?.count }
print("Char count array: \(nameCharCounts)")

// On Swift 4.2, it will show as <flatMap' is deprecated: Please use compactMap(_:) for the case where closure returns an optional value>.
let namesByFlatMap = studentNames.flatMap{ $0 }
print("Names using flat map: \(namesByFlatMap)")

let nameByMap = studentNames.map({ $0 })
print("Names using map: \(nameByMap)")




// Filter: It performs on every element in a collection and returns a collection containing only those items that match the condition.
print("\n\n\n\n------------ Filter Examples -------------")
let empsOfNoida = Employee.employees.filter { (emp) -> Bool in
    emp.city == "Noida"
}
print("Number of emplyees living in Noida: ", empsOfNoida.count)

let noidaEmployeeNames = Employee.employees.filter( {$0.city == "Noida"} ).map( {$0.name} )
print("Employees names those are living in Noida: ", noidaEmployeeNames)




// Reduce: It performs on every element in a collection and combines all elements into single value.
print("\n\n\n\n------------ Reduce Examples -------------")
let oneLineName = Employee.employees.reduce("") { (namesString, emp) -> String in
    
    // here ("") -> Initial value
    // namesString -> current value
    // emp -> next element
    return namesString.appending(emp.name + " ")
}
print(oneLineName)

let numbers = [2, 56, 43, 9, 5]
print("Sum: \(numbers.reduce(0, +))")
