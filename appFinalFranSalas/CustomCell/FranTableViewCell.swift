//
//  FranTableViewCell.swift
//  appFinalFranSalas
//
//  Created by Fran on 4/3/19.
//  Copyright © 2019 Fran. All rights reserved.
//

import Foundation
import UIKit
import SVGKit
    
    class FranTableViewCell: UITableViewCell {

         
        @IBOutlet weak var flag: UIImageView!
        @IBOutlet weak var lblTitulo: UILabel!
        
        @IBOutlet weak var lblTituloPaisFavorito: UILabel!
        override func awakeFromNib() {
            super.awakeFromNib()
            // Initialization code

        }

        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated:  animated)
            
            // Configure the view for the selected state
            //print("celda seleccionada: FranTableViewCell-setSelected ")
             
            }
        
      
        
    }


