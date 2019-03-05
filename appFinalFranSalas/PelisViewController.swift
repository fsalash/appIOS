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
class PelisViewController: UITableViewController, PelisListStorageDelegate {
   
    var pelis:[String] = []
    
    private let pelisListStorage: PelisListStorage
    //private var pelisCellControllers: [PelisCellController] = []
  
    
    //@IBOutlet var tableView: UITableView!
     
    
    func pelisListStorage(_: PelisListStorage, didAddPeli peli: Pelicula) {
        print("añado nueva peli --> \(peli.title)")
        pelis.append(peli.title)
        
        tableView.reloadData()
    }
    
    init(pelisListStorage: PelisListStorage)
    {
        print("en  init")
        self.pelisListStorage = pelisListStorage
        super.init(nibName: nil, bundle: nil)
        self.pelisListStorage.delegate = self
    }
    
    required convenience init?(coder aDecoder: NSCoder)
    {
        print("en convenience init?")
        self.init(pelisListStorage: PelisListStorage())
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        print("me llaman para ver cuantas secciones pintar en la tabla: 1")
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        print("me llaman para ver cuantas filas pintar en la tabla --> \(pelis.count)")
        return pelis.count
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        print("celda --> \(indexPath) \(pelis[indexPath.row])")
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celdaPeli", for: indexPath)
         as! FranTableViewCell
        
        print("me llaman para reutilizar celda con indice \(indexPath.row) ")
        // Configure the cell...
        //print(cell.titulo)
        
        print("title: \(pelis[indexPath.row])")
        cell.textLabel?.text =  pelis[indexPath.row]
        cell.lblTitulo?.text = pelis[indexPath.row]
        //cell.txtTituloPelicula?.text = pelisListStorage.pelis[indexPath.row].title
        //cell.setDirector(director: pelisListStorage.pelis[indexPath.row].director)
        /*cell.lblFecha.text = "pelisListStorage.pelis[indexPath.row].release_date"
         */
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

       
        
        print("pelisviewcontroller")
        // Do any additional setup after loading the view.
        tableView.register(FranTableViewCell.self, forCellReuseIdentifier: "celdaPeli")
        
        tableView.delegate = self
        tableView.dataSource = self
        pelisListStorage.getPelis()
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
