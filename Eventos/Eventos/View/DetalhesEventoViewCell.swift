//
//  DetalhesEventoViewCell.swift
//  Eventos
//
//  Created by Luis Felipe Tapajos on 28/03/2021.
//  Copyright © 2021 Luis Felipe Tapajos. All rights reserved.
//

import UIKit
import Alamofire

class DetalhesEventoViewCell: UITableViewCell {

    @IBOutlet weak var picture: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var activitity: UIActivityIndicatorView!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var priceTextLabel: UILabel!
    @IBOutlet weak var dateTextLabel: UILabel!
    @IBOutlet weak var longitudeTextLabel: UILabel!
    @IBOutlet weak var latitudeTextLabel: UILabel!
    @IBOutlet weak var shareButto: UIButton!
    @IBOutlet weak var favoriteButton: UIButton!

    var eventoItem: DetalhesEventos? {
        
        didSet {
            
            if let evento = eventoItem {
                
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
                
                self.titleLabel.text = evento.title!
                self.descriptionTextView.text = evento.description!
                self.priceTextLabel.text = "\(String(describing: evento.price!))"
                self.dateTextLabel.text = "\(String(describing: evento.date!))"
                self.longitudeTextLabel.text = "\(String(describing: evento.longitude!))"
                self.latitudeTextLabel.text = "\(String(describing: evento.latitude!))"
            }
        }
    }
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        
        //super.setSelected(selected, animated: false)
        
        // Configure the view for the selected state
    }
    
}
