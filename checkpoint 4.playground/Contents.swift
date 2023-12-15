import UIKit


enum SquareError: Error {
    case noRoot
    case outOfBounds
}


func findSquare(number: Int) throws -> Int {
    if number < 1 || number > 10000 {
        throw SquareError.outOfBounds
    }
    
    var i = 0
    var root = 1
    
    for i in 1...100 {
        
        if i * i == number {
            return i
        }
        
        if i * i  > number {
            break
        }
    }
    
    throw SquareError.noRoot
}

do {
    print(try findSquare(number: 10000))
} catch SquareError.noRoot {
    print("there was no root")
} catch SquareError.outOfBounds {
    print("number was out of bounds")
} catch {
    print("some other error happened")
}

