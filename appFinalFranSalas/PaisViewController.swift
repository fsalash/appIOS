//
//  PelisViewController.swift
//  appFinalFranSalas
//
//  Created by Fran on 4/3/19.
//  Copyright © 2019 Fran. All rights reserved.
//
import Foundation
import UIKit


//lo he dejado como tableviewcontroller siguiendo con el fallo
class PaisViewController: UIViewController,UITableViewDelegate,UITableViewDataSource, PaisListStorageDelegate {
    

    private  var bandera = Data()
    private let paisListStorage = PaisListStorage ()
    //private var pelisCellControllers: [PelisCellController] = []
  
    
    @IBOutlet var tableView: UITableView!
    
    
    func banderaListStorage(_: PaisListStorage, didAddCountryWithFlag p: Pais, b: UIImage) {
        //lo dejo pero ahora mismo no lo uso
    }
    
    func paisListStorage(_: PaisListStorage, didAddCountry pais: Pais) {
        
      //lo dejo pero ahora mismo no lo uso
    }
    
    func paisListStorage(_: PaisListStorage, didAddCountry p: Pais, bandera b: Data) {
        bandera = b
        print("reload data porque tengo la bandera \(bandera)")
        self.tableView.reloadData()
    }
    
    
    
    // MARK: - Table view data source
    
     func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        //print("me llaman para ver cuantas secciones pintar en la tabla: 1")
        return 1
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
      
        return paisListStorage.paises.count
    }
    
     func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
       print("celda --> \(indexPath) \(paisListStorage.paises[indexPath.row].name)")

    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celdaPais", for: indexPath)
         as! FranTableViewCell
        
        cell.lblTitulo.text = paisListStorage.paises[indexPath.row].name
        cell.flag.image = UIImage(data: bandera) // no pinta nada
        

        return cell
    }
    
    
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

       
        
        print("pelisviewcontroller")
        // Do any additional setup after loading the view.
          self.paisListStorage.delegatePais = self

        paisListStorage.getPaises()
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
