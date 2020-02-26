//
//  ViewController.swift
//  Minimalist Unit Converter
//
//  Created by FGT MAC on 2/21/20.
//  Copyright © 2020 FGT MAC. All rights reserved.
//

import UIKit
import FontAwesome_swift
import TextFieldEffects

class ViewController: UIViewController {
    

    
    //MARK: - Outlets
    @IBOutlet weak var distanceButton: UIBarButtonItem!
    @IBOutlet weak var temperatureButton: UIBarButtonItem!
    @IBOutlet weak var lengthButton: UIBarButtonItem!
    @IBOutlet weak var volumenButton: UIBarButtonItem!
    @IBOutlet weak var weightButton: UIBarButtonItem!
    @IBOutlet weak var clearButton: UIButton!
    
    @IBOutlet weak var topTextFieldOutlet: MadokaTextField!
    @IBOutlet weak var bottonTextField: UITextField!
    
    //MARK: - Properties
    var calculator = Calculator()
    var currentSelection = ""
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
 
        topTextFieldOutlet.delegate = self
        bottonTextField.delegate = self

        prepareToolBar()
        
        //Selected distanceButton as default when view loads
        setActiveButton(buttonSelected: distanceButton)
      
    }
    
    //MARK: - IBActions
    @IBAction func distanceButtonPressed(_ sender: UIBarButtonItem) {
        setActiveButton(buttonSelected: sender)
    }
    
    @IBAction func tempButtonPressed(_ sender: UIBarButtonItem) {
        setActiveButton(buttonSelected: sender)
    }
    
    @IBAction func lenghtButtonPressed(_ sender: UIBarButtonItem) {
        setActiveButton(buttonSelected: sender)
    }
    
    @IBAction func volumenButtonPressed(_ sender: UIBarButtonItem) {
        setActiveButton(buttonSelected: sender)
    }
    
    @IBAction func weightButtonPressed(_ sender: UIBarButtonItem) {
         setActiveButton(buttonSelected: sender)
    }
    
    @IBAction func clearButton(_ sender: UIButton) {
        clearTextField()
    }
    

    
    
    //MARK: - Setup UI
    
    func prepareToolBar() {
        
          distanceButton.image = UIImage.fontAwesomeIcon(name: .tachometerAlt , style: .solid, textColor: UIColor.blue, size: CGSize(width: 30, height: 30))
        temperatureButton.image = UIImage.fontAwesomeIcon(name: .thermometerHalf , style: .solid, textColor: UIColor.blue, size: CGSize(width: 30, height: 30))
        
        lengthButton.image = UIImage.fontAwesomeIcon(name: .ruler , style: .solid, textColor: UIColor.blue, size: CGSize(width: 30, height: 30))
        
        volumenButton.image = UIImage.fontAwesomeIcon(name: .tint , style: .solid, textColor: UIColor.blue, size: CGSize(width: 30, height: 30))
        
        weightButton.image = UIImage.fontAwesomeIcon(name: .balanceScaleRight , style: .solid, textColor: UIColor.blue, size: CGSize(width: 30, height: 30))
        
        clearButton.layer.cornerRadius = 10
        
 
    }
    
    //Set the selected toolbar button as active
    func setActiveButton(buttonSelected: UIBarButtonItem){
        guard let selectedButton = buttonSelected.title else { return }
       currentSelection(selectedButton)
        
        //Array of button IBOutlets
        let buttonsArray = [distanceButton,temperatureButton,lengthButton, volumenButton, weightButton ]
        
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
            topTextFieldOutlet.placeholder = "F"
            bottonTextField.placeholder = "C"
        case "lenght":
            topTextFieldOutlet.placeholder = "Foot"
            bottonTextField.placeholder = "Metre"
        case "volumen":
            topTextFieldOutlet.placeholder = "Gallon"
            bottonTextField.placeholder = "Litre"
        case "weight":
            topTextFieldOutlet.placeholder = "Pound"
            bottonTextField.placeholder = "Kg"
        default:
            topTextFieldOutlet.placeholder = "Miles"
            bottonTextField.placeholder = "KM"
          
        }
    }

    //Clear fields
    func clearTextField() {
        topTextFieldOutlet.text = ""
        bottonTextField.text = ""
    }
    
//    func prepareTest() {
//        let textField = MadokaTextField(frame: CGRect(x: 200, y: 190, width: 200, height: 20))
//        textField.placeholderColor = .gray
//
//        textField.placeholder = "Testing"
//
//        view.addSubview(textField)
//
//        textField.centerXAnchor.constraint(equalTo: textField.centerXAnchor).isActive = true
//        textField.centerYAnchor.constraint(equalTo: textField.centerYAnchor).isActive = true
//    }
    

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
        topTextFieldOutlet.endEditing(true)
        bottonTextField.endEditing(true)
        return true
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        
        getResult()
    }
    
    //Helper method
    func getResult() {
        //Get the input value
        guard let top = topTextFieldOutlet.text else { return }
        guard let botton = bottonTextField.text else { return }
        
        //Check a field is empty then invoke the method to get the result
        if top.isEmpty{
            topTextFieldOutlet.text = calculator.calResult(type: currentSelection, topValue: "", bottonValue: botton)
        }else if botton.isEmpty{
            bottonTextField.text = calculator.calResult(type: currentSelection, topValue: top, bottonValue: "")
        }
    }
    

}

