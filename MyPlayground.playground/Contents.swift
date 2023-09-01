import Cocoa

var greeting = "Hello, playground"

var optionalValue:Int? = 100
//if optionalValue != nil{
//    print("optional value: \(String(describing: optionalValue!))")
//}

// if let op = optionalValue{
//     print(op)
// }else{
//     print("op has no value: \(op)")
// }

func test(){
    guard let op =  optionalValue else{
    return
}
print("optioanlValue: \(op)")
    
}

let assumedString:String! = "Hello world"
let implicitUnwarp:String = assumedString
implicitUnwarp
assumedString

let minusValue = 9
print(-minusValue)


for i in 2...10{
    print(i)
}

var str = """
Hello how are you\
i am fine how about you?
"""
str =
#"""
how are you"""end
"""#

str[str.startIndex]
str[str.index(after: str.startIndex)]
str[str.index(before: str.endIndex)]
str[str.index(str.startIndex, offsetBy: 5)]
str = "1234567890"
let range = str.index(str.endIndex, offsetBy: -6)..<str.endIndex
str.removeSubrange(range)
