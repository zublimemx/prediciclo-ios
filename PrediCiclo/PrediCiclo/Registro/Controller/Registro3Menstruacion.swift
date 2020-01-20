//
//  Registro3Menstruacion.swift
//  PrediCiclo
//
//  Created by Daniel Barcenas on 1/20/20.
//  Copyright © 2020 Zublime. All rights reserved.
//

import UIKit

class Registro3Menstruacion: UIViewController {
    
    
    // MARK: Variables
    private let PeriodoValores = ["1","2","3","4","5","6","7","8"]
    // MARK: Controls
    @IBOutlet weak var menstruacionPicker: UIPickerView!
    // MARK: Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        // Do any additional setup after loading the view.
        menstruacionPicker.dataSource = self
        menstruacionPicker.delegate = self
    }
    // MARK: Actions

    

}

extension Registro3Menstruacion:UIPickerViewDelegate,UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
          return 1
      }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return PeriodoValores.count
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return PeriodoValores[row]
    }
    

    
    
}
