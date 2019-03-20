//
//  FranViewController.swift
//  appFinalFranSalas
//
//  Created by Fran on 4/3/19.
//  Copyright © 2019 Fran. All rights reserved.
//

import UIKit
import CoreData

class FranViewController:  UIViewController {

    var favoritos = [NSManagedObject]()
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "fondoMundo.jpeg")!)
        // Do any additional setup after loading the view.
        
        
    }
    
   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
    
    @IBAction func verPaises(_ sender:   UIButton) {
        
        performSegue(withIdentifier: "seguePaises", sender: sender)
    }
    
    
    @IBAction func verFavoritos(_ sender: UIButton) {
        
        //recuperar favoritos de persistencia
        //encufarle los favoritos recuperados al tableviewcontroller destino para que lo meta en la tabla

        performSegue(withIdentifier: "segueFavoritos", sender: sender)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 
        if segue.identifier == "segueFavoritos"
        {
            if let destinationVC = segue.destination as? FavoritosTableViewController {
                //print(pais!.name)
                //print(destinationVC.lblDetallePais.text)
                destinationVC.paisesFavoritos = favoritos
            }
        }
    }
    
    
}
