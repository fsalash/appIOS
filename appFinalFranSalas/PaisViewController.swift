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
    
    
    
    private  var bandera = UIImage()
    private let paisListStorage = PaisListStorage ()
    //private var pelisCellControllers: [PelisCellController] = []
  
   
    
    @IBOutlet var tableView: UITableView!
     
    
    func paisListStorage(_: PaisListStorage, didAddCountry pais: Pais) {
        
       self.tableView.reloadData()
        
    }
    
    func paisListStorage(_: PaisListStorage, didAddCountryWithFlag p: Pais, b: UIImage) {
      print ("ANTIGUO")
    }
    
    func banderaListStorage(_: PaisListStorage, didAddCountryWithFlag p: Pais, b: UIImage) {
        
       // print ("pais \(p.name) ")
       // print ("url bandera \(p.flag)")
        
        //bandera = b
       // print("reload data porque tengo la bandera")
        self.tableView?.reloadData()
    }
    
    
    
    // MARK: - Table view data source
    
     func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        //print("me llaman para ver cuantas secciones pintar en la tabla: 1")
        return 1
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
       // print("me llaman para ver cuantas filas pintar en la tabla --> \(paisListStorage.paises.count)")
        return paisListStorage.paises.count
    }
    
     func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
       // print("celda --> \(indexPath) \(paisListStorage.paises[indexPath.row])")
 
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celdaPais", for: indexPath)
         as! FranTableViewCell
        
        //let pais :Pais = paisListStorage.paises[indexPath.row]
         //self.paisListStorage.getBandera(pais: pais, urlBandera: pais.flag)
        
        //print("me llaman para reutilizar celda con indice \(indexPath.row) ")
        // Configure the cell...
        //print(cell.titulo)
        
        //print("cellForRowAt")
       // print("title: \(paisListStorage.paises[indexPath.row])")
        //cell.textLabel?.text =  paisListStorage.paises[indexPath.row].name
        cell.lblTitulo.text = paisListStorage.paises[indexPath.row].name
       print("pais.flag.image --> \(paisListStorage.paises[indexPath.row].flag.image)")
       
        cell.flag = paisListStorage.paises[indexPath.row].flag
        //cell.txtTituloPelicula?.text = pelisListStorage.pelis[indexPath.row].title
        //cell.setDirector(director: pelisListStorage.pelis[indexPath.row].director)
        /*cell.lblFecha.text = "pelisListStorage.pelis[indexPath.row].release_date"
         */
        return cell
    }
    
    
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

       
        
        print("pelisviewcontroller")
        // Do any additional setup after loading the view.
        //tableView.register(FranTableViewCell.self, forCellReuseIdentifier: "celdaPais")
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
