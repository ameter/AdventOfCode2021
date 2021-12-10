import Foundation

let input = Day10.input.map(Array.init)

func isOpening(_ char: Character) -> Bool {
    ["(", "[", "{", "<"].contains(char)
}

func isPair(opening: Character, closing: Character) -> Bool {
    if opening == "(" && closing == ")" ||
        opening == "[" && closing == "]" ||
        opening == "{" && closing == "}" ||
        opening == "<" && closing == ">" {
        return true
    } else {
        return false
    }
}

let corruptScores: [Character : Int] = [
    ")" : 3,
    "]" : 57,
    "}" : 1197,
    ">" : 25137
]

let completionPoints: [Character : Int] = [
    ")" : 1,
    "]" : 2,
    "}" : 3,
    ">" : 4
]

class Stack {
    var items = [Character]()
    
    var isEmpty: Bool {
        items.isEmpty
    }
    
    func push(_ char: Character) {
        items.append(char)
    }
    
    func pop() -> Character? {
        if items.isEmpty {
            return nil
        } else {
            return items.removeLast()
        }
    }
}

let closing: [Character : Character] = [
    "(" : ")",
    "[" : "]",
    "{" : "}",
    "<" : ">"
]

func autoComplete(_ stack: Stack) -> [Character] {
    var completion = [Character]()
    
    while !stack.isEmpty {
        completion.append(closing[stack.pop()!]!)
    }
    
    return completion
}

var corruptScore = 0
var completionScores = [Int]()

var validLines = [[Character]]()

for line in input {
    let stack = Stack()
    var validLine = true
    for char in line {
        if isOpening(char) {
            stack.push(char)
        } else {
            if let opening = stack.pop() {
                if !isPair(opening: opening, closing: char) {
                    corruptScore += corruptScores[char]!
                    validLine = false
                    break
                }
            } else {
                corruptScore += corruptScores[char]!
                validLine = false
                break
            }
        }
    }
    
    if validLine {
        completionScores.append(autoComplete(stack).reduce(0) {$0 * 5 + completionPoints[$1]!})
    }
}

print(corruptScore)
print(completionScores.sorted()[completionScores.count / 2])

