import UIKit
//Q-1 Palindrome Check Case Insensitive
extension String {
    var length: Int {
        return count
    }
    subscript (i: Int) -> String {
        return self[i ..< i + 1]
    }
    subscript (r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(length, r.lowerBound)),
                                            upper: min(length, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return String(self[start ..< end])
    }
}

func isPalindromeCaseInsensitive(str:String) -> Bool {
    guard str.count > 1 else { return true }
    for index in 0 ..< str.count / 2 {
        if str[index].lowercased() != str[str.count - index - 1].lowercased() {
            return false
        }
    }
    return true
}
print(isPalindromeCaseInsensitive(str: "Aba") ? "Palindrome!":"Not Palindrome!")

//Q-1 Palindrome Check Case Sensitive
func isPalindromeCaseSensitive(str:String) -> Bool {
    return str == String(str.reversed())
}
print(isPalindromeCaseSensitive(str: "Aba") ? "Palindrome!":"Not Palindrome!")

//Q-2
extension Array where Element: Hashable {
    func countOfElements() -> [Element:Int] {
        var elementCount = [Element: Int]()
        for element in self {
            elementCount[element] = (elementCount[element] ?? 0) + 1
        }
        return elementCount
    }
}
let intArr = [2,3,4,2,3,2,2,4,5,6]
let stringArr = ["C","C","Swift","Python","Python","Java"]
print(intArr.countOfElements())
print(stringArr.countOfElements())

//Q-3
func createPyramid(n: Int) {
    guard n > 0 else {return}
    for i in 1...n {
        print(String(repeating: "*", count: i))
    }
}
createPyramid(n: 5)

//Q-4
func createPyramidSecond(n: Int) {
    guard n > 0 else {return}
    for i in 1...n {
        print(String(repeating: " ", count: n-i),terminator: "")
        print(String(repeating: "* ", count: i))
    }
}
createPyramidSecond(n: 5)

//Q-5
func sumOfMultiples(n: Int) -> Int {
    var sum = 0
    for i in 1..<n {
        if i % 3 == 0 || i % 5 == 0 {
            sum += i
        }
    }
    return sum
}
print(sumOfMultiples(n: 1000))

//Q-6
func sumOfEvenFibonacciSeries(n: Int) -> Int {
    var prev = 0
    var cur = 1
    var sum = 0
    while cur <= n {
        let temp = prev
        prev = cur
        cur = temp + cur
        if cur % 2 == 0 {
            sum += cur
        }
    }
    return sum
}
print(sumOfEvenFibonacciSeries(n: 4000000))

//Q-7
func findLargestPrimeFactor(n: Int) -> Int {
    var temp = n
    var i = 2
    var divisors = [Int]()
    while i<=temp {
        while temp % i == 0 {
            temp/=i
            divisors.append(i)
        }
        i+=1
    }
    return divisors.sorted().last!
}
print(findLargestPrimeFactor(n: 600851475143))
