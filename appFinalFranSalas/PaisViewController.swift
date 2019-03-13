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
   
    private  var flag = Data()
    private let paisListStorage = PaisListStorage ()
  
    private let paisDetalle = DetallePaisViewController()

  
    
    @IBOutlet var tableView: UITableView!
    
    
    func paisListStorage(_: PaisListStorage, didAddCountry pais: Pais) {
        
     //   print("han dado de alta un nuevo elemento en el array de paises -> \(pais.flag.image), \
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
    
  
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("didSelectRowAtIndexPath")
        
        let paisSeleccionado = paisListStorage.paises[indexPath.row]
        //segue para ir a detalle de pais
         performSegue(withIdentifier: "segueDetallePais", sender: paisSeleccionado)
    }
    
    
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
    
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celdaPais", for: indexPath)
         as! FranTableViewCell
        
        cell.lblTitulo.text = paisListStorage.paises[indexPath.row].name
        cell.flag.image = UIImage(named: "masInfo.png")
        
        
      
        return cell
    }
    
    
    func callSegueFromCell(myData dataobject: AnyObject) {
       
        performSegue(withIdentifier: "segueDetallePais", sender: self)
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
