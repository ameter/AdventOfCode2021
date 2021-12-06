import Foundation

let input = Day6.input

// fish state, number of fish in that state
var fishes = [Int : Int]()

// initialize fishes
for i in 0...8 {
    fishes[i] = 0
}

// load input into fishes
for fish in input {
    fishes[fish]! += 1
}

func updateFish() {
    let spawns = fishes[0]!
    
    for i in 1...8 {
        fishes[i - 1] = fishes[i]
    }
    
    fishes[8] = spawns
    fishes[6]! += spawns
}

// update fishes each day
for _ in 0..<256 {
    updateFish()
}

print(fishes.values.reduce(0, +))
