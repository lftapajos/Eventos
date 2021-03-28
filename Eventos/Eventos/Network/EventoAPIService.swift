import UIKit

class EventoAPIService: NSObject, Requestable {
    
    static let instance = EventoAPIService()
    
    fileprivate let laundryUrl = "http://5f5a8f24d44d640016169133.mockapi.io/api/events"
    
    public var eventos: [ListaEventos]?
    public var eventoId: String?
    
    // Prepare the service
    
    func prepare(callback: @escaping([ListaEventos]?,Bool) -> Void) {
        
        //let filePath = Bundle.main.url(forResource: "evento", withExtension: "json")
        
        //let originalContents = try? Data(contentsOf: filePath!)
        
        //let eventos = try? JSONDecoder().decode([Evento].self, from: originalContents!)
        
        callback(eventos!, false)
    }
    
    func fetchEventos(callback: @escaping Handler) {
        
        request(method: .get, url: Domain.baseUrl() + APIEndpoint.eventos) { (result) in
            
            callback(result)
        }
        
    }
    
}
