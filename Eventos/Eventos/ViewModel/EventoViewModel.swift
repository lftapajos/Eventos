import UIKit

protocol EventoViewModelProtocol {
    
    var eventoDidChanges: ((Bool, Bool) -> Void)? { get set }
    
    func fetchEventoList()
    
    func convertMilisecoundsToDate(milisecond: Int) -> String
    
}
class EventoViewModel: EventoViewModelProtocol {
    
    //MARK: - Internal Properties
    
    var eventoDidChanges: ((Bool, Bool) -> Void)?
    
    var eventos: [ListaEventos]? {
        didSet {
            self.eventoDidChanges!(true, false)
        }
    }
    
    func fetchEventoList() {
        
        self.eventos = [ListaEventos]()
        
        EventoAPIService.instance.fetchEventos { result in
            
            switch result {
                
            case .success(let data):
                
                let mappedModel = try? JSONDecoder().decode([ListaEventos].self, from: data)
                
                self.eventos = mappedModel
                
                break
            case .failure(let error):
                
                print(error.description)
            }
        }
    }
    
    func convertMilisecoundsToDate(milisecond: Int) -> String {
        let dateVar = Date.init(timeIntervalSinceNow: TimeInterval(milisecond)/1000)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy hh:mm:ss"
        return "\(dateVar)"
    }
}
