import Foundation

let input = Day1.input

// Part 1

var previous = Int.max
var result1 = 0

for current in input {
    if current > previous {
        result1 += 1
    }
    previous = current
}

print(result1)


// Part 2

var result2 = 0

for (idx, measurement) in input.enumerated() {
    if idx + 3 == input.count { break }
    
    if measurement < input[idx + 3] {
        result2 += 1
    }
}

print(result2)
