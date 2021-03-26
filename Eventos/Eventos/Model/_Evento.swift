/*
import UIKit

class Evento: NSObject, NSCoding {
    
    let people: [String]?
    let date: Int?
    let description: String?
    let image: String?
    let longitude: Double?
    let latitude: Double?
    let price: Decimal?
    let title: String?
    let id: String?
    
    public init(people: [String], date: Int, description: String, image: String, longitude: Double, latitude: Double, price: Decimal, title: String, id: String) {
        self.people = people
        self.date = date
        self.description = description
        self.image = image
        self.longitude = longitude
        self.latitude = latitude
        self.price = price
        self.title = title
        self.id = id
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.people         = aDecoder.decodeObject(forKey : "people") as? [String]
        self.date           = aDecoder.decodeObject(forKey : "date") as? Int
        self.description    = aDecoder.decodeObject(forKey : "description") as? String
        self.image          = aDecoder.decodeObject(forKey : "image") as? String
        self.longitude      = aDecoder.decodeObject(forKey : "longitude") as? Double
        self.latitude       = aDecoder.decodeObject(forKey : "latitude") as? Double
        self.price          = aDecoder.decodeObject(forKey : "price") as? Decimal
        self.title          = aDecoder.decodeObject(forKey : "title") as? String
        self.id             = aDecoder.decodeObject(forKey : "id") as? String
    }
    
    // MARK: Methods
    func encode(with aCoder: NSCoder) {
        aCoder.encode(people, forKey: "people")
        aCoder.encode(date, forKey : "date")
        aCoder.encode(description, forKey : "description")
        aCoder.encode(image, forKey : "image")
        aCoder.encode(longitude, forKey: "longitude")
        aCoder.encode(latitude, forKey : "latitude")
        aCoder.encode(price, forKey : "price")
        aCoder.encode(title, forKey : "title")
        aCoder.encode(id, forKey : "id")
    }

}
*/

