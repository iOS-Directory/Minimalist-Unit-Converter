//
//  ViewController.swift
//  Minimalist Unit Converter
//
//  Created by FGT MAC on 2/21/20.
//  Copyright © 2020 FGT MAC. All rights reserved.
//

import UIKit
import FontAwesome_swift

class ViewController: UIViewController {
    

    
    //MARK: - Outlets
    @IBOutlet weak var distanceButton: UIBarButtonItem!
    @IBOutlet weak var temperatureButton: UIBarButtonItem!
    @IBOutlet weak var lengthButton: UIBarButtonItem!
    @IBOutlet weak var volumenButton: UIBarButtonItem!
    @IBOutlet weak var weightButton: UIBarButtonItem!
    @IBOutlet weak var length2Button: UIBarButtonItem!
    @IBOutlet weak var clearButton: UIButton!
    
    @IBOutlet weak var topTextField: UITextField!
    @IBOutlet weak var bottomTextField: UITextField!
    
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var bottomLabel: UILabel!
    
    
    //MARK: - Properties
    var calculator = Calculator()
    
    private var currentSelection = ""
    
    //Text fields Computed properties
    private var topDisplayValue: Double{
        get{
            
            if let n = topTextField.text,let value = Double(n){
                return value
            }
            return 0
        }
        set{
            topTextField.text = String(format:"%.2f", newValue)
        }
        
    }
    
    private var bottomDisplayValue: Double{
        get{
            
            if let n = bottomTextField.text,let value = Double(n){
                return value
            }
            return 0
        }
        set{
            bottomTextField.text = String(format:"%.2f", newValue)
        }
        
    }
    
    //MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        topTextField.delegate = self
        bottomTextField.delegate = self
        
 
        prepareTextField()
        prepareToolBar()
        
