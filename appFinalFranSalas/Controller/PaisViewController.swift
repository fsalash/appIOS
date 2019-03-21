//
//  PelisViewController.swift
//  appFinalFranSalas
//
//  Created by Fran on 4/3/19.
//  Copyright © 2019 Fran. All rights reserved.
//
import Foundation
import UIKit
import SVGKit

class PaisViewController: UIViewController,UITableViewDelegate,UITableViewDataSource, PaisListStorageDelegate,UISearchBarDelegate {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
  
    private  var flag = Data()
    private let paisListStorage = PaisListStorage ()
    private let paisDetalle = DetallePaisViewController()

    var filteredCountries = [Pais]()
    var searchActive = false
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // self.view.backgroundColor = UIColor(patternImage: UIImage(named: "fondo.jpg")!)
        // Do any additional setup after loading the view.
        
        self.paisListStorage.delegatePais = self
        self.searchBar.delegate = self
        paisListStorage.getPaises()
    }
    
    
    // MARK: - Table view data source
    
     func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        if (searchActive == false) {
                return paisListStorage.paises.count
        }
        else {
            //Me actualizan por barra de busqueda
            return filteredCountries.count
        }
    
    }
    
  
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
   
        
        var paisSeleccionado = paisListStorage.paises[indexPath.row]
        
         if (searchActive == true) {
            paisSeleccionado = self.filteredCountries[indexPath.row]
        }
        //segue para ir a detalle de pais
         performSegue(withIdentifier: "segueDetallePais", sender: paisSeleccionado)
    }
    
    
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celdaPais", for: indexPath)
         as! FranTableViewCell
        
        if (searchActive == false) {
            cell.lblTitulo.text = paisListStorage.paises[indexPath.row].name
        }else{
            cell.lblTitulo.text = filteredCountries[indexPath.row].name
        }
        
          cell.flag.image = UIImage(named: "masInfo.png")
      
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
    
        self.filteredCountries  = paisListStorage.paises.filter { (p: Pais) -> Bool in
            
            if p.name.lowercased().contains(searchText.lowercased()){
                return true
            } else{
                return false
            }
        }
        
        if(self.filteredCountries.count == 0){
            searchActive = false;
        } else {
            searchActive = true;
        }
        self.tableView.reloadData()
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
        if segue.identifier == "segueDetallePais"
        {
            let pais = sender as! Pais
            if let destinationVC = segue.destination as? DetallePaisViewController {
                //print(pais!.name)
                //print(destinationVC.lblDetallePais.text)
                destinationVC.pais = pais
            }
        }
    }
    
    
    
    /*
     // MARK: - Delegate
     
     // Se entera de que se ha recibido respuesta desde alamo y se ha creado un nuevo pais que podria mostrar en la tabla
     }
     */
    
    func paisListStorage(_: PaisListStorage, didAddCountry pais: Pais) {
         
        self.tableView.reloadData()
    }
    
   
    
    

}
