import UIKit
import CoreGraphics

/** 数值 */
let constant = 10
var number = 10
var x = number + constant

number = 50

/** 双精度浮点数 */
let num = 0.1 + 0.2
print("num", num)

/** 整数与浮点数 */
let a = 1
let b = 2.1
// Binary operator '+' cannot be applied to operands of type 'Int' and 'Double'
//let c = a + b
let c = Double(a) + b
print("c", c)

let d = a + Int(b)
print("d", d)

/** 字符串 */
var str = "hhah"
str.uppercased()
str.count
str.lowercased()

/** 字符串拼接  */
var s = str + String(number)

s = "aaaaa \(number)"

/** 多行文本  */
var muiltText = """
    使用三个引号定义
    多行文本
"""
print(muiltText)


/** 字符串取值 */
let emojiStr = "💩👻​😤​😱​👾​"
print(emojiStr.count)
//  error: 'subscript(_:)' is unavailable: cannot subscript String with an Int, use a String.Index instead.
//print(emojiStr[0])

let index = emojiStr.index(emojiStr.startIndex, offsetBy: 0)
let char = emojiStr[index]  //  i

print("char", char)

/** if 流程控制 */


number = 60
/** switch  */
switch number {
case 80...:
        print("than 80")
case 60...80:
        print("switch 60-80")
case 50:
        print("switch 50")
default:
    print("just some")
}

/** Array  */
var bookCollection = ["book1", "book2", "book3"]
bookCollection.count;
bookCollection.append("book4")
bookCollection.count;
bookCollection.last
bookCollection.sort()

var cities = ["London", "Tokyo", "Rome", "Budapest"]
print(cities.sorted())
print(cities.sort())

for index in 0...bookCollection.count - 1 {
    print(bookCollection[index])
}

//for book in bookCollection {
//    print(book)
//}

/** Dictionary */
var bookCollectionDict = ["1328683788": "Tool of Titans", "0307463745": "Rework", "1612060919": "Authority"]
bookCollectionDict["0307463745"]

// 遍历是无序的
for (key, value) in bookCollectionDict {
    print("ISBN: \(key), Title: \(value)")
}

var emojiDict = ["👻​":"Ghost",
                 "💩": "Poop",
                 "😤​" :"Angry",
                 "😱​" :"Scream",
                 "👾​" : "Alien monster"
                ]

var wordToLookup = "👻​"
var meaning: String? = emojiDict[wordToLookup]

// meaning 可能为nil（空）
if let meaning = meaning {
    print(meaning)
}

wordToLookup = "😤​"
meaning = emojiDict[wordToLookup]

if let meaning = meaning {
    print(meaning)
}

let results = [
    "english": 100,
    "french": 85,
    "geography": 75
]
// 读取不存在的值时，默认0
let historyResult = results["history", default: 0]


var people = Set(["A", "B", "C", "D"])
// 插入是无序的
people.insert("E")
print(people)

people.contains("A")

/** 枚举 */
enum Weekday {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
}

var day = Weekday.monday
day = .tuesday
day = .friday


//
let platforms = ["iOS", "macOS", "tvOS", "watchOS"]

// xcode中输入for plat 时就会自动提示
for platform in platforms {
    if platform == "macOS"  {
        continue
    }
    if platform == "watchOS"  {
        break
    }
    print("Swift works great on \(platform).")
}


/** 类型注解  */
var username: String

/** 可选  */
var jobTitle: String?

/** nil 报错 */
//var jobTitle


/** UI绘制  */
let containerView = UIView(frame: CGRect(x:0, y: 0, width: 300, height: 200))

containerView.backgroundColor = UIColor.orange

let emojiLabel = UILabel(frame: CGRect(x: 95, y: 20, width: 150, height: 150))

emojiLabel.text = wordToLookup
emojiLabel.font = UIFont.systemFont(ofSize: 100.0)

containerView.addSubview(emojiLabel)


/** 函数  */
func sum(num1: Int, num2: Int) -> Int {
    return num1 + num2
}

