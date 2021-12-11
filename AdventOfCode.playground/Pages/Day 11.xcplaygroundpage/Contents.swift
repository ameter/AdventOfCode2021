import Foundation

var input = Day11.input.map {
    Array($0).map(String.init).compactMap(Int.init)
}

func printOctopuses() {
    for row in input {
        print(row.map(String.init).joined())
    }
}

func flash(_ row: Int, _ col: Int) {
    flashCount += 1
    input[row][col] = -1
    if col > 0 {
        if input[row][col - 1] > -1 {
            input[row][col - 1] += 1
            if input[row][col - 1] > 9 {
                flash(row, col - 1)
            }
        }
    }
    if col < input[row].count - 1 {
        if input[row][col + 1] > -1 {
            input[row][col + 1] += 1
            if input[row][col + 1] > 9 {
                flash(row, col + 1)
            }
        }
    }
    if row > 0 {
        if input[row - 1][col] > -1 {
            input[row - 1][col] += 1
            if input[row - 1][col] > 9 {
                flash(row - 1, col)
            }
        }
    }
    if row < input.count - 1 {
        if input[row + 1][col] > -1 {
            input[row + 1][col] += 1
            if input[row + 1][col] > 9 {
                flash(row + 1, col)
            }
        }
    }
    
    if col > 0 && row > 0 {
        if input[row - 1][col - 1] > -1 {
            input[row - 1][col - 1] += 1
            if input[row - 1][col - 1] > 9 {
                flash(row - 1, col - 1)
            }
        }
    }
    if col < input[row].count - 1 && row > 0 {
        if input[row - 1][col + 1] > -1 {
            input[row - 1][col + 1] += 1
            if input[row - 1][col + 1] > 9 {
                flash(row - 1, col + 1)
            }
        }
    }
    if row < input.count - 1 && col > 0 {
        if input[row + 1][col - 1] > -1 {
            input[row + 1][col - 1] += 1
            if input[row + 1][col - 1] > 9 {
                flash(row + 1, col - 1)
            }
        }
    }
    if row < input.count - 1 && col < input[row].count - 1 {
        if input[row + 1][col + 1] > -1 {
            input[row + 1][col + 1] += 1
            if input[row + 1][col + 1] > 9 {
                flash(row + 1, col + 1)
            }
        }
    }
}

//// part 1
//
//var flashCount = 0
//for _ in 0..<100 {
//
//    input = input.map { row in
//        row.map { col in
//            col + 1
//        }
//    }
//
//    for row in 0..<10 {
//        for col in 0..<10 {
//            if input[row][col] > 9 {
//                flash(row, col)
//            }
//        }
//    }
//
//    input = input.map { row in
//        row.map { col in
//            if col < 0 {
//                return 0
//            } else {
//                return col
//            }
//        }
//    }
//}
//
//print(flashCount)

// part 2

var flashCount = 0
var step = 0
while input.map({$0.max()!}).max()! > 0 {
    step += 1
    
    input = input.map { row in
        row.map { col in
            col + 1
        }
    }
    
    for row in 0..<10 {
        for col in 0..<10 {
            if input[row][col] > 9 {
                flash(row, col)
            }
        }
    }
    
    input = input.map { row in
        row.map { col in
            if col < 0 {
                return 0
            } else {
                return col
            }
        }
    }
}
print(step)
