//
//  LoginViewController.swift
//  PrediCiclo
//
//  Created by Daniel Barcenas on 1/18/20.
//  Copyright © 2020 Zublime. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: Variables
    
    // MARK: Controls
    
    // MARK: Functions
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Agregar el metodo TouchBegan Permite que al tocar se oculte el teclado o aparesca
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true) //Al recibir un toque se oculta el teclado
    }
    
    //Nuestro segundo Problema es hacer funcionar el boton de intro del teclado
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // MARK: Actions

}
