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

class PaisViewController: UIViewController,UITableViewDelegate,UITableViewDataSource, PaisListStorageDelegate {
   
    
    @IBOutlet var tableView: UITableView!
    
    private  var flag = Data()
    private let paisListStorage = PaisListStorage ()
    private let paisDetalle = DetallePaisViewController()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // self.view.backgroundColor = UIColor(patternImage: UIImage(named: "fondo.jpg")!)
        // Do any additional setup after loading the view.
        
        self.paisListStorage.delegatePais = self
        
        paisListStorage.getPaises()
    }
    
    
    // MARK: - Table view data source
    
     func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return paisListStorage.paises.count
    }
    
  
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
   
        let paisSeleccionado = paisListStorage.paises[indexPath.row]
        //segue para ir a detalle de pais
         performSegue(withIdentifier: "segueDetallePais", sender: paisSeleccionado)
    }
    
    
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celdaPais", for: indexPath)
         as! FranTableViewCell
        
        cell.lblTitulo.text = paisListStorage.paises[indexPath.row].name as! String
        cell.flag.image = UIImage(named: "masInfo.png")
        
        
      
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
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
