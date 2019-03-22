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
    
    var favoritos = [NSManagedObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.banderaListStorage.delegateBandera = self
    
        if((pais.dataFlag ).count > 0){
            //me han llamado desde favoritos y ya tengo toda la info del pais--> Monto la vista
            montaVista(country: pais)
            esFavorito = true
        }
        else{
           self.banderaListStorage.getBandera(pais: pais)
        }
        
        
    }

    
    //CORE DATA
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

       recargaContextoFavoritos()
        
        
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
        lblDetallePais.text = pais.name as String
        txtCapital.text = pais.capital as String
        txtRegion.text = pais.region as String
        
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
            deleteFavorito(pais)
            
        }
        else{
            print ("meter como favorito")
             imgFavorito.image = UIImage(named: "corazonlleno.png")
            esFavorito = true
            saveFavorito(pais)
           }
        
    }
    
    func saveFavorito(_ objPais: Pais) {
        
        //1
        let appDelegate =
            UIApplication.shared.delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        //2
        let entity =  NSEntityDescription.entity(forEntityName: "PaisFavorito",                                   in:managedContext)!
        
        let pais = NSManagedObject(entity: entity,
                                   insertInto: managedContext)
        
        //3
        pais.setValue(objPais.name, forKey: "nombre")
        pais.setValue(objPais.region, forKey: "region")
        pais.setValue(objPais.capital, forKey: "capital")
        pais.setValue(objPais.currencies, forKey: "monedas")
        pais.setValue(objPais.dataFlag, forKey: "dataFlag")
        pais.setValue(objPais.population, forKey: "poblacion")
        pais.setValue(objPais.languages, forKey: "idiomas")
        pais.setValue(objPais.lat, forKey: "latitud")
        pais.setValue(objPais.long, forKey: "longitud")
        
        //4
        do {
            try managedContext.save()
            //5
            esFavorito = true
            muestraMensaje(msgAlerta : "Pais guardado como favorito correctamente")
        } catch let error as NSError  {
            print("Error guardando favorito \(error), \(error.userInfo)")
        }
    }
    
    
    func deleteFavorito(_ objPais: Pais) {
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "PaisFavorito")
    
        fetchRequest.predicate = NSPredicate(format: "nombre = %@", objPais.name)

        let appDelegate =
            UIApplication.shared.delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        do{
            let query = try managedContext.fetch(fetchRequest)
            let paisFavoritoABorrar = query[0] as! NSManagedObject
            managedContext.delete(paisFavoritoABorrar)
            try managedContext.save()
            
            //llamo al delegado para que a la vuelta a la tabla de favoritos esté recargada 
          // self.favoritosListStorage.favoritoBorrado()
            
        }catch let error as NSError  {
            print("Error borrando pais favorito \(error), \(error.userInfo)")
        }
            

        muestraMensaje(msgAlerta : "Pais eliminado de favoritos correctamente")
        esFavorito = false
        
        recargaContextoFavoritos()
        
    }
    
    func recargaContextoFavoritos(){
        
        //1
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        //2
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "PaisFavorito")
        
        //3
        do {
            favoritos = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        
    }

    func muestraMensaje(msgAlerta : String){
        
        let alert = UIAlertController(title: msgAlerta, message: "Pulse aceptar para continuar", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: nil))
        
        self.present(alert, animated: true)
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



