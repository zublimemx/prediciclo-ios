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
        setDates()
        
    }
    
    func setDates(){
        let calendar = Calendar(identifier: .gregorian)
        let currentDate = Date()
        var components = DateComponents()
        components.calendar = calendar
        let maxDate = calendar.date(byAdding: components, to: currentDate)!
        pickerCalendario.maximumDate = maxDate
        components.day = -30
        let minDate = calendar.date(byAdding: components, to: currentDate)!
        pickerCalendario.minimumDate = minDate
    }
    
    
    // MARK: Actions
  

}

