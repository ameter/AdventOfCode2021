import Foundation

let input = Day9.input.map {
    Array($0).map(String.init).compactMap(Int.init)
}


func lowPoint(row: Int, col: Int) -> Bool {
    let val = input[row][col]
    if col > 0 {
        if input[row][col - 1] <= val {
            return false
        }
    }
    if col < input[row].count - 1 {
        if input[row][col + 1] <= val {
            return false
        }
    }
    if row > 0 {
        if input[row - 1][col] <= val {
            return false
        }
    }
    if row < input.count - 1 {
        if input[row + 1][col] <= val {
            return false
        }
    }
    return true
}

func basin(row: Int, col: Int, members: Set<[Int]> = Set<[Int]>() ) -> Set<[Int]> {
    var members = members
    members.insert([row, col])
    if col > 0 {
        if input[row][col - 1] < 9 && !members.contains([row, col - 1]) {
            members = members.union(basin(row: row, col: col - 1, members: members))
        }
    }
    if col < input[row].count - 1 {
        if input[row][col + 1] < 9 && !members.contains([row, col + 1]) {
            members = members.union(basin(row: row, col: col + 1, members: members))
        }
    }
    if row > 0 {
        if input[row - 1][col] < 9 && !members.contains([row - 1, col]) {
            members = members.union(basin(row: row - 1, col: col, members: members))
        }
    }
    if row < input.count - 1 {
        if input[row + 1][col] < 9 && !members.contains([row + 1, col]) {
            members = members.union(basin(row: row + 1, col: col, members: members))
        }
    }
    return members
}

// part 1
//var sum = 0
//for row in 0..<input.count {
//    for col in 0..<input[row].count {
//        if lowPoint(row: row, col: col) {
//            sum += (input[row][col] + 1)
//        }
//    }
//}
//print(sum)

// part 2
var basinSizes = [Int]()
for row in 0..<input.count {
    for col in 0..<input[row].count {
        if lowPoint(row: row, col: col) {
            basinSizes.append(basin(row: row, col: col).count)
        }
    }
}

dump(basinSizes.sorted{$0 > $1}[0..<3].reduce(1, *))
