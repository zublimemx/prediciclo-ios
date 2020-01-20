//
//  RegistroController.swift
//  PrediCiclo
//
//  Created by Daniel Barcenas on 1/20/20.
//  Copyright © 2020 Zublime. All rights reserved.
//

import UIKit

class RegistroController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func InicioSesion(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        print("Hola")
        self.navigationController?.popViewController(animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
