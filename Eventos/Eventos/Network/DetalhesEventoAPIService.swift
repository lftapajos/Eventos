import UIKit

class DetalhesEventoAPIService: NSObject, Requestable {
    
    static let instance = DetalhesEventoAPIService()
    
    fileprivate let laundryUrl = "http://5f5a8f24d44d640016169133.mockapi.io/api/events/1"
    
    public var detalhesEventos: [DetalhesEventos]?
    public var eventoId: String?
    
    // Prepare the service
    
    func prepare(callback: @escaping([DetalhesEventos]?,Bool) -> Void) {
        
        callback(detalhesEventos!, false)

    }
    
    func fetchDetalhesEventos(eventoId: String, callback: @escaping Handler) {
        
        //print(Domain.baseUrl() + APIEndpoint.eventos + "/\(eventoId)")
        
        requestDetalhes(method: .get, url: Domain.baseUrl() + APIEndpoint.eventos + "/\(eventoId)") { (result) in
            
            callback(result)
        }
        
    }
    
}
