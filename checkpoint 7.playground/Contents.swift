import UIKit

class Animal {
    var legs: Int
    
    init(legs: Int) {
        self.legs = legs
    }
}

class Dog: Animal {
    
    override init(legs: Int) {
        super.init(legs: legs)
    }
    
    func speak(){
        print("I'm a generic doggy barking!")
    }
}

class Corgi: Dog {
    override init(legs: Int) {
        super.init(legs: legs)
    }
    
    override func speak() {
        print("bow bow yipee oh")
    }
}

class Poodle: Dog {
    override init(legs: Int) {
        super.init(legs: legs)
    }
    
    override func speak() {
        print("yippe yay bow wow")
    }
}

class Cat: Animal {
    
    var isTame: Bool
    
    init(isTame: Bool, legs: Int) {
        self.isTame = isTame
        super.init(legs: legs)
    }
    
    func speak() {
        print("meow mix please deliver")
    }
}

class Persian: Cat {
    override init(isTame: Bool, legs: Int) {
        super.init(isTame: isTame, legs: legs)
    }
    
    override func speak() {
        print("I'm a persian meow")
    }
}


class Lion: Cat {
    override init(isTame: Bool, legs: Int) {
        super.init(isTame: isTame, legs: legs)
    }
    
    override func speak() {
        print("I'm a lion meow")
    }
}


var dog1 = Dog(legs: 4)
var poodle = Poodle(legs: 4)
var corgi = Corgi(legs: 4)
dog1.speak()
poodle.speak()
corgi.speak()

var cat1 = Cat(isTame: true, legs: 4)
var persion = Persian(isTame: true, legs: 4)
var tiger = Lion(isTame: false, legs: 4)

cat1.speak()
persion.speak()
tiger.speak()
