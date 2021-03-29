import UIKit
import Alamofire

class EventoViewCell: UITableViewCell {

    @IBOutlet weak var picture: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var activitity: UIActivityIndicatorView!
    
    var eventoItem: ListaEventos? {
        
        didSet {
            
            if let evento = eventoItem {
                
                self.titleLabel.text = evento.title ?? ""
                
                //print(evento.image!)
                Alamofire.request(evento.image!).responseData { response in
                    if case .success(let image) = response.result {
                        DispatchQueue.main.async(execute: {
                            self.activitity.stopAnimating()
                            self.activitity.hidesWhenStopped = true
                            self.picture.image = UIImage(data: image)
                        })
                    }
                }
                
                self.picture.contentMode = .scaleToFill
            }
        }
    }
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
