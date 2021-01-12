//
//  mainForButton2VC.swift
//  TermPaper
//
//  Created by Anasva on 06.05.2020.
//  Copyright © 2020 Anasva. All rights reserved.
//

import UIKit
import AVFoundation
import AudioToolbox

public class mainForButton2VC: UIViewController {

    
    @IBOutlet weak var progresView: UIProgressView!
    @IBOutlet var done1Label: UIButton!
    @IBOutlet var done2Label: UIButton!
    @IBOutlet var done3Label: UIButton!
    @IBOutlet var done4Label: UIButton!
    @IBOutlet var done5Label: UIButton!
    @IBOutlet var done6Label: UIButton!
    
    
    @IBOutlet var textField1: UITextField!
    @IBOutlet var textField2: UITextField!
    @IBOutlet var textField3: UITextField!
    @IBOutlet var textField4: UITextField!
    @IBOutlet var textField5: UITextField!
    @IBOutlet var textField6: UITextField!
    
    
    @IBOutlet weak var textFieldForDoneTask1: UITextField!
    @IBOutlet weak var textFieldForDoneTask2: UITextField!
    @IBOutlet weak var textFieldForDoneTask3: UITextField!
    @IBOutlet weak var textFieldForDoneTask4: UITextField!
    @IBOutlet weak var textFieldForDoneTask5: UITextField!
    @IBOutlet weak var textFieldForDoneTask6: UITextField!
    
    
    let saveText = UserDefaults.standard
    
    // звичайний тап , який ховає клавіатуру натиснувши будь-де на екрані
    
    func hideKeyboardLogic(t: UITextField){
        t.resignFirstResponder()
    }
    func saveTextLogic(t: UITextField, name: String){
        saveText.set(t.text, forKey: name)
    }

       @IBAction func hideKeyboardAndSaveText(_ sender: UITapGestureRecognizer) {
            hideKeyboardLogic(t: textField1)
            hideKeyboardLogic(t: textField2)
            hideKeyboardLogic(t: textField3)
            hideKeyboardLogic(t: textField4)
            hideKeyboardLogic(t: textField5)
            hideKeyboardLogic(t: textField6)
        
            saveTextLogic(t: textField1, name: "textField1")
            saveTextLogic(t: textField2, name: "textField2")
            saveTextLogic(t: textField3, name: "textField3")
            saveTextLogic(t: textField4, name: "textField4")
            saveTextLogic(t: textField5, name: "textField5")
            saveTextLogic(t: textField6, name: "textField6")
        
            hideKeyboardLogic(t: textFieldForDoneTask1)
            hideKeyboardLogic(t: textFieldForDoneTask2)
            hideKeyboardLogic(t: textFieldForDoneTask3)
            hideKeyboardLogic(t: textFieldForDoneTask4)
            hideKeyboardLogic(t: textFieldForDoneTask5)
            hideKeyboardLogic(t: textFieldForDoneTask6)
            
            saveTextLogic(t: textFieldForDoneTask1, name: "textFieldForDoneTask1")
            saveTextLogic(t: textFieldForDoneTask2, name: "textFieldForDoneTask2")
            saveTextLogic(t: textFieldForDoneTask3, name: "textFieldForDoneTask3")
            saveTextLogic(t: textFieldForDoneTask4, name: "textFieldForDoneTask4")
            saveTextLogic(t: textFieldForDoneTask5, name: "textFieldForDoneTask5")
            saveTextLogic(t: textFieldForDoneTask6, name: "textFieldForDoneTask6")

       }
    
    let images: [UIImage?] = [
        UIImage(systemName: "moon.circle"),
        UIImage(systemName: "sun.min"),
        UIImage(systemName: "sun.min.fill"),
        UIImage(systemName: "moon.fill"),
        UIImage(systemName: "moon"),
        UIImage(systemName: "zzz"),
        UIImage(systemName: "moon.zzz"),
        UIImage(systemName: "sparkles"),
        UIImage(systemName: "cloud"),
        UIImage(systemName: "moon.stars.fill"),
        UIImage(systemName: "moon.stars"),
        UIImage(systemName: "cloud.rain"),
        UIImage(systemName: "moon.zzz.fill"),
        UIImage(systemName: "cloud.moon"),
        UIImage(systemName: "cloud.moon.fill"),
        UIImage(systemName: "cloud.sun.fill"),
        UIImage(systemName: "cloud.sun"),
        UIImage(systemName: "snow"),
        UIImage(systemName: "wind"),
        UIImage(systemName: "wind.snow"),
        UIImage(systemName: "tornado"),]
    
    public override func viewDidLoad() {
            super.viewDidLoad()
        
        
        done1Label.setImage( images[Int.random(in: 0..<images.count)], for: .normal)
        done2Label.setImage( images[Int.random(in: 0..<images.count)], for: .normal)
        done3Label.setImage( images[Int.random(in: 0..<images.count)], for: .normal)
        done4Label.setImage( images[Int.random(in: 0..<images.count)], for: .normal)
        done5Label.setImage( images[Int.random(in: 0..<images.count)], for: .normal)
        done6Label.setImage( images[Int.random(in: 0..<images.count)], for: .normal)
        
        if let text1 = saveText.string(forKey: "textField1") {
            textField1.text = text1
        }
        if let text2 = saveText.string(forKey: "textField2") {
                   textField2.text = text2
        }
        if let text3 = saveText.string(forKey: "textField3") {
            textField3.text = text3
        }
        if let text4 = saveText.string(forKey: "textField4") {
                   textField4.text = text4
        }
        if let text5 = saveText.string(forKey: "textField5") {
            textField5.text = text5
        }
        if let text6 = saveText.string(forKey: "textField6") {
                   textField6.text = text6
        }
        
        textFieldForDoneTask1.isHidden = true
        textFieldForDoneTask2.isHidden = true
        textFieldForDoneTask3.isHidden = true
        textFieldForDoneTask4.isHidden = true
        textFieldForDoneTask5.isHidden = true
        textFieldForDoneTask6.isHidden = true
        
        progresView.progress = 0
        view.addSubview(labelForProgres)
        labelForProgres.topAnchor.constraint(equalTo: progresView.bottomAnchor, constant: 8).isActive = true
        labelForProgres.centerXAnchor.constraint(equalTo: progresView.centerXAnchor).isActive = true
        
//        print("===============  ",done1Label.imageView?.image)
        
    }
    
