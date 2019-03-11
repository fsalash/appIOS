//
//  DetallePaisViewController.swift
//  appFinalFranSalas
//
//  Created by Fran on 10/3/19.
//  Copyright © 2019 Fran. All rights reserved.
//

import UIKit

class DetallePaisViewController: UIViewController {

    @IBOutlet weak var lblDetallePais: UILabel!
    
    var nombrePais = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        lblDetallePais.text = nombrePais
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


