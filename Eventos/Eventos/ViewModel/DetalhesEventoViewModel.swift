import UIKit

protocol DetalhesEventoViewModelProtocol {
    
    var detalhesEventoDidChanges: ((Bool, Bool) -> Void)? { get set }
    
    var eventoId: String? { get set }
    
    func fetchDetalhesEventoList()
}
class DetalhesEventoViewModel: DetalhesEventoViewModelProtocol {
    
    //MARK: - Internal Properties
    
    var detalhesEventoDidChanges: ((Bool, Bool) -> Void)?
    
    var eventoId: String?
    
    var detalhesEventos: DetalhesEventos? {
        didSet {
            self.detalhesEventoDidChanges!(true, false)
        }
    }
    
    func fetchDetalhesEventoList() {
        
        DetalhesEventoAPIService.instance.fetchDetalhesEventos(eventoId: eventoId!) { result in
            
            switch result {
                
            case .success(let data):
                
                let mappedModel = try? JSONDecoder().decode(DetalhesEventos.self, from: data)
                
                self.detalhesEventos = mappedModel
                
                break
            case .failure(let error):
                
                print(error.description)
            }
        }
    }
}
