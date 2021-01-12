//
//  DatePickerVC.swift
//  TermPaper
//
//  Created by Anasva on 23.03.2020.
//  Copyright © 2020 Anasva. All rights reserved.
//

import UIKit

class DatePickerVC: UIDatePicker {

    var dateFromPicker : String = ""
    let dataPicker = UIDatePicker()
    
    func dateFormatter(){
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        dateFromPicker = formatter.string(from: dataPicker.date)
        print("print from dateFormatter " , dateFromPicker)
    }
    
}
