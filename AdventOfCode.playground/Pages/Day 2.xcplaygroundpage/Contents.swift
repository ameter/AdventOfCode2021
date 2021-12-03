import Foundation

let input = Day2.input

var depth = 0
var hor = 0
var aim = 0

for i in input {
    let command = i.split(separator: " ")
    let dir = command[0]
    let dist = Int(command[1])!
    
    switch dir {
    case "forward":
        hor += dist
        depth += aim * dist
    case "up":
        aim -= dist
    case "down":
        aim += dist
    default:
        break
    }
}

print(depth * hor)
