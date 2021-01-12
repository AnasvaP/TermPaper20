//
//  Button1VC.swift
//  TermPaper
//
//  Created by Anasva on 14.03.2020.
//  Copyright © 2020 Anasva. All rights reserved.
//

import UIKit
import EventKit
import AVFoundation
import UserNotifications
import AudioToolbox


class Button1VC: UIViewController,UIPickerViewDataSource, UIPickerViewDelegate {

    /* Class for button 1 in tab bar controller to set the alarm and its details
     
     date - variable type DateComponents ; to show date from picker
     dataFromDataPickerOutlet - variable type String; string description of date from picker
     data1ForMassageFromPicker,data2ForMassageFromPicker - variables type String; to have string description of massage from dataPicker
     numberOfRows - variable type Int; number of rows for dataPicker
     */
    
    var date = DateComponents()
    var dataFromDataPickerOutlet : String = ""
    @IBOutlet var dataPickerOutlet: UIDatePicker!
    var data1ForMassageFromPicker: String = "" , data2ForMassageFromPicker: String = "" , dataFromPiker: String = ""
    var arrayForPicker: [[String]] = [["Добрий ранок, ","Привіт, ","Гарного дня, ","Як спалося, "],["зайчику!","сонечко!","котику!","лапулька!"]]
    var arrayForWish: [String] = ["Сьогодні удача на Вашій стороні " , "Терпіння - запорука успіху!" , "Сьогодні вдалий час для нових починань" , "Не полишайте зусиль та отримаєте бажане" , "Міркуйте та не поспішайте з діями" , "На Вас очікують нові знайомства"]
    let numberOfRows: Int = 4
           
    // overwrite built-in func (numberOfComponents,pickerView,) for datePicker
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
               return 2
           }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
               return numberOfRows
           }
           
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
               dataFromPiker = arrayForPicker[component][row]
               return arrayForPicker[component][row]
           }

    @IBOutlet var pikerForMassage: UIPickerView!
    
    // number1, number2 - const to fill the dataPicker with massages
    var number1: Int = 0
    var number2: Int = 0
    
    //func (like getter) to get string representing of information from picker
    func forOkButton(st: String) -> String{
               return st
           }

    // button to save selected information from dataPicker
    @IBAction func okButton1(_ sender: UIButton) {
               AudioServicesPlaySystemSound(SystemSoundID(4095))
               data1ForMassageFromPicker = forOkButton(st: dataFromPiker)
               print(data1ForMassageFromPicker)
            for i in 0..<numberOfRows {
                   if data1ForMassageFromPicker == arrayForPicker[0][i]{
                    number1.self = i
                   }
               }
            print("number1 from okButton1 \(number1.self)")
        }

    // button to save selected information from dataPicker
    @IBAction func okButton2(_ sender: UIButton) {
              AudioServicesPlaySystemSound(SystemSoundID(4095))
              data2ForMassageFromPicker = forOkButton(st: dataFromPiker)
               print(data2ForMassageFromPicker)
               for i in 0..<numberOfRows {
                   if data2ForMassageFromPicker == arrayForPicker[1][i]{
                    number2.self = i
                   }
               }
            print("number2 from okButton2 \(number2.self)")
           }

    // labels for blure
    let imageForBlure: UIImageView = {
        let im = UIImageView()
        im.image = #imageLiteral(resourceName: "photo_2020-05-01_13-removebg-preview.png")
        im.translatesAutoresizingMaskIntoConstraints = false
        im.contentMode = .scaleToFill
        return im
        }()
    
    let blureVEV: UIVisualEffectView = {
              let blureVOV = UIVisualEffectView()
               blureVOV.layer.cornerRadius = 20
               blureVOV.clipsToBounds = true
               blureVOV.translatesAutoresizingMaskIntoConstraints = false
               return blureVOV
           }()
           
    let labelForBlureVEV: UILabel = {
               let labelForBlureVOV = UILabel()
               labelForBlureVOV.text = " Привіт! "
               labelForBlureVOV.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            labelForBlureVOV.font = labelForBlureVOV.font.withSize(30)
               labelForBlureVOV.textAlignment = .center
               labelForBlureVOV.translatesAutoresizingMaskIntoConstraints = false
               return labelForBlureVOV
           }()
           
