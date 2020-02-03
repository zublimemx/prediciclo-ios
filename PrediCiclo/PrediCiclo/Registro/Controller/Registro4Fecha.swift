//
//  Registro4Fecha.swift
//  PrediCiclo
//
//  Created by Daniel Barcenas on 1/20/20.
//  Copyright © 2020 Zublime. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class Registro4Fecha: UIViewController {
    
    
    // MARK: Variables
    let api = LoginApi()
    
    // MARK: Controls
    @IBOutlet weak var cumpleView: UIDatePicker!
    
    // MARK: Functions
    override func viewDidLoad() {
        self.navigationController?.navigationBar.isHidden = true
        self.cumpleView.setValue(UIColor.black, forKey: "textColor")
        setDates()
        cumpleView.addTarget(self, action: #selector(datePickerChanged), for: .valueChanged)
    }
   
    @IBAction func datePickerChanged(_ sender: UIDatePicker) {
        let components = Calendar.current.dateComponents([.year, .month, .day], from: sender.date)
        if let day = components.day, let month = components.month, let year = components.year {
            print("\(day) \(month) \(year)")
            let dateS:String = "\(year)-\(month)-\(day)"
            preferencias.setString(key:"cumple",value:dateS )
        }
    }
    
            
    func setDates(){
        
        let calendar = Calendar(identifier: .gregorian)
        let currentDate = Date()
        var components = DateComponents()
        components.calendar = calendar
            
        components.month = 12
        let maxDate = calendar.date(byAdding: components, to: currentDate)!

        components.year = -60
        let minDate = calendar.date(byAdding: components, to: currentDate)!

        cumpleView.minimumDate = minDate
        cumpleView.maximumDate = maxDate
        
        cumpleView.setDate(currentDate, animated: true)
        
    }
    
     // MARK: Actions
    
    @IBAction func btnSiguiente_click(_ sender: UIButton) {
        
        NVActivityIndicatorPresenter.sharedInstance.startAnimating(ActivityData(), nil)
                       
        api.updateInfo(VC: self, callback: { (result, respLogin) in
            NVActivityIndicatorPresenter.sharedInstance.stopAnimating(nil)
            print("Exito perros !! ")
            self.performSegue(withIdentifier: "gotoMain", sender: nil)
            
            
        })
    }
    
    
    @IBAction func btnAtras_click(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        self.navigationController?.popViewController(animated: true)
    }
    

}
