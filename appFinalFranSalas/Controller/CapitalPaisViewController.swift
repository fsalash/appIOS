//
//  DetallePaisViewController.swift
//  appFinalFranSalas
//
//  Created by Fran on 10/3/19.
//  Copyright © 2019 Fran. All rights reserved.
//

import UIKit
import SVGKit
import CoreData

class CapitalPaisViewController: UIViewController,BanderaListStorageDelegate {
  
  
    
    @IBOutlet weak var txtCapital: UILabel!
    @IBOutlet weak var txtRegion: UILabel!
    @IBOutlet weak var lblDetallePais: UILabel!

    @IBOutlet weak var imgBanderaPais: UIImageView!
    

    var esFavorito : Bool = false
    var pais = Pais()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if((pais.dataFlag ).count > 0){
            //vengo del listado y tengo toda la info del pais--> Monto la vista
            montaVista(country: pais)
        }
        
        
    }

    
    //CORE DATA
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

       //recargaContextoFavoritos()
        
        
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //print("prepareForSegue")
        if segue.identifier == "segueMapaPais"
        {
            if let destinationVC = segue.destination as? MapaPaisViewController {
                destinationVC.latitud = self.pais.lat
                destinationVC.longitud = self.pais.long
                destinationVC.nombrePais = self.pais.name
            }
        }
        else{
            if (segue.identifier == "segueCapital"){
                print("a ver la capital")
            }
        }

    }
    
    @IBAction func posMapa(_ sender: Any) {
        
        performSegue(withIdentifier: "segueMapaPais", sender: self)
    }
   
    /*
     // MARK: - Delegate
     
     // Se entera de que se ha recibido respuesta desde alamo y se ha creado una nueva bandera que podria mostrar en el detalle del pais
     }
     */
    
    func banderaStorage(_: BanderaListStorage, banderaLista country: Pais) {
        
        
        montaVista(country:country)
        
    }
    

    func montaVista(country: Pais){
        
        
        let imagenSVG = SVGKFastImageView(svgkImage: SVGKImage(data: country.dataFlag ))
        
        imgBanderaPais.image = imagenSVG?.image.uiImage
        txtCapital.text = pais.capital as String
        txtRegion.text = pais.region as String
        lblDetallePais.text = pais.name as String
        
        /*
        lblDetallePais.text = pais.name as String
        
        
        for lang in pais.languages{
            
            if((lang ).count > 0){ // me vienen del parseo algunos valores a linea en blanco que no pinto
                let bulletPoint: String = "\u{2022}"
                let fila = bulletPoint + " " +  (lang ) + "\n"
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
        if (esFavorito(nombrePais : pais.name )){
            imgFavorito.image = UIImage(named: "corazonlleno.png")
            esFavorito = true
        }
        else{
            imgFavorito.image = UIImage(named: "corazonvacio.png")
            esFavorito = false
        }
         */
        
    }
    
   
   
    
    

    //deteccion transicion modo horizontal - vertical
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        if UIDevice.current.orientation.isLandscape {
            print("Landscape")
            
            print(size.height)
            print(size.width)
            
        } else {
           print("Portrait")
            print(size.height)
            print(size.width)
        }
    }
    
    
}



