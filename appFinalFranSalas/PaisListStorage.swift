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
        print(urlBandera)
        
        pais.flag.af_setImage(withURL: urlBandera!, placeholderImage: pais.flag.image){response in
            
            
           
           
            print("se ha descargado la imagen parece \(response.data)")
            
            
            self.paises.append(pais)
            
            self.delegatePais?.paisListStorage(self, didAddCountry: pais ,bandera: response.data!)
        }
       
        
       
        
        /*
        Alamofire.request(urlBandera!).responseImage { response in
            //Aquí ya podremos trabajar con los datos de la respuesta

        let imagen  = response.data!
            
            //https://stackoverflow.com/questions/35854764/load-image-from-url-in-tableview-cell-from-alamofire-swift
        pais.flag.af_setImage(withURL: urlBandera!, placeholderImage: pais.flag.image)
            print(pais.flag.image)
        self.paises.append(pais)
        
        self.delegatePais?.paisListStorage(self, didAddCountry: pais)
            
 
            
    }*/
        
        
    }
    
}
        




protocol PaisListStorageDelegate: class
{
    func paisListStorage(_: PaisListStorage, didAddCountry country: Pais, bandera: Data)
    func banderaListStorage(_: PaisListStorage, didAddCountryWithFlag p:Pais, b: UIImage)
    
}


