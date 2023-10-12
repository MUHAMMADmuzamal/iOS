import Cocoa

var greeting = "Hello, playground"


protocol LogProcessor{
    static let INFO = 1
    static let DEBUG = 2
    static let ERROR = 3
    
    var nextLogProcessor: Self
}
