//
//  RegistroApi.swift
//  PrediCiclo
//
//  Created by Daniel Barcenas on 1/28/20.
//  Copyright © 2020 Zublime. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

let Valida_StatusReg = AlamofireStatus()
let preferenciasReg = Preferences()

class RegistroApi{
    
    let UPDATE_INFO = "https://prediciclo.zublime.mx/wp-json/zublime/prediciclo/v1/update_info"
    
    
    public func updateInfo(VC : UIViewController, callback: @escaping (_ success: Bool, _ callback:respLoginR)->Void){
        
        let params = ["user_id":preferencias.getUserId(),
                      "duracion_ciclo":preferencias.getString(key: "diasMenstruacion"),
                      "duracion_periodo":preferencias.getString(key: "diasPeriodo"),
                      "fecha_nacimiento":preferencias.getString(key: "cumple"),
                      "fecha_inicio_periodo":preferencias.getString(key: "comienzoPeriodo")] as [String : Any]
        manager.request(UPDATE_INFO, method: .post,parameters: params, encoding: URLEncoding.default, headers: preferencias.headers)
         
        .responseObject{(response: DataResponse<respLoginR>) in
            
            
            if let httpStatusCode = response.response?.statusCode {
            let status_request = Valida_Status.Valida_Status(Status: httpStatusCode, CurrentView: VC, Mensaje: response.error ?? nil)
                
                
                switch(status_request)
                {
                case true:
                    switch response.result{
                    case .failure(let fail):
                        print("Consultar status fail \(fail)")
                        break
                    case .success(let value):
                        //if(value.status == 500 || value.status == 400){
                        if value.status != 200 {
                            callback(false,value)
                        }else{
                             
                         callback((value.data?.userId != nil),value)
                        }
                    }
                    break
                case false:
                    //VC.Muestra_Error_VC()
                

                    break
                }
                
            }
            
        }
    }
    
    
    
        
        
    
    
    
}