    @IBAction func delete6(_ sender: UISwipeGestureRecognizer) {
        textField6.text = ""
    }
    @IBAction func delete5(_ sender: UISwipeGestureRecognizer) {
           textField5.text = ""
       }
    @IBAction func delete4(_ sender: UISwipeGestureRecognizer) {
           textField4.text = ""
       }
    @IBAction func delete3(_ sender: UISwipeGestureRecognizer) {
           textField3.text = ""
       }
    @IBAction func delete2(_ sender: UISwipeGestureRecognizer) {
           textField2.text = ""
       }
    @IBAction func delete1(_ sender: UISwipeGestureRecognizer) {
           textField1.text = ""
       }
    
    func showTextFileAndGiveText(textField: UITextField, textFromTextField: UITextField){
        textField.isHidden = false
        textField.text = textFromTextField.text ?? "упс ...  а поле-то пусте :( "
    }
    
    let labelForProgres: UILabel = {
        let l = UILabel()
        l.font = l.font.withSize(14)
        l.textAlignment = .center
        l.translatesAutoresizingMaskIntoConstraints = false
        l.heightAnchor.constraint(equalToConstant: 15).isActive = true
        return l
    }()
    
    let arrayFloatForProgress: [Float] = [0.17,0.34,0.51,0.68,0.85]
    let textArrayForLabelForProgress: [String] = ["Головне розпочати!","Так тримати!", "Вже половина справ зроблено!","А ти молодець!","Ще зовсім трошки!"]
    
    func showLabelForProgress(j: Int){

        if progresView.progress == arrayFloatForProgress[j] {
            labelForProgres.isHidden = false
            labelForProgres.text = textArrayForLabelForProgress[j]
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                self.labelForProgres.isHidden = true
            }
        }
        else if progresView.progress >= 1 {
            labelForProgres.isHidden = false
            labelForProgres.text = "Всі справи зроблено! Можна і поїсти!"
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                self.labelForProgres.isHidden = true
            }
        }
    }
    
    func setProgresAndShowLabeL(){
        progresView.progress += Float(0.17)
        for j in (0..<arrayFloatForProgress.count){
            showLabelForProgress( j: j)
        }
        if progresView.progress >= 1{
            DispatchQueue.main.asyncAfter(deadline: .now() + 7) {
                self.progresView.progress = 0
            }
        }
    }
    
    @IBAction func doneButton1(_ sender: UIButton) {
        showTextFileAndGiveText(textField: textFieldForDoneTask1, textFromTextField: textField1)
        setProgresAndShowLabeL()
    }
    
    @IBAction func doneButton2(_ sender: UIButton) {
        showTextFileAndGiveText(textField: textFieldForDoneTask2, textFromTextField: textField2)
        setProgresAndShowLabeL()
    }
    
    @IBAction func doneButton3(_ sender: UIButton) {
        showTextFileAndGiveText(textField: textFieldForDoneTask3, textFromTextField: textField3)
        setProgresAndShowLabeL()
    }
    
    @IBAction func doneButton4(_ sender: UIButton) {
        showTextFileAndGiveText(textField: textFieldForDoneTask4, textFromTextField: textField4)
        setProgresAndShowLabeL()
    }
    
    @IBAction func doneButton5(_ sender: UIButton) {
        showTextFileAndGiveText(textField: textFieldForDoneTask5, textFromTextField: textField5)
       setProgresAndShowLabeL()
    }
    
    @IBAction func doneButton6(_ sender: UIButton) {
        showTextFileAndGiveText(textField: textFieldForDoneTask6, textFromTextField: textField6)
       setProgresAndShowLabeL()
    }
    
    
    
    @IBAction func deleteNextFieldForDoneTask1(_ sender: UIPinchGestureRecognizer) {
        myAnimation(tF: textFieldForDoneTask1)
    }
    @IBAction func deleteNextFieldForDoneTask2(_ sender: UIPinchGestureRecognizer) {
        myAnimation(tF: textFieldForDoneTask2)
    }
    @IBAction func deleteNextFieldForDoneTask3(_ sender: UIPinchGestureRecognizer) {
        myAnimation(tF: textFieldForDoneTask3)
    }
    @IBAction func deleteNextFieldForDoneTask4(_ sender: UIPinchGestureRecognizer) {
        myAnimation(tF: textFieldForDoneTask4)
    }
    @IBAction func deleteNextFieldForDoneTask5(_ sender: UIPinchGestureRecognizer) {
        myAnimation(tF: textFieldForDoneTask5)
    }
    @IBAction func deleteNextFieldForDoneTask6(_ sender: UIPinchGestureRecognizer) {
        myAnimation(tF: textFieldForDoneTask6)
    }
    
    func myAnimation(tF: UITextField){
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
        tF.isHidden = true
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.9) {
        tF.isHidden = false
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
        tF.isHidden = false
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.1) {
        tF.isHidden = true
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
        tF.isHidden = false
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.3) {
        tF.isHidden = true
        tF.text = ""
        }

    }
}
