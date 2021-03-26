import Foundation

struct ListaEventos {
    let title: String?
    let id: String?
    let image: String?
    let description: String?
}

struct Eventos: Decodable {
    enum CodingKeys: String, CodingKey {
        case pepople, date, description, image, longitude, latitude, price, title, id
    }
    let pepople: [String]?
    let date: Int?
    let description: String?
    let image: String?
    let longitude: Double?
    let latitude: Double?
    let price: Decimal?
    let title: String?
    let id: String?
}

extension ListaEventos: Decodable {
    enum CodingKeys: String, CodingKey {
        typealias RawValue = String
        
        //case title, bool
        case title, id, image, description, String
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try container.decodeIfPresent(String.self, forKey: .title)
        self.id = try container.decodeIfPresent(String.self, forKey: .id)
        self.image = try container.decodeIfPresent(String.self, forKey: .image)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
    }
}
