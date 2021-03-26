import Foundation
//import Alamofire

/*
struct EventoDec : Decodable {
    
    let pepople: [String]?
    let date: Int?
    let description: String?
    let image: String?
    let longitude: Double?
    let latitude: Double?
    let price: Decimal?
    let title: String?
    let id: String?
    
    enum CodingKeys: String, CodingKey {
        case pepople = "pepople"
        case date = "date"
        case description = "description"
        case image = "image"
        case longitude = "longitude"
        case latitude = "latitude"
        case price = "price"
        case title = "title"
        case id = "id"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        //evento = try values.decodeIfPresent([Evento].self, forKey: .evento)
        pepople = try values.decodeIfPresent([String].self, forKey: .pepople)
        date = (try values.decodeIfPresent(Int.self, forKey: .date))!
        description = try values.decodeIfPresent(String.self, forKey: .description)
        image = try values.decodeIfPresent(String.self, forKey: .image)
        longitude = try values.decodeIfPresent(Double.self, forKey: .longitude)
        latitude = try values.decodeIfPresent(Double.self, forKey: .latitude)
        price = try values.decodeIfPresent(Decimal.self, forKey: .price)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        id = try values.decodeIfPresent(String.self, forKey: .id)
    }
    
}

struct EventoResponseModel : Codable {
    let evento : [Evento]?
    
    enum CodingKeys: String, CodingKey {
        case evento = "eventos"
    }
    
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
 pepople = try values.decodeIfPresent([String].self, forKey: .pepople)
 date = (try values.decodeIfPresent(Int.self, forKey: .date))!
 description = try values.decodeIfPresent(String.self, forKey: .description)
 image = try values.decodeIfPresent(String.self, forKey: .image)
 longitude = try values.decodeIfPresent(Double.self, forKey: .longitude)
 latitude = try values.decodeIfPresent(Double.self, forKey: .latitude)
 price = try values.decodeIfPresent(Decimal.self, forKey: .price)
 title = try values.decodeIfPresent(String.self, forKey: .title)
 id = try values.decodeIfPresent(String.self, forKey: .id)
    }
 
    
}
*/

struct Evento: Decodable {
    let image: String
    let title: String
    //let id: String
    
    enum CodingKeys: String, CodingKey {
        case image = "image", title = "title"//, id = "id"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        image = (try container.decodeIfPresent(String.self, forKey: .image))!
        title = (try container.decodeIfPresent(String.self, forKey: .title))!
        //id = (try container.decodeIfPresent(String.self, forKey: .id))!
    }
}

/*
struct Evento: Codable {

    let people: [String]?
    let date: Int?
    let description: String?
    let image: String?
    let longitude: Double?
    let latitude: Double?
    let price: Decimal?
    let title: String?
    let id: String?
    */
    //let title: String?
    
    /*
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
     
     people = "people", date = "date", description = "description", image = "image", longitude = "longitude", latitude = "latitude", price = "price", id = "id",
 
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
    }
    
    /// Decode
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        title = try container.decodeIfPresent(String.self, forKey: .title)
        //container.decode(String.self, forKey: .title)
 
 */
        /*
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        people = try container.decode([String].self, forKey: .people)
        date = try container.decode(Int.self, forKey: .date)
        description = try container.decode(String.self, forKey: .description)
        image = try container.decode(String.self, forKey: .image)
        longitude = try container.decode(Double.self, forKey: .longitude)
        latitude = try container.decode(Double.self, forKey: .latitude)
        price = try container.decode(Decimal.self, forKey: .price)
        title = try container.decode(String.self, forKey: .title)
        id = try container.decode(String.self, forKey: .id)
 */
   // }
    /*
    
    /// Encode
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(date, forKey: .date)
        try container.encode(description, forKey: .description)
        try container.encode(image, forKey: .image)
        try container.encode(longitude, forKey: .longitude)
        try container.encode(latitude, forKey: .latitude)
        try container.encode(price, forKey: .price)
        try container.encode(title, forKey: .title)
        try container.encode(id, forKey: .id)
    }
    */
    
    /*
    public init(from decoder: Decoder) throws {
        //let values = try decoder.container(keyedBy: CodingKeys.self)
        date = try decoder.container(keyedBy: CodingKeys.date)

        //date = try values.decode(Int.self, forKey: .date)
        description = try values.decode(String.self, forKey: .description)
        image = try values.decode(String.self, forKey: .image)
        longitude = try values.decode(Double.self, forKey: .longitude)
        latitude = try values.decode(Double.self, forKey: .latitude)
        price = try values.decode(Decimal.self, forKey: .price)
        title = try values.decode(String.self, forKey: .title)
        id = try values.decode(String.self, forKey: .id)
    }
    
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        //pepople = try values.decodeIfPresent([String].self, forKey: .pepople)
        date = try decoder.container(keyedBy: date)
        description = try decoder.container(keyedBy: description)
        image = try decoder.container(keyedBy: image)
        longitude = try decoder.container(keyedBy: longitude)
        latitude = try decoder.container(keyedBy: latitude)
        price = try decoder.container(keyedBy: price)
        title = try decoder.container(keyedBy: title)
        id = try decoder.container(keyedBy: id)
    }
    */
//}

extension Array where Element == Evento {
    
    func matching(_ query: String) -> [Evento] {
        
        return self.filter({ $0.title == query })
    }
    
    func sortByName() -> [Evento] {
        
        return self.sorted(by: { (first, next) -> Bool in
            
            return first.title.compare(next.title) == .orderedAscending
        })
    }
}

//let server = "http://5f5a8f24d44d640016169133.mockapi.io/api/events"

/*
Alamofire.request(server, method: .get)
    .responseJSON { response in
        if response.data != nil {
            let json = JSON(data: response.data!)
        }
}
*/

/*
 public init(pepople: [String], date: Int, description: String, image: String, longitude: Double, latitude: Double, price: Decimal, title: String, id: String) {
 self.pepople = pepople
 self.date = date
 self.description = description
 self.image = image
 self.longitude = longitude
 self.latitude = latitude
 self.price = price
 self.title = title
 self.id = id
 }
 public func getDescription() -> String {
 return "\(self.description)"
 }
*/

/*
extension Evento {
    
    init(data: Data) throws {
        self = try JSONDecoder().decode(Evento.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func jsonData() throws -> Data {
        return try JSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
 */

/*
"people": [],
"date": 1534784400,
"description": "O Patas Dadas estará na Redenção, nesse domingo, com cães para adoção e produtos à venda!\n\nNa ocasião, teremos bottons, bloquinhos e camisetas!\n\nTraga seu Pet, os amigos e o chima, e venha aproveitar esse dia de sol com a gente e com alguns de nossos peludinhos - que estarão prontinhos para ganhar o ♥ de um humano bem legal pra chamar de seu. \n\nAceitaremos todos os tipos de doação:\n- guias e coleiras em bom estado\n- ração (as que mais precisamos no momento são sênior e filhote)\n- roupinhas \n- cobertas \n- remédios dentro do prazo de validade",
"image": "http://lproweb.procempa.com.br/pmpa/prefpoa/seda_news/usu_img/Papel%20de%20Parede.png",
"longitude": -51.2146267,
"latitude": -30.0392981,
"price": 29.99,
"title": "Feira de adoção de animais na Redenção",
"id": "1"
*/
