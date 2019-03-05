//
//  FranTableViewCell.swift
//  appFinalFranSalas
//
//  Created by Fran on 4/3/19.
//  Copyright © 2019 Fran. All rights reserved.
//

import UIKit
    
    class FranTableViewCell: UITableViewCell {

        
        @IBOutlet weak var lblTitulo: UILabel!
        override func awakeFromNib() {
            super.awakeFromNib()
            // Initialization code
            
            lblTitulo.text = "prueba"
            print("llamada a francellview")
        }

        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)
            
            // Configure the view for the selected state
            
           //print("fran cell selected")
            

        }
        
      
        
    }


