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

class MonedasPaisViewController: UIViewController,BanderaListStorageDelegate {

    @IBOutlet weak var txtMonedas: UILabel!
    @IBOutlet weak var lblDetallePais: UILabel!
    
    
    var pais = Pais()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

    

            montaVista(country: pais)
        
       
        
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
        
    }
    

   
    /*
     // MARK: - Delegate
     
     // Se entera de que se ha recibido respuesta desde alamo y se ha creado una nueva bandera que podria mostrar en el detalle del pais
     }
     */
    
    func banderaStorage(_: BanderaListStorage, banderaLista country: Pais) {
        
     
    }
    

    func montaVista(country: Pais){
        
        lblDetallePais.text = pais.name as String
        
        for curr in pais.currencies{
            
            if(curr.count > 0){ // me vienen del parseo algunos valores a linea en blanco que no pinto
                let bulletPoint: String = "\u{2022}"
                let fila = bulletPoint + " " + curr + "\n"
                txtMonedas.text?.append(fila)
                
            }
        }
        
        /*
        let imagenSVG = SVGKFastImageView(svgkImage: SVGKImage(data: country.dataFlag ))
        
        imgBanderaPais.image = imagenSVG?.image.uiImage
        //lblDetallePais.text = pais.name as String
        txtCapital.text = pais.capital as String
        txtRegion.text = pais.region as String
        
        
        for lang in pais.languages{
            
            if((lang ).count > 0){ // me vienen del parseo algunos valores a linea en blanco que no pinto
                let bulletPoint: String = "\u{2022}"
                let fila = bulletPoint + " " +  (lang ) + "\n"
                txtIdiomas.text?.append(fila)
                
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
    
    func esFavorito (nombrePais : String) -> Bool{
    
        // Do any additional setup after loading the view.
        //print("DetallePaisViewController")
    
        //Me traigo los favoritos para saber si debo pintar el corazon lleno o vacio

        //1
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
        let managedContext = appDelegate.managedObjectContext
    
        //2
        let fetchRequest = NSFetchRequest<PaisFavorito>(entityName: "PaisFavorito")
    
        //3
        do {
            let favoritos = try managedContext.fetch(fetchRequest)
            
            for p in favoritos {
                
                if p.value(forKey: "nombre") as! String == nombrePais{
                    return true
                }
            }
        } catch let error as NSError {
        print("Could not fetch \(error), \(error.userInfo)")
        }
        
        return false
    }
    
    @IBAction func tocaBtnIdiomas(_ sender: Any) {
        
        performSegue(withIdentifier: "segueIdiomas", sender: self)
    }
    @IBAction func tocaBtnCapital(_ sender: Any) {
        
        performSegue(withIdentifier: "segueCapital", sender: self)
        
    }
    
    /*
     // MARK: - TapGesture sobre corazon para favoritos
     
     // Almacenar paises favoritos para trabajar con persistencia
     }
     */
    @IBAction func tocaBtnFavorito(_ sender: Any) {
        
      
        
    }
    
    func saveFavorito(_ objPais: Pais) {
  
    }
    
    
    func deleteFavorito(_ objPais: Pais) {
        
        
    }
    
    func recargaContextoFavoritos(){
        
        
    }

    func muestraMensaje(msgAlerta : String){
        
   
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



