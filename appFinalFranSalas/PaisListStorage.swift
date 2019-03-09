//
//  PelisListStorage.swift
//  appFinalFranSalas
//
//  Created by Fran on 3/3/19.
//  Copyright © 2019 Fran. All rights reserved.
//
import UIKit
import Alamofire
import AlamofireImage
import SVGKit


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
            
            do{
                let data = response.data
       
                let paisesResult = (response.result.value as! NSArray)
             
                for p in paisesResult{
                 //   print ("------- \(p))")
                    
                    let pais = p as! NSDictionary
               
                    let nombre = pais.value(forKey:"name") as! String
                    let region = pais.value(forKey:"region") as! String
                    let flag = pais.value(forKey:"flag") as! String
                        
                    //print ("Pais--> \(nombre) ")
                    
                    let country : Pais = Pais()
                    
                    country.name = nombre
                    country.region = region
                    
                    print("Voy por el pais--> \(self.contadorPaises)")
                    self.contadorPaises += 1
                    
                    self.getBandera(pais: country, urlBanderaParam: flag)
                    
                    //el delegado final será el de bandera para pintar en tabla
                    //self.paises.append(country)
                    //self.delegatePais?.paisListStorage(self, didAddCountry: country)
                        
                }
                
            }
            
        }
        
    }
    
    func getBandera(pais: Pais,urlBanderaParam:String){
        
        //print("obtencion de bandera \(pais.flag) para el pais: \(pais.name) y url de bandera param \(urlBandera) ")
        
        let urlBandera = URL(string: urlBanderaParam)
      //  print("pais--> \(pais.name)  pide bandera -->\(urlBandera) ")
        print("Voy por la bandera--> \(self.contadorBanderas) , pais-> \(self.contadorPaises)")
        self.contadorBanderas += 1
        
        Alamofire.request(urlBandera!).responseImage { response in
            //Aquí ya podremos trabajar con los datos de la respuesta

        let imagen  = response.data!
     
        let country : Pais = Pais()
        
        country.name = pais.name
        country.region = pais.region
        
                
        //print("Pais--> \(self.contadorPaises), --> bandera: \(self.contadorBanderas)")
        self.contadorBanderas += 1
             

        self.paises.append(country)
        
        self.delegatePais?.paisListStorage(self, didAddCountry: country)
            
            
            
    }
        
        
    }
    
}
        




protocol PaisListStorageDelegate: class
{
    func paisListStorage(_: PaisListStorage, didAddCountry country: Pais)
    func banderaListStorage(_: PaisListStorage, didAddCountryWithFlag p:Pais, b: UIImage)
    
}


