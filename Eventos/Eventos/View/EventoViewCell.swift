//
//  EventoViewCell.swift
//  Eventos
//
//  Created by Luis Felipe Tapajos on 24/03/2021.
//  Copyright © 2021 Luis Felipe Tapajos. All rights reserved.
//

import UIKit

class EventoViewCell: UITableViewCell {

    @IBOutlet weak var picture: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var eventoItem: ListaEventos? {
        
        didSet {
            
            if let evento = eventoItem {
                
                self.titleLabel.text = evento.title ?? ""
                
                //self.picture.image = UIImage(named: evento.image!)
                
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
