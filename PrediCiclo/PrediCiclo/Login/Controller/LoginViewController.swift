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
import SCLAlertView

class LoginViewController: UIViewController {
    
    // MARK: Variables
    let waveAnimationView = AnimationView()
    var changeButtonbtn = false
    let api = LoginApi()
    var step = 0;
    
    let yourAttributes: [NSAttributedString.Key: Any] = [
        .font: UIFont.systemFont(ofSize: 16),
         .foregroundColor: UIColor.systemPink,
         .underlineStyle: NSUnderlineStyle.single.rawValue]
    
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
        txtUserEmail.layer.borderColor = UIColor.lightGray.cgColor;
        txtUserEmail.layer.cornerRadius = 4
        txtUserEmail.attributedPlaceholder = NSAttributedString(string: "Correo Electrónico",attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        
        
        txtUserPassword.textColor = UIColor.darkText
        txtUserPassword.layer.borderWidth = 1
        txtUserPassword.layer.borderColor = UIColor.lightGray.cgColor;
        txtUserPassword.layer.cornerRadius = 4
        txtUserPassword.attributedPlaceholder = NSAttributedString(string: "Contraseña",attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        
        let attributeString = NSMutableAttributedString(string: "¿Olvidaste tu contraseña?",
                                                        attributes: yourAttributes)
        btnForgotPassword.setAttributedTitle(attributeString, for: .normal)
    
        
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
    
     /* -- Login --*/
    @IBAction func btnSiguiente_click(_ sender: UIButton){
        var userEmailtxt = txtUserEmail.text
        userEmailtxt = userEmailtxt?.trimmingCharacters(in: .whitespacesAndNewlines)
        userEmailtxt = userEmailtxt?.lowercased()
        txtUserEmail.text = userEmailtxt
        
        let userPasswordtxt = txtUserPassword.text
        self.view.endEditing(true)
        
        if step == 0{
            NVActivityIndicatorPresenter.sharedInstance.startAnimating(ActivityData(), nil)
            /*Correo Vacio**/
            if txtUserEmail.text == "" {
                NVActivityIndicatorPresenter.sharedInstance.stopAnimating(nil)
                txtUserEmail.layer.borderColor = UIColor.red.cgColor;
                txtUserEmail.layer.borderWidth = 1.5
                txtUserEmail.text = ""
                lblEmaiInvalid.isHidden = false
                lblEmaiInvalid.text = "Correo no válido"
                
                
            }else if isValidEmail(emailStr: userEmailtxt!) {
                api.isEmailRegister(VC: self, email: userEmailtxt!) { (success, respEmailExist) in
                //NVActivityIndicatorPresenter.sharedInstance.stopAnimating(nil)
                /* -- Email Valido --*/
                if success{
                    self.step = 1
                    NVActivityIndicatorPresenter.sharedInstance.stopAnimating(nil)
                    self.txtUserPassword.isHidden = false
                    self.txtUserEmail.layer.borderColor = UIColor.lightGray.cgColor;
                    self.txtUserEmail.layer.borderWidth = 1
                    self.btnNext.setTitle("Inicia Sesión", for:.normal)
                    self.lblEmaiInvalid.isHidden = true
                    
                }else{
                    /*User no registrado*/
                    NVActivityIndicatorPresenter.sharedInstance.stopAnimating(nil)
                    self.lblEmaiInvalid.text = "Usuario no registrado."
                    self.lblEmaiInvalid.isHidden = false
                    
                }
                }
            }
            else{
                /*Email Invalido*/
                NVActivityIndicatorPresenter.sharedInstance.stopAnimating(nil)
                txtUserEmail.layer.borderColor = UIColor.red.cgColor;
                txtUserEmail.layer.borderWidth = 1.5
                self.lblEmaiInvalid.text = "Correo no válido."
                //self.crearAlertConfirmacion(title:"¡Error!", texto: "Ingresa un correo electrónico valido.")
                lblEmaiInvalid.isHidden = false
                
            }
        }else{
            /*Validando Contraseña*/
            
            if txtUserPassword.text == "" {  /*Campo Vacio*/
                
                lblFieldObligatory.isHidden = false
                lblFieldObligatory.text = "Campo Obligatorio *"
                txtUserPassword.layer.borderColor = UIColor.red.cgColor;
                txtUserEmail.layer.borderWidth = 1.5
                txtUserPassword.text = ""
                
            }else{
                NVActivityIndicatorPresenter.sharedInstance.startAnimating(ActivityData(), nil)
                api.iniciarSesion(VC: self, email: userEmailtxt!, pass: userPasswordtxt!){
                    (result, respLogin) in
                    
                    /*Contrseña Valida*/
                    if result{
                        NVActivityIndicatorPresenter.sharedInstance.stopAnimating(nil)
                        preferencias.setUsername(user: userEmailtxt!)
                        preferencias.setPasswd(pass:userPasswordtxt!)
                        preferencias.setLogged(true)
                        preferencias.setUserId(userId:respLogin.data!.userId!)
                        /*-- Nos manda al Main -- */
                        self.performSegue(withIdentifier: "gotoHome", sender: nil)
                    }else{
                        /*Contraseña invalida*/
                        NVActivityIndicatorPresenter.sharedInstance.stopAnimating(nil)
                        self.txtUserEmail.isEnabled = true
                        self.crearAlertConfirmacion(title: "¡Error!", texto: "¡Usuario o contraseña incorrecto!")
                        self.txtUserPassword.text = ""
                    }
                }
            }
        }
    }
    
    
    /* -- Recuperar Contraseña --*/
    
    @IBAction func btnRecuperarPassword_click(_ sender: UIButton) {
        var userEmailtxt = txtUserEmail.text
        userEmailtxt = userEmailtxt?.trimmingCharacters(in: .whitespacesAndNewlines)
        txtUserEmail.text = userEmailtxt
        
        NVActivityIndicatorPresenter.sharedInstance.startAnimating(ActivityData(), nil)
        
        if txtUserEmail.text == "" {
            NVActivityIndicatorPresenter.sharedInstance.stopAnimating(nil)
            self.step = 0
            //self.crearAlertConfirmacion(title:"", texto: "Antes debes ingresar tu correo electrónico")
            
            /**/
            let utils = Utils();
            let button = AlertButton(title: "Aceptar", action: {
                print("OK clicked");
            }, titleColor: UIColor.blue, backgroundColor: UIColor.cyan);
            
            let alertPayload = AlertPayload(title: "One Button Alert", titleColor: UIColor.red, message: "Antes debes ingresar tu correo electrónico", messageColor: UIColor.green, buttons: [button], backgroundColor: UIColor.white)
            
            utils.showAlert(payload: alertPayload, parentViewController: self);
            
            /**/
        }else{
            
            
            if isValidEmail(emailStr: userEmailtxt!) {
                api.recuperarEmail(VC:self, email: userEmailtxt!) { (success, ForgotPasword) in
                if success{
                    NVActivityIndicatorPresenter.sharedInstance.stopAnimating(nil)
                    self.crearAlertConfirmacion3(title:"", texto: "Las instrucciones para recuperar la contraseña se han enviado por email")
                   
                }else{
                    NVActivityIndicatorPresenter.sharedInstance.stopAnimating(nil)
                    self.crearAlertConfirmacion3(title:"", texto: "No pudimos encontrar tu correo")
                    self.step = 0
                }
                }
            }
            
        }

    }
    
    
}