        //Selected distanceButton as default when view loads
        setActiveButton(buttonSelected: distanceButton)
        prepareLabelRadius()
 
        
    }
    
    //MARK: - IBActions
    
    //Added to one IBAction all the bar button items
    @IBAction func toolBarButtonPressed(_ sender: UIBarButtonItem) {
        setActiveButton(buttonSelected: sender)
    }
    
    
    @IBAction func clearButton(_ sender: UIButton) {
        clearTextField()
    }
    
    //MARK: - Setup UI
    
    func prepareTextField(){
        let tpaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.topTextField.frame.height))
         topTextField.leftView = tpaddingView
         topTextField.leftViewMode = UITextField.ViewMode.always
         let bpaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.bottomTextField.frame.height))
         bottomTextField.leftView = bpaddingView
         bottomTextField.leftViewMode = UITextField.ViewMode.always
    }
    
    //Use fontawsome icons
    func prepareToolBar() {
        
        distanceButton.image = UIImage.fontAwesomeIcon(name: .tachometerAlt , style: .solid, textColor: UIColor.blue, size: CGSize(width: 30, height: 30))
        
        temperatureButton.image = UIImage.fontAwesomeIcon(name: .thermometerHalf , style: .solid, textColor: UIColor.blue, size: CGSize(width: 30, height: 30))
        
        lengthButton.image = UIImage.fontAwesomeIcon(name: .ruler , style: .solid, textColor: UIColor.blue, size: CGSize(width: 30, height: 30))
        
        volumenButton.image = UIImage.fontAwesomeIcon(name: .tint , style: .solid, textColor: UIColor.blue, size: CGSize(width: 30, height: 30))
        
        weightButton.image = UIImage.fontAwesomeIcon(name: .balanceScaleRight , style: .solid, textColor: UIColor.blue, size: CGSize(width: 30, height: 30))
        
        length2Button.image = UIImage.fontAwesomeIcon(name: .rulerVertical , style: .solid, textColor: UIColor.blue, size: CGSize(width: 30, height: 30))
        
        clearButton.layer.cornerRadius = 10
        
        
    }
    
    func prepareLabelRadius(){
        
        topLabel.clipsToBounds = true
        topLabel.layer.cornerRadius = 5
        topLabel.layer.maskedCorners =  [.layerMinXMaxYCorner, .layerMinXMinYCorner]
        
        topTextField.clipsToBounds = true
        topTextField.layer.cornerRadius = 5
        topTextField.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        
        bottomTextField.clipsToBounds = true
        bottomTextField.layer.cornerRadius = 5
        bottomTextField.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        
        bottomLabel.clipsToBounds = true
        bottomLabel.layer.cornerRadius = 5
        bottomLabel.layer.maskedCorners =  [.layerMinXMaxYCorner, .layerMinXMinYCorner]
    }
    
    //Set the selected toolbar button as active
    func setActiveButton(buttonSelected: UIBarButtonItem){
        guard let selectedButton = buttonSelected.title else { return }
       currentSelection(selectedButton)
        
        //Array of button IBOutlets
        let buttonsArray = [distanceButton,temperatureButton,lengthButton, volumenButton, weightButton, length2Button ]
        
        //Change the color to blue if selected else to gray
        for button in buttonsArray{
            if button?.title == selectedButton{
                button?.tintColor = UIColor.systemBlue
            }else{
                button?.tintColor = UIColor.systemGray
            }
        }
    }
    
    //Change the placeholder base on current delection
    func currentSelection(_ selectedButton: String)  {
        
        //Clear textField every time user change selection
        clearTextField()
        //set the currently selected button to also use it in textFieldDidEndEditing
        currentSelection = selectedButton
        //Change placeholder
        switch selectedButton {
        case "temp":
            topLabel.text = "°F"
            bottomLabel.text = "°C"
        case "lenght":
            topLabel.text = "Foot"
            bottomLabel.text = "Metre"
        case "lenght2":
            topLabel.text = "Inch"
            bottomLabel.text = "CM"
        case "volumen":
            topLabel.text = "Gallon"
            bottomLabel.text = "Litre"
        case "weight":
            topLabel.text = "Lb"
            bottomLabel.text = "Kg"
        default:
            topLabel.text = "Miles"
            bottomLabel.text = "KM"
          
        }
    }

    //Clear fields
    func clearTextField() {
        topTextField.placeholder =  ""
        topTextField.text = ""
        bottomTextField.text = ""
        bottomTextField.placeholder =  ""
    }
}


//MARK: - UITextFieldDelegate

extension ViewController: UITextFieldDelegate{
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        //Clear fields when the user try to enter a new value to start over
        clearTextField()
        
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //Dismiss keyboard after user click return
        topTextField.endEditing(true)
        bottomTextField.endEditing(true)
        return true
    }
    
    //Call the appropiate method after pressing return
    func textFieldDidEndEditing(_ textField: UITextField) {
        //if a value was enter on the top then set result to bottom field
        if textField == topTextField{
            bottomDisplayValue = calculator.calResult(symbol: currentSelection, topValue: topDisplayValue)
        //if a value was enter on the bottom then set result to top field
        }else if textField == bottomTextField{
            topDisplayValue = calculator.calResult(symbol: currentSelection, bottomValue: bottomDisplayValue)
        }
    }
    
    //Prevent user from adding more than one decimal point and 2 decimal places
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let value = textField.text  {
            // Allow to remove character (Backspace)
            if string == "" {
                return true
            }
            
             //Prevent user from adding more than one decimal point
            if value.contains(".") && string == "."{
                return false
            }
             //Prevent user from adding more than 2 decimal places
            if value.contains("."){
                let limitDecimalPlace = 2
                let decimalPlace = value.components(separatedBy: ".").last
                if decimalPlace!.count < limitDecimalPlace {
                    return true
                }else{
                    return false
                }
            }
        }
        return true
    }
}


//MARK: - StringProtocol

//Use to check if String is a valid double in case use enter a letter in the textField it return nil
extension StringProtocol {
    var double: Double? {Double(self)}
}

