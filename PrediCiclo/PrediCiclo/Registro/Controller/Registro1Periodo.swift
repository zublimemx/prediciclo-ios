//
//  Registro1Periodo.swift
//  PrediCiclo
//
//  Created by Daniel Barcenas on 1/20/20.
//  Copyright © 2020 Zublime. All rights reserved.
//

import UIKit

class Registro1Periodo: UIViewController {
    
    // MARK: Variables
    
    // MARK: Controls
    

    @IBOutlet weak var pickerCalendario: UIDatePicker!
    
    
    // MARK: Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        self.pickerCalendario.setValue(UIColor.black, forKey: "textColor")
        setDates()
        pickerCalendario.addTarget(self, action: #selector(dateChanged), for: .valueChanged)
    }
    
    @objc func dateChanged(_ sender: UIDatePicker) {
        let components = Calendar.current.dateComponents([.year, .month, .day], from: sender.date)
        if let day = components.day, let month = components.month, let year = components.year {
            print("\(day) \(month) \(year)")
            let dateS:String = "\(year)-\(month)-\(day)"
            preferencias.setString(key:"comienzoPeriodo",value:dateS )
        }
    }
    
    func setDates(){
        let calendar = Calendar(identifier: .gregorian)
        let currentDate = Date()
        var components = DateComponents()
        components.calendar = calendar
        let maxDate = calendar.date(byAdding: components, to: currentDate)!
        pickerCalendario.maximumDate = maxDate
        components.day = -6
        let minDate = calendar.date(byAdding: components, to: currentDate)!
        pickerCalendario.minimumDate = minDate
    }
    
    
    // MARK: Actions
  
    @IBAction func btnAtras_click(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        self.navigationController?.popViewController(animated: true)
    }
    
}


