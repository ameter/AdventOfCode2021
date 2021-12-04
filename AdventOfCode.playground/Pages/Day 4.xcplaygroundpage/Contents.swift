import Foundation

let draws = Day4.inputDraws
var boards = Day4.inputBoards

func checkForWin(_ board: [Int]) -> Bool {
    var rows = [Int: [Int]]()
    var cols = [Int: [Int]]()
    for (pos, val) in board.enumerated() {
        rows[pos / 5] = (rows[pos / 5] ?? []) + [val]
        cols[pos % 5] = (cols[pos % 5] ?? []) + [val]
    }
    for row in rows {
        if row.value.filter({$0 < 0}).count == 5 {
            return true
        }
    }
    for col in cols {
        if col.value.filter({$0 < 0}).count == 5 {
            return true
        }
    }
    return false
}

// part 1
var result1: Int?
for draw in draws {
    for i in 0..<boards.count {
        boards[i] = boards[i].map {
            $0 == draw ? 0 - $0 : $0
        }

        if checkForWin(boards[i]) {
            let score = boards[i].filter{$0 > 0}.reduce(0, +)
            result1 = score * draw
            break
        }
    }
    if result1 != nil { break }
}

print(result1!)

// part 2
boards = Day4.inputBoards
var winners = Set<Int>()
var result2: Int?
for draw in draws {
    for i in 0..<boards.count {
        boards[i] = boards[i].map {
            $0 == draw ? -1 : $0
        }
        
        if checkForWin(boards[i]) {
            winners.insert(i)
            if winners.count == boards.count {
                let score = boards[i].filter{$0 > 0}.reduce(0, +)
                result2 = score * draw
                break
            }
        }
    }
    if result2 != nil { break }
}

print(result2!)
