//
//  PelisListStorage.swift
//  appFinalFranSalas
//
//  Created by Fran on 3/3/19.
//  Copyright © 2019 Fran. All rights reserved.
//
import UIKit
import Alamofire



class PaisListStorage
{
    var delegatePais: PaisListStorageDelegate?
    
    var paises: [Pais] = []
    var contadorPaises = 0
    var contadorBanderas = 0
    
    func getPaises()
    {
        
        
        Alamofire.request("https://restcountries.eu/rest/v2/all").responseJSON { response in
            //Aquí ya podremos trabajar con los datos de la respuesta
            
    
                let data = response.data
       
                let paisesResult = (response.result.value as! NSArray)
             
                for p in paisesResult {

                        let pais = p as! NSDictionary
                 
                        //Primera prueba para poner la bandera en la pantalla principal (ahora pongo imagen de mas info
                        //self.getBandera(paisDictionary: pais)
           
                    
                     let nombre = pais.value(forKey:"name") as! String
                     let region = pais.value(forKey:"region") as! String
                     let flag = pais.value(forKey:"flag") as! String
   
                     
                     let country : Pais = Pais()
                     
                     country.name = nombre
                     country.region = region
                     country.flag = flag
                    
                    self.paises.append(country)
                    
                    // print("Voy por el pais--> \(self.contadorPaises)")
                    self.delegatePais?.paisListStorage(self, didAddCountry: country)
                   
            }
                
        }
            
    }
        
}



protocol PaisListStorageDelegate: class
{
    func paisListStorage(_: PaisListStorage, didAddCountry country: Pais)
    
}



