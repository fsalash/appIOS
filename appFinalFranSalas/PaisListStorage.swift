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
import Macaw
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
            
    
                let data = response.data
       
                let paisesResult = (response.result.value as! NSArray)
             
                for p in paisesResult {
                    
                    if(self.contadorPaises < 15){
                     //   print ("------- \(p))")
                        
                        let pais = p as! NSDictionary
                   /*
                        let nombre = pais.value(forKey:"name") as! String
                        let region = pais.value(forKey:"region") as! String
                        let flag = pais.value(forKey:"flag") as! String
                         
                        //print ("Pais--> \(nombre) ")
                        
                        let country : Pais = Pais()
                        
                        country.name = nombre
                        country.region = region*/
                        
                       // print("Voy por el pais--> \(self.contadorPaises)")
                        self.contadorPaises += 1
                        
                        self.getBandera(paisDictionary: pais)
                        
                        //el delegado final será el de bandera para pintar en tabla
                        //self.paises.append(country)
                        //self.delegatePais?.paisListStorage(self, didAddCountry: country)
                    }
                    else{
                        return
                    }
            }
                
        }
            
        
    }
    
    func getBandera(paisDictionary: NSDictionary){
        
        //print("obtencion de bandera \(pais.flag) para el pais: \(pais.name) y url de bandera param \(urlBandera) ")
        
        //print("Voy por la bandera--> \(self.contadorBanderas)")
        self.contadorBanderas += 1
        
        
        let urlBandera = URL(string: paisDictionary.value(forKey:"flag") as! String)
        //print(urlBandera)
        
 
        
      
        Alamofire.request(urlBandera!).response { response in
            //Aquí ya podremos trabajar con los datos de la respuesta
 
            print(response.response.debugDescription)
            guard response.data != nil else {
                print("Could not get image from image URL returned in search results")
                return
            }

            let uiimagen  = response.data!
        
            let pais = Pais()
            
            let anSVGImage: SVGKImage = SVGKImage(data: uiimagen)
            
            print(anSVGImage.size)
            
            pais.name = paisDictionary.value(forKey:"name") as! String
            pais.region = paisDictionary.value(forKey:"region") as! String
            pais.flag.image = anSVGImage.uiImage

            //print(pais.flag.image)
            //pais.flag.af_setImage(withURL: urlBandera!)
            
            self.paises.append(pais)
        
            print(self.paises.count)

           self.delegatePais?.paisListStorage(self, didAddCountry: pais)
    }
        
        
    
    
}
        
}



protocol PaisListStorageDelegate: class
{
    func paisListStorage(_: PaisListStorage, didAddCountry country: Pais)
    func banderaListStorage(_: PaisListStorage, didAddCountryWithFlag p:Pais, b: UIImage)
    
}



