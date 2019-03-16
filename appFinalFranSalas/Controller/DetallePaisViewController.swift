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
   
 
    @IBOutlet weak var txtCapital: UILabel!
    @IBOutlet weak var txtRegion: UILabel!
    @IBOutlet weak var txtIdiomas: UILabel!
    @IBOutlet weak var txtPoblacion: UILabel!
    @IBOutlet weak var txtMonedas: UILabel!
    @IBOutlet weak var lblDetallePais: UILabel!
    @IBOutlet weak var imgBanderaPais: UIImageView!
    @IBOutlet weak var imgFavorito: UIImageView!
    
    private let banderaListStorage = BanderaListStorage ()
    var esFavorito : Bool = false
    
    var pais = Pais()
    
    
  
  
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //print("DetallePaisViewController")
        
        self.banderaListStorage.delegateBandera = self
        
        self.banderaListStorage.getBandera(pais: pais)
      
        
    }
    
    
    /*
     // MARK: - Delegate
     
     // Se entera de que se ha recibido respuesta desde alamo y se ha creado una nueva bandera que podria mostrar en el detalle del pais
     }
     */
    
    func banderaStorage(_: BanderaListStorage, banderaLista country: Pais) {
        
        
        let imagenSVG = SVGKFastImageView(svgkImage: SVGKImage(data: country.dataFlag))
        
        imgBanderaPais.image = imagenSVG?.image.uiImage
        lblDetallePais.text = pais.name 
        txtCapital.text = pais.capital
        txtRegion.text = pais.region
        
        for lang in pais.languages{
  
            if(lang.count > 0){ // me vienen del parseo algunos valores a linea en blanco que no pinto
                let bulletPoint: String = "\u{2022}"
                let fila = bulletPoint + lang + "\n"
                txtIdiomas.text?.append(fila)
                
            }
            
        }
       
        for curr in pais.currencies{
            
            if(curr.count > 0){ // me vienen del parseo algunos valores a linea en blanco que no pinto
                let bulletPoint: String = "\u{2022}"
                let fila = bulletPoint + " " + curr + "\n"
                txtMonedas.text?.append(fila)
                
            }
        }
        
        
        
        txtPoblacion.text   = String(pais.population)
       
 
        //por defecto tiene puesto el corazon vacio en el storyBoard
        if (esFavorito){
            imgFavorito.image = UIImage(named: "corazonlleno.png")
        }
       
        
    }
    
    
    /*
     // MARK: - TapGesture sobre corazon para favoritos
     
     // Almacenar paises favoritos para trabajar con persistencia
     }
     */
    @IBAction func tocanBtnFavorito(_ sender: Any) {
        
        if (esFavorito){
            print ("eliminar como favorito")
            imgFavorito.image = UIImage(named: "corazonvacio.png")
            esFavorito = false
        }
        else{
            print ("meter como favorito")
             imgFavorito.image = UIImage(named: "corazonlleno.png")
            esFavorito = true
        }
       
        
        
    }
    
    

    
   
}


