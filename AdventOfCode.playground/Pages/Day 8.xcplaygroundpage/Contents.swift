import Foundation

let input:[([String], [String])] = Day8.input.map {
    let components = $0.components(separatedBy: " | ")
    let signals = components.first!.components(separatedBy: " ")
    let digits = components.last!.components(separatedBy: " ")
    return (signals, digits)
}

// part 1
//var count = 0
//for (signal, digits) in input {
//    count += digits.filter{ $0.count == 2 || $0.count == 3 || $0.count == 4 || $0.count == 7 }.count
//}
//print(count)

var signalMap = [Set<Character> : Int]()

func mapSignals(_ signals: [String]) -> [Set<Character> : Int] {
    var signalMap = [Set<Character> : Int]()
    
    let one = Set(signals.filter{$0.count == 2}.first!)
    let four = Set(signals.filter{$0.count == 4}.first!)
    let fourUnique = four.subtracting(one)
    
    signalMap[one] = 1
    signalMap[four] = 4
    signalMap[Set(signals.filter{$0.count == 3}.first!)] = 7
    signalMap[Set(signals.filter{$0.count == 7}.first!)] = 8
    
    // 6s
    signalMap[signals.filter{$0.count == 6}.map{Set($0)}.filter{$0.isSuperset(of: one) && $0.isSuperset(of: four)}.first!] = 9
    signalMap[signals.filter{$0.count == 6}.map{Set($0)}.filter{$0.isSuperset(of: fourUnique) && !$0.isSuperset(of: one)}.first!] = 6
    signalMap[signals.filter{$0.count == 6}.map{Set($0)}.filter{$0.isSuperset(of: one) && !$0.isSuperset(of: fourUnique)}.first!] = 0
    
    // 5s
    signalMap[signals.filter{$0.count == 5}.map{Set($0)}.filter{$0.isSuperset(of: one)}.first!] = 3
    signalMap[signals.filter{$0.count == 5}.map{Set($0)}.filter{!$0.isSuperset(of: one) && !$0.isSuperset(of: fourUnique)}.first!] = 2
    signalMap[signals.filter{$0.count == 5}.map{Set($0)}.filter{$0.isSuperset(of: fourUnique)}.first!] = 5
    
    return signalMap
}

var sum = 0
for (signals, digits) in input {
    let signalMap = mapSignals(signals)
    sum += Int(digits.map{String(signalMap[Set($0)]!)}.joined())!
}
print(sum)


