//
//  LoginApi.swift
//  PrediCiclo
//
//  Created by Daniel Barcenas on 1/26/20.
//  Copyright © 2020 Zublime. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
let Valida_Status = AlamofireStatus()
/*let manager : SessionManager = {
    let config = URLSessionConfiguration.default
    config.timeoutIntervalForRequest = 45
    config.timeoutIntervalForResource = 45
    let mgr = Alamofire.SessionManager(configuration: config)
      
    return mgr
}()*/
let preferencias = Preferences()

class LoginApi {
    
    let URL_CHECK_EMAIL = "https://prediciclo.zublime.mx/wp-json/zublime/prediciclo/v1/email_exists"
    let URL_LOGIN = "https://prediciclo.zublime.mx/wp-json/zublime/prediciclo/v1/login"
    let URL_RECUPERAR_EMAIL = "https://prediciclo.zublime.mx/wp-json/zublime/prediciclo/v1/customer/lost_password"
    
    public func isEmailRegister(VC : UIViewController,email:String,callback: @escaping (_ success: Bool, _ callback:respEmailExist)->Void){
        
        let params = ["email":email]
        manager.request(URL_CHECK_EMAIL, method: .post, parameters: params, encoding: URLEncoding.default)
            
            .responseObject{(response: DataResponse<respEmailExist>) in
                if let httpStatusCode = response.response?.statusCode {
                    let status_request = Valida_Status.Valida_Status(Status: httpStatusCode, CurrentView: VC, Mensaje: response.error ?? nil)
                    
                    switch(status_request){
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
                                callback(value.data?.emailExists ?? false,value)
                               }
                           }
                           break
                        
                       case false:
                           //VC.Muestra_Error_VC()
                            //callback(false,nil)
                           break
                    }
               }
           }
       }
    
    
    public func iniciarSesion(VC : UIViewController,email:String,pass:String, callback: @escaping (_ success: Bool, _ callback:respLogin)->Void){
        let params = ["username":email, "password":pass]
        manager.request(URL_LOGIN, method: .post,parameters: params, encoding: URLEncoding.default, headers: preferencias.headers)
            .responseObject{(response: DataResponse<respLogin>) in
                
                if let httpStatusCode = response.response?.statusCode {
                    let status_request = Valida_Status.Valida_Status(Status: httpStatusCode, CurrentView: VC, Mensaje: response.error ?? nil)
                    
                    switch(status_request){
                    
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
    
    
    public func recuperarEmail(VC : UIViewController,email:String,callback: @escaping (_ success: Bool, _ callback:ForgotPasword)->Void){
        
        let params = ["email":email]
        manager.request(URL_RECUPERAR_EMAIL, method: .post, parameters: params, encoding: URLEncoding.default)
            
            .responseObject{(response: DataResponse<ForgotPasword>) in
                if let httpStatusCode = response.response?.statusCode {
                    let status_request = Valida_Status.Valida_Status(Status: httpStatusCode, CurrentView: VC, Mensaje: response.error ?? nil)
                    
                    switch(status_request){
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
                                callback(true,value)
                               }
                           }
                           break
                        
                       case false:
                           //VC.Muestra_Error_VC()
                            //callback(false,nil)
                           break
                    }
               }
           }
        
    }
    
}
