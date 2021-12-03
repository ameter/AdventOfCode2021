import Foundation

let input = Day3.input.map {
    Array($0).map(String.init).compactMap(Int.init)
}

let numBits = input.first!.count

func getMostCommonBit(data: [[Int]], pos: Int) -> Int {
    let cnt1 = data.filter { $0[pos] == 1 }.count
    let cnt0 = data.count - cnt1
    return (cnt1 >= cnt0) ? 1 : 0
}

func getLeastCommonBit(data: [[Int]], pos: Int) -> Int {
    getMostCommonBit(data: data, pos: pos) == 1 ? 0 : 1
}

// part 1
var gamma = [Int]()
var epsilon = [Int]()

for i in 0..<numBits{
    gamma.append(getMostCommonBit(data: input, pos: i))
    epsilon.append(getLeastCommonBit(data: input, pos: i))
}

let result1 = Int(gamma.map(String.init).joined(), radix: 2)! * Int(epsilon.map(String.init).joined(), radix: 2)!
print(result1)


// part 2
enum Rating {
    case o2, co2
}

func getRating(_ rating: Rating) -> Int {
    var data = input
    for pos in 0..<numBits {
        let bit = (rating == .o2) ?
            getMostCommonBit(data: data, pos: pos) :
            getLeastCommonBit(data: data, pos: pos)
        data = data.filter { $0[pos] == bit }
        if data.count == 1 { break }
    }
    return Int(data.first!.map(String.init).joined(), radix: 2)!
}

let result2 = getRating(.o2) * getRating(.co2)
print(result2)
