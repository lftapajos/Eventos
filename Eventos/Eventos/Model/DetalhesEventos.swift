struct DetalhesEventos: Decodable {
    let date: Int?
    let description: String?
    let image: String?
    let longitude: Double?
    let latitude: Double?
    let price: Double?
    let title: String?
}

extension DetalhesEventos {
    enum CodingKeysString: String, CodingKey {
        typealias RawValue = String
        case date, description, image, longitude, latitude, price, title, String
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeysString.self)
        self.date = try container.decodeIfPresent(Int.self, forKey: .date)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
        self.image = try container.decodeIfPresent(String.self, forKey: .image)
        self.longitude = try container.decodeIfPresent(Double.self, forKey: .longitude)
        self.latitude = try container.decodeIfPresent(Double.self, forKey: .latitude)
        self.price = try container.decodeIfPresent(Double.self, forKey: .price)
        self.title = try container.decodeIfPresent(String.self, forKey: .title)
    }
}
