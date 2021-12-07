import Foundation

var input = Day7.input
let costTable = (input.min()!...input.max()!).map {(0...$0).reduce(0, +)}

let lowest = (input.min()!...input.max()!).reduce(Int.max) { lowest, position in
    let cost = input.reduce(0) {$0 + costTable[abs(position - $1)]}
    return min(lowest, cost)
}

print(lowest)
