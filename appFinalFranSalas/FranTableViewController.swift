//
//  FranTableViewController.swift
//  appFinalFranSalas
//
//  Created by Fran on 4/3/19.
//  Copyright © 2019 Fran. All rights reserved.
//

import UIKit
import Foundation

class FranTableViewController: UITableViewController,PelisListStorageDelegate
{
    
    
    var peliculas:[Pelicula] = []
    
    func pelisListStorage(_: PelisListStorage, didAddPeli peli: Pelicula) {
        print("añado nueva peli --> \(peli.title)")
        //peliculas.append(peli)
        
        self.tableView.reloadData()
    }
    
   
    private let pelisListStorage: PelisListStorage
    private var pelisCellControllers: [PelisCellController] = []
    
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.register(FranTableViewCell.self, forCellReuseIdentifier: "celdaPeli")
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        pelisListStorage.getPelis()
        //self.tableView.reloadData()
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        print("me llaman para ver cuantas secciones pintar en la tabla: 1")
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        print("me llaman para ver cuantas filas pintar en la tabla --> \(pelisListStorage.pelis.count)")
        return pelisListStorage.pelis.count
    }


    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celdaPeli", for: indexPath) as! FranTableViewCell

        print("me llaman para reutilizar celda con indice \(indexPath.row) ")
        // Configure the cell...
        //print(cell.titulo)
        
        print("title: \(pelisListStorage.pelis[indexPath.row].title)")
        //cell.textLabel?.text =  pelisListStorage.pelis[indexPath.row].title
        
        //cell.txtTituloPelicula?.text = pelisListStorage.pelis[indexPath.row].title
        //cell.setDirector(director: pelisListStorage.pelis[indexPath.row].director)
        //cell.txtDirector.text = pelisListStorage.pelis[indexPath.row].director
        /*cell.lblFecha.text = "pelisListStorage.pelis[indexPath.row].release_date"
        */
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
