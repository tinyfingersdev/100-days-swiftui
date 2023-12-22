import UIKit

protocol Building {
    var numberRooms: Int {get}
    var buildingCost: Int {get}
    var buildingType: String {get}
    var agentName: String {get set}
    
    func salesSummary()
}


extension Building{
    func salesSummary() {
        print("""
            Building Type: \(buildingType)
            Building Cost: \(buildingCost)
            Agent Name: \(agentName)
            Cost: \(buildingCost)
        
        """)
    }
}

struct House: Building {
    
    var numberRooms: Int
    var buildingCost: Int
    var agentName: String
    let buildingType: String = "House"

}


struct Office: Building {
    
    var numberRooms: Int
    var buildingCost: Int
    var agentName: String
    var buildingType: String

}


let house = House(numberRooms: 5, buildingCost: 250_000, agentName: "Bob Smith")
let office = House(numberRooms: 15, buildingCost: 1_000_000, agentName: "Bob George")

house.salesSummary()
office.salesSummary()
