//
//  DetallePaisViewController.swift
//  appFinalFranSalas
//
//  Created by Fran on 10/3/19.
//  Copyright © 2019 Fran. All rights reserved.
//

import UIKit
import SVGKit

class DetallePaisViewController: UIViewController,BanderaListStorageDelegate {
   

    @IBOutlet weak var lblDetallePais: UILabel!
    @IBOutlet weak var imgBanderaPais: UIImageView!
    
    private let banderaListStorage = BanderaListStorage ()
    
    var pais = Pais()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("DetallePaisViewController")
      
        self.banderaListStorage.delegateBandera = self
        
        lblDetallePais.text = pais.name + "(" + pais.region + ")"
        
        self.banderaListStorage.getBandera(pais: pais)
      
        
    }
    
    func banderaStorage(_: BanderaListStorage, banderaLista country: Pais) {
        
        
        let imagenSVG = SVGKFastImageView(svgkImage: SVGKImage(data: country.dataFlag))
        
        imgBanderaPais.image = imagenSVG?.image.uiImage
        
        
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

   
}


