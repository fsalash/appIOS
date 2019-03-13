//
//  BanderaListStorage.swift
//  appFinalFranSalas
//
//  Created by Fran on 13/3/19.
//  Copyright © 2019 Fran. All rights reserved.
//

import Foundation
import Alamofire

class BanderaListStorage
{
    
    var delegateBandera: BanderaListStorageDelegate?
    
    //Metodo para obtener las banderas. Ahora no lo usaré en la pantalla principal.
    func getBandera(pais: Pais){

        let urlBandera = URL(string: pais.flag)
        //print(urlBandera)
        
        
        Alamofire.request(urlBandera!).response { response in
            //Aquí ya podremos trabajar con los datos de la respuesta
            
            //print(response.debugDescription)
            guard let image = response.data else {
                // Handle error
                print("error obteniendo imagen")
                return
            }
            
            let imagen = image
            
            pais.dataFlag = imagen
            
            //esto lo ponia para cuando recuperaba las banderas en la pantalla inicial
            //pais.flag = response.data!
            
            
            self.delegateBandera?.banderaStorage(self, banderaLista: pais)
        }
        
        
        
        
    }
    
}

protocol BanderaListStorageDelegate: class
{
 
    func banderaStorage(_: BanderaListStorage, banderaLista country: Pais)
    
}
