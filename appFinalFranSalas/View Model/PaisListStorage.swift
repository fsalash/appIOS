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
  
                    
                    let nombre = pais.value(forKey:"name") as! String
                    let region = pais.value(forKey:"region") as! String
                    let flag = pais.value(forKey:"flag") as! String
                    let capital = pais.value(forKey:"capital") as! String
                    let currencies = pais.value(forKey:"currencies") as! [NSDictionary]
                    let languages = pais.value(forKey:"languages") as! [NSDictionary]
                    let population = pais.value(forKey:"population") as! Int
                    let latlng = pais.value(forKey:"latlng") as! [NSNumber]
   
                     
                    let country : Pais = Pais()
                     
                    country.name = nombre
                    country.region = region
                    country.flag = flag
                    country.capital = capital
                    country.population = population

                    for lang in languages {
                
                        let langName = lang.value(forKey: "name")
                        
                        if (langName is NSNull){
                             print ("me esta llegando un null del api")
                        }
                        else{
                              if(langName as! String).count > 0{
                                print("langName \(langName)")
                                country.languages.append(langName as! String)
                            }
                        }
                    }
                    
                    
                    for curr in currencies   {

                        let currName = curr.value(forKey: "name")
                        
                        if (currName is NSNull){
                            print ("me esta llegando un null del api")
                        }
                        else{
                            if(currName as! String).count > 0{
                                print("currName \(currName)")
                                country.currencies.append(currName as! String)
                            }
                        }
                        
                    }
                   
                    if(latlng.count > 1){ //hay paises en el api que no devuelven latitud o longitud
                        let latitud = latlng[0]
                        let longitud  = latlng[1]
                        
                        print (country.name)
                        print("latlang \(latlng), lat \(latitud), long \(longitud)")
                        country.lat = latitud as! Double
                        country.long = longitud as! Double
                    }
                    
                    self.paises.append(country)
                    
                    self.delegatePais?.paisListStorage(self, didAddCountry: country)
                   
            }
                
        }
            
    }
        
}



protocol PaisListStorageDelegate: class
{
    func paisListStorage(_: PaisListStorage, didAddCountry country: Pais)
    
}



