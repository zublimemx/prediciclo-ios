//
//  LoginModel.swift
//  PrediCiclo
//
//  Created by Daniel Barcenas on 1/26/20.
//  Copyright © 2020 Zublime. All rights reserved.
//

import Foundation
import ObjectMapper
struct respEmailExist:Mappable{
    var status:Int?
    var data:DataEmailExist?
    
    init?(map: Map) {
    }
    mutating func mapping(map: Map) {
        status <- map["status"]
        data <- map["data"]
    }
}
struct DataEmailExist :Mappable{
    var emailExists:Bool?
    init?(map: Map) {
    }
    mutating func mapping(map: Map) {
        emailExists <- map["email_exists"]
    }
}

struct respLogin:Mappable{
    var status:Int?
    var data:DataLogin?
    init?(map: Map) {}
    mutating func mapping(map: Map) {
        status <- map["status"]
        data <- map["data"]
    }
}

struct DataLogin :Mappable{
    var userId:Int?
    init?(map: Map) {}
    mutating func mapping(map: Map) {
        userId <- map["user_id"]
    }
}


struct ForgotPasword :Mappable{
    var status:Int?
    var data:Bool?
    var message:String?
    init?(map: Map) {}
    mutating func mapping(map: Map) {
        status <- map["status"]
        data <- map["data"]
        message <- map ["message"]
    }
}

struct respCalendarFinal :Mappable{
    var status:Int?
    var data:[DataCalendarFinal]?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        status <- map["status"]
        data <- map["data"]
    }
    
    
}
struct DataCalendarFinal :Mappable{
    var dia_num : Int?
    var fecha : String?
    var click : Bool?
    var click_event : String?
    var boy : Bool?
    var girl : Bool?
    var solicitar_prueba : Bool?
    var pico_fertilidad : Bool?
    var menstruacion : Bool?
    var reiniciar_sangrado : Bool?
    var caso : Int?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        dia_num <- map["dia_num"]
        fecha <- map["fecha"]
        click <- map["click"]
        click_event <- map["click_event"]
        boy <- map["boy"]
        girl <- map["girl"]
        solicitar_prueba <- map["solicitar_prueba"]
        pico_fertilidad <- map["pico_fertilidad"]
        menstruacion <- map["menstruacion"]
        reiniciar_sangrado <- map["reiniciar_sangrado"]
        caso <- map["caso"]
    }
    
    struct RegistroUsuario :Mappable{
        var id : Int?
        var date_created : String?
        var date_created_gmt : Bool?
        var date_modified : String?
        var date_modified_gmt : String?
        var email : String?
        var first_name : String?
        var last_name : String?
        var role : String?
        var username : String?

        init?(map: Map) {

        }

        mutating func mapping(map: Map) {

            id <- map["id"]
            date_created <- map["date_created"]
            date_created_gmt <- map["date_created_gmt"]
            date_modified <- map["date_modified"]
            date_modified_gmt <- map["date_modified_gmt"]
            email <- map["email"]
            first_name <- map["first_name"]
            last_name <- map["last_name"]
            role <- map["role"]
            username <- map["username"]
        }

    }


}