// func to show blure effect on screen
        func functionForBlur() {
               
               view.addSubview(blureVEV)
               blureVEV.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
               blureVEV.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
               blureVEV.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
               blureVEV.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
                
               let blurEffect = UIBlurEffect(style: .light)
               blureVEV.effect = blurEffect
                
                blureVEV.contentView.addSubview(imageForBlure)
                imageForBlure.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
                imageForBlure.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
                imageForBlure.heightAnchor.constraint(equalToConstant: 270).isActive = true
                imageForBlure.widthAnchor.constraint(equalToConstant: 270).isActive = true

               blureVEV.contentView.addSubview(labelForBlureVEV)
               labelForBlureVEV.centerXAnchor.constraint(equalTo: blureVEV.centerXAnchor).isActive = true
               labelForBlureVEV.centerYAnchor.constraint(equalTo: blureVEV.centerYAnchor, constant:  80).isActive = true
               labelForBlureVEV.heightAnchor.constraint(equalToConstant: 30).isActive = true
           }
    

    // blure to show after notification
    let blure: UIVisualEffectView = {
              let blure = UIVisualEffectView()
               blure.layer.cornerRadius = 20
               blure.clipsToBounds = true
               blure.translatesAutoresizingMaskIntoConstraints = false
               return blure
           }()
        

    override func viewDidLoad() {
        super.viewDidLoad()

        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge ,.sound ]) {
            (granted, error) in
            if granted {
                print("yes")
            } else {
                print("No")
            }
        }
        functionForBlur()
        pikerForMassage.dataSource = self
        pikerForMassage.delegate = self
        
}
    
    // func to hidden main blure
    @IBAction func panGestureRecognizer(_ sender: UIPanGestureRecognizer ) {
        blureVEV.isHidden = true
    }
    
    // func to hidden blure for notification
    @IBAction func longPressGestureRecognizerButton(_ sender: UILongPressGestureRecognizer) {
        blure.isHidden = true
    }
    
    // notification for datePicker
    @IBAction func sendNotificationForBigDP(_ sender: Any) {
        
        var hoursFromPicker: Substring  = ""
        var minutesFromPicker: Substring  = ""
        
        AudioServicesPlaySystemSound(SystemSoundID(4095))
        let content = UNMutableNotificationContent()
        content.title = "Будильник"
        content.body = "Час прокидатись!"
        content.sound = UNNotificationSound.default
        
        let dateFromPicker = dataFromDataPickerOutlet.split(separator: ":")
        hoursFromPicker  = dateFromPicker[0]
        minutesFromPicker  = dateFromPicker[1]
        date.hour = Int(hoursFromPicker)
        date.minute = Int(minutesFromPicker)
        let trigger = UNCalendarNotificationTrigger(dateMatching: (date), repeats: false)
        let request = UNNotificationRequest(identifier: "notification.id.01", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    
    }
    
 
    // func to translate hours into seconds for delay blure effect
    func dateToSeconds(hours:Int, minutes: Int, seconds: Int) -> Int{
           return (hours * 3600 + minutes * 60 + seconds)
       }
    
    
    @IBAction func doneButtonBig(_ sender: UIButton) {
        dateFormatterForBigDP()
        print("print from doneButtonBig " , dataFromDataPickerOutlet)

        // блюр для сповіщення
        let imageForBlure: UIImageView = {
                    let im = UIImageView()
                    im.image = #imageLiteral(resourceName: "photo_2020-05-01_16-removebg-preview.png")
                    im.translatesAutoresizingMaskIntoConstraints = false
                    im.contentMode = .scaleToFill
                    return im
                    }()

        let label: UILabel = {
                    let label = UILabel()
                    label.font = label.font.withSize(25)
                    print("number1 from blure in massage \(number1)")
                    print("number2 from blure in massage \(number2)")
                    label.text = arrayForPicker[0][number1] + arrayForPicker[1][number2]
                    label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                    label.textAlignment = .center
                    label.translatesAutoresizingMaskIntoConstraints = false
                    print("77777  " + arrayForPicker[0][number1] + arrayForPicker[1][number2])
                    return label
                }()

        // func to show blure
        func functForBlur() {

                    view.addSubview(blure)
                    blure.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
                    blure.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
                    blure.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
                    blure.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
                    let blurEffect = UIBlurEffect(style: .light)
                    blure.effect = blurEffect
                    
                    blure.contentView.addSubview(imageForBlure)
                    imageForBlure.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
                   imageForBlure.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
                    imageForBlure.heightAnchor.constraint(equalToConstant: 270).isActive = true
                    imageForBlure.widthAnchor.constraint(equalToConstant: 270).isActive = true
                    
                    blure.contentView.addSubview(label)
                    label.centerXAnchor.constraint(equalTo: blure.centerXAnchor).isActive = true
                    label.centerYAnchor.constraint(equalTo: blure.centerYAnchor, constant: 80).isActive = true
                    label.heightAnchor.constraint(equalToConstant: 35).isActive = true
                }
                functForBlur()
                blure.isHidden = true
                
        // якщо на пікері не поставити дату, то автоматично після натиску кнопки буде встановлено 9:00
    let dateFromPicker = dataFromDataPickerOutlet.split(separator: ":")
    let hoursFromPicker:Int  = Int(dateFromPicker[0].description) ?? 9
    let minutesFromPicker:Int  = Int(dateFromPicker[1].description) ?? 0
        
        // date components of current time
    let dateNow = Date()
    let hourNow = Calendar.current.component( .hour, from: dateNow)
    let minuteNow = Calendar.current.component( .minute, from: dateNow)
    let secondsNow = Calendar.current.component( .second, from: dateNow)
        
        // secondsToDelay - number of seconds to delay blure effect
        var secondsToDelay =  DispatchTimeInterval.seconds(0)
        if hoursFromPicker <= 24 {
             secondsToDelay = DispatchTimeInterval.seconds(dateToSeconds(hours: hoursFromPicker, minutes: minutesFromPicker, seconds: 0) - dateToSeconds(hours: hourNow, minutes: minuteNow, seconds: secondsNow))
        } else{
             secondsToDelay = DispatchTimeInterval.seconds(
                dateToSeconds(hours: 24, minutes: 0, seconds: 0) - dateToSeconds(hours: hourNow, minutes: minuteNow, seconds: secondsNow) + dateToSeconds(hours: hoursFromPicker, minutes: minutesFromPicker, seconds: 0)
            )
        }
        // delay compiling the code to get the blur effect at the right time
                DispatchQueue.main.asyncAfter(deadline: .now() + secondsToDelay) {
                        print("This message is delayed ")
                        self.blure.isHidden = false
                            }
        
    }

    //format the data so that the variable records only hours and minutes in the Ukrainian format
    func dateFormatterForBigDP(){
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        dataFromDataPickerOutlet = formatter.string(from: dataPickerOutlet.date)
        print(dataPickerOutlet.date)
        print("print from dateFormatter " , dataFromDataPickerOutlet)
    }
    
    
    @IBAction func wishButton(_ sender: UIButton) {
        
        print("from wish button")
        let labelForWish: UILabel = {
           let label = UILabel()
               label.text = arrayForWish[Int.random(in: 0..<arrayForWish.count)]
               label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
               label.font = label.font.withSize(18)
               label.textAlignment = .center
               label.translatesAutoresizingMaskIntoConstraints = false
            label.numberOfLines = 2
            return label
        }()
        
        self.blure.contentView.addSubview(labelForWish)
        
        labelForWish.centerXAnchor.constraint(equalTo: blure.centerXAnchor).isActive = true
        labelForWish.centerYAnchor.constraint(equalTo: blure.centerYAnchor, constant:  160).isActive = true
        labelForWish.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
    }
    

}