print(sum(num1: 1, num2: 2))


// 省略参数名称
func count(_ num1: Int,_ num2: Int) -> Int {
    return num1 + num2
}
print(count(1, 2))

// 函数重载
func hireEmployee(name: String) -> Int {
    return 1
}
func hireEmployee(name: String) -> Bool {
    return true
}
func hireEmployee(age: Int) -> Bool {
    return true
}
func hireEmployee(title: String) -> Bool {
    return true
}
func hireEmployee(location: String) { }

// number 内部参数名
func printTimesTables(for number: Int, end: Int = 2) {
    for i in 1...end {
        print("\(i) x \(number) is \(i * number)")
    }
}
// for 外部参数名
printTimesTables(for: 5)


// 错误处理
enum PasswordError: Error {
    case short, obvious
}

func checkPassword(_ password: String) throws -> String {
    if password.count < 5 {
        throw PasswordError.short
    }

    if password == "12345" {
        throw PasswordError.obvious
    }

    if password.count < 8 {
        return "OK"
    } else if password.count < 10 {
        return "Good"
    } else {
        return "Excellent"
    }
}

let string = "12345"

do {
    let result = try checkPassword(string)
    print("Password rating: \(result)")
} catch PasswordError.short {
    print("Please use a longer password.")
} catch PasswordError.obvious {
    print("I have the same combination on my luggage!")
} catch {
    print("There was an error.")
}

/** 闭包  */
let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]
let sortedTeam = team.sorted()
print(sortedTeam)

// 指定排序函数
func captainFirstSorted(name1: String, name2: String) -> Bool {
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }

    return name1 < name2
}
print(team.sorted(by: captainFirstSorted))

// 使用闭包函数
print(team.sorted(by: { (name1: String, name2: String) -> Bool in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }
    
    return name1 < name2
 }))


/** 尾随闭包  */
func animate(duration: Double, animations: () -> Void) {
    print("Starting a \(duration) second animation…")
    animations()
}

animate(duration: 3, animations: {
    print("Fade out the image")
})
// 尾随闭包，如果最后一个参数是函数则可以像这样使用
animate(duration: 3) {
    print("Fade out the image")
}

/** 带返回值的闭包作为函数 */
func reduce(_ values: [Int], using closure: (Int, Int) -> Int) -> Int {
    var current = values[0]
    
    for value in values[1...] {
        current = closure(current, value)
    }
    
    return current
}

let numbers = [10, 20, 30]

let sum = reduce(numbers) { (runningTotal: Int, next: Int) in
    runningTotal + next
}

print(sum)

// swift 的运算符本质就是函数， 所以reduce函数还能
print(reduce(numbers, using: +))


// 闭包函数作为返回值
// 获取start ～ end的随机数
func getTenRandom(_ start: Int = 1) -> (Int) -> Int {
    let function = { (end: Int) -> Int in
        return Int.random(in: start...end)
    }
    return function
}

let tempGetTenRandom = getTenRandom(2)

print("123", tempGetTenRandom(20))

print("456", tempGetTenRandom(10))


/** 速记参数  */
let reverseTeam = team.sorted { $0 > $1 }
print(reverseTeam)

let tOnly = team.filter { $0.hasPrefix("T") }
print(tOnly)


/** 结构 */
struct Employee {
    let name: String
    var vacationRemaining = 12
    // 任何更改属于结构的数据的函数都必须用特殊的 mutating 关键字标记
    mutating func takeVacation(days: Int) {
        if vacationRemaining > days {
            vacationRemaining -= days
            print("I'm going on vacation!")
            print("Days remaining: \(vacationRemaining)")
        } else {
            print("Oops! There aren't enough days remaining.")
        }
    }
}

var archer = Employee(name: "Sterling Archer", vacationRemaining: 14)
archer.takeVacation(days: 5)
print(archer.vacationRemaining)

var archer2 = Employee.init(name: "Sterling Archer", vacationRemaining: 14)
var archer3 = Employee(name: "Sterling Archer")

