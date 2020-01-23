//
//  LoginViewController.swift
//  PrediCiclo
//
//  Created by Daniel Barcenas on 1/18/20.
//  Copyright © 2020 Zublime. All rights reserved.
//

import UIKit
import PasswordTextField
import NVActivityIndicatorView
import Lottie

class LoginViewController: UIViewController {
    
    // MARK: Variables
    let waveAnimationView = AnimationView()
    
    
    // MARK: Controls
    @IBOutlet weak var txtUserEmail: UITextField!
    @IBOutlet weak var txtUserPassword: PasswordTextField!
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var btnRegister: UIButton!
    @IBOutlet weak var btnForgotPassword: UIButton!
    @IBOutlet weak var viewLottie: UIView!
    
    @IBOutlet weak var lblEmaiInvalid: UILabel!
    @IBOutlet weak var lblFieldObligatory: UILabel!
    
    
    // MARK: Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        txtUserPassword.isHidden = true
        lblEmaiInvalid.isHidden = true
        lblFieldObligatory.isHidden = true
        
        /*--- Animacion ---*/
        waveAnimationView.animation = Animation.named("wave")
        waveAnimationView.frame.size = viewLottie.frame.size
        waveAnimationView.contentMode = .scaleToFill
        viewLottie.addSubview(waveAnimationView)
        waveAnimationView.backgroundBehavior = .pauseAndRestore
        waveAnimationView.loopMode = .loop
        waveAnimationView.play()
        
        txtUserEmail.textColor = UIColor.darkText
        txtUserEmail.layer.borderWidth = 1
        txtUserEmail.layer.borderColor = UIColor.darkGray.cgColor;
        txtUserEmail.layer.cornerRadius = 4
        txtUserEmail.attributedPlaceholder = NSAttributedString(string: "Correo Electrónico",attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        
        
        txtUserPassword.textColor = UIColor.darkText
        txtUserPassword.layer.borderWidth = 1
        txtUserPassword.layer.borderColor = UIColor.darkGray.cgColor;
        txtUserPassword.layer.cornerRadius = 4
        txtUserPassword.attributedPlaceholder = NSAttributedString(string: "Contraseña",attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
    
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    
    /*--- Control del Teclado ---*/
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)         //Al recibir un toque se oculta el teclado
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()   //Boton de intro del teclado
        return true
    }
    
    // MARK: Actions
    
    @IBAction func btnSiguiente_click(_ sender: UIButton) {
        txtUserPassword.isHidden = false
    }
    
}
