
import Foundation
enum Visibility{
    case VISIBLE
    case INVISIBLE
}

struct url_PrediCiclo {
    static let URL_CREA_CALENDARIO_SINO = "https://prediciclo.zublime.mx/wp-json/zublime/prediciclo/v1/calendar/create_if_not_exits"
}

struct aut_Prediciclo {
    static let CREDENCIALES_AUTH : [String : Any] = [
        "PHP_AUTH_USER":"carlos@de3.mx",
        "PHP_AUTH_PW":"abc123@#"
    ]
}
