import UIKit

func randoms(_ nums:[Int]?) -> Int {nums?.randomElement() ?? Int.random(in: 1...100)}

print(randoms([]))
print(randoms([1,2,3,4,5,6,7,8,9,10]))
