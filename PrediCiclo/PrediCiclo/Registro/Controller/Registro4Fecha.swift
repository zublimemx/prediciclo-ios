//
//  Registro4Fecha.swift
//  PrediCiclo
//
//  Created by Daniel Barcenas on 1/20/20.
//  Copyright © 2020 Zublime. All rights reserved.
//

import UIKit

class Registro4Fecha: UIViewController {
    
    
    // MARK: Variables
    
    // MARK: Controls
    @IBOutlet weak var cumpleView: UIDatePicker!
    
    // MARK: Functions
    override func viewDidLoad() {
        self.navigationController?.navigationBar.isHidden = true
    }
   /*
    @IBAction func datePickerChanged(_ sender: UIDatePicker) {
        let components = Calendar.current.dateComponents([.year, .month, .day], from: sender.date)
        if let day = components.day, let month = components.month, let year = components.year {
            print("\(day) \(month) \(year)")
            let dateS:String = "\(year)-\(month)-\(day)"
            //preferencias.setString(key:"cumple",value:dateS )
            
    }
    }
    */

    /*
    @objc func siguienteAction(){
        let api = PredicicloApi()
        NVActivityIndicatorPresenter.sharedInstance.startAnimating(ActivityData(), nil)
                       
        api.updateInfo(VC: self, callback: { (result, respLogin) in
            NVActivityIndicatorPresenter.sharedInstance.stopAnimating(nil)
            self.performSegue(withIdentifier: "gotoMain", sender: nil)
        })
                      
    }
 */
            
    func setDates(){
        let calendar = Calendar(identifier: .gregorian)
        let currentDate = Date()
        var components = DateComponents()
        components.calendar = calendar
        let maxDate = calendar.date(byAdding: components, to: currentDate)!
        cumpleView.maximumDate = maxDate
        components.year = -60
        let minDate = calendar.date(byAdding: components, to: currentDate)!
        cumpleView.minimumDate = minDate
    }
    
     // MARK: Actions
    
    @IBAction func btnAtras_click(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        self.navigationController?.popViewController(animated: true)
    }
    

}
