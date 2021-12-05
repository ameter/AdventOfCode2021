import Foundation

let input = Day5.input
var grid = Array(repeating: Array(repeating: 0, count: 999), count: 999)

//part 1
func markLine1(_ line: [(Int, Int)]) {
    let (x1, y1) = line.first!
    let (x2, y2) = line.last!
    if x1 == x2 {
        for y in min(y1, y2)...max(y1, y2) {
            grid[x1][y] += 1
        }
    }
    if y1 == y2 {
        for x in min(x1, x2)...max(x1, x2) {
            grid[x][y1] += 1
        }
    }
}

for line in input {
    markLine1(line)
}

var result1 = 0
for line in grid {
    result1 += line.filter{$0 >= 2}.count
}
print(result1)


//part 2
grid = Array(repeating: Array(repeating: 0, count: 999), count: 999)

func markLine2(_ line: [(Int, Int)]) {
    let (x1, y1) = line.first!
    let (x2, y2) = line.last!
    if x1 == x2 {
        for y in min(y1, y2)...max(y1, y2) {
            grid[x1][y] += 1
        }
    } else if y1 == y2 {
        for x in min(x1, x2)...max(x1, x2) {
            grid[x][y1] += 1
        }
    } else {
        let xPath = x1 <= x2 ? Array(x1...x2) : Array((x2...x1).reversed())
        let yPath = y1 <= y2 ? Array(y1...y2) : Array((y2...y1).reversed())
        let path = zip(xPath, yPath)
        for (x, y) in path {
            grid[x][y] += 1
        }
    }
}

for line in input {
    markLine2(line)
}

var result2 = 0
for line in grid {
    result2 += line.filter{$0 >= 2}.count
}
print(result2)
