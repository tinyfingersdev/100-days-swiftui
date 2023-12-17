import UIKit


enum GearDirection {
    case down
    case up
}

struct CarInfo {
    let model: String
    let numberSeats: Int
    private var currentGear: Int = 1
    
    init(model: String, numberSeats: Int) {
        self.model = model
        self.numberSeats = numberSeats
    }
    
    mutating func changeGear(gearDirection: GearDirection) {
        if gearDirection == GearDirection.up && currentGear < 10 {
            currentGear += 1
            print("Current gear is \(currentGear)")
        } else if currentGear > 2 {
            currentGear -= 1
            print("Current gear is \(currentGear)")
        }
    }
}


var carInfo = CarInfo(model: "Ford Pinto", numberSeats: 10)
carInfo.changeGear(gearDirection: GearDirection.up)

