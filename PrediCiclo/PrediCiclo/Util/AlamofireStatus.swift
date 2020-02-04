//
//  AlamofireStatus.swift
//  Prediciclo
//
//  Created by Carlos H. Torres on 06/12/19.
//  Copyright © 2019 Carlos H. Torres. All rights reserved.
//

import Foundation
import Alamofire

class AlamofireStatus {

func Valida_Status(Status : Int, CurrentView : UIViewController,Mensaje: Error? = nil) -> Bool {
    if(Mensaje?.localizedDescription == "The request timed out.")
    {
        return false
    }
    else if (Mensaje?.localizedDescription == "The operation couldn’t be completed. ObjectMapper failed to serialize response.")
    {
        return false
    }
    else{
        switch Status {
        case 400:
            return false
        case 403:
            return false
        case 503:
            return false
        case 200:
            return true
        case 500:
            return false
        default:
            return false
        }
    }
    }
    
}
