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
    @IBOutlet weak var clearButton: UIButton!
    
    @IBOutlet weak var topTextField: UITextField!
    @IBOutlet weak var bottonTextField: UITextField!
    
    //MARK: - Properties

    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        topTextField.delegate = self
        bottonTextField.delegate = self

        setupToolBar()
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
        topTextField.text = ""
        bottonTextField.text = ""
    }
    
    
    //MARK: - Setup
    func setupToolBar() {
        
          distanceButton.image = UIImage.fontAwesomeIcon(name: .tachometerAlt , style: .solid, textColor: UIColor.blue, size: CGSize(width: 30, height: 30))
        temperatureButton.image = UIImage.fontAwesomeIcon(name: .thermometerHalf , style: .solid, textColor: UIColor.blue, size: CGSize(width: 30, height: 30))
        
        lengthButton.image = UIImage.fontAwesomeIcon(name: .ruler , style: .solid, textColor: UIColor.blue, size: CGSize(width: 30, height: 30))
        
        volumenButton.image = UIImage.fontAwesomeIcon(name: .tint , style: .solid, textColor: UIColor.blue, size: CGSize(width: 30, height: 30))
        
        weightButton.image = UIImage.fontAwesomeIcon(name: .balanceScaleRight , style: .solid, textColor: UIColor.blue, size: CGSize(width: 30, height: 30))
        
        clearButton.layer.cornerRadius = 10
    }
    
    
    func setActiveButton(buttonSelected: UIBarButtonItem){
        
        
        //Unwarp
        guard let buttonSelected = buttonSelected.title else { return }
        
       currentSelection(buttonSelected: buttonSelected)
        
        //Array of button IBOutlets
        let buttonsArray = [distanceButton,temperatureButton,lengthButton, volumenButton, weightButton ]
        
        //Change the color to blue if selected else to gray
        for button in buttonsArray{
            if button?.title == buttonSelected{
                button?.tintColor = UIColor.systemBlue
                print(buttonSelected)
            }else{
                button?.tintColor = UIColor.systemGray
            }
        }
    }
    
    func currentSelection(buttonSelected: String)  {

        switch buttonSelected {
        case "temp":
            topTextField.placeholder = "F"
            bottonTextField.placeholder = "C"
            //Call call method here
        case "lenght":
            topTextField.placeholder = "Feet"
            bottonTextField.placeholder = "Meters"
        case "volumen":
            topTextField.placeholder = "Gallons"
            bottonTextField.placeholder = "Liters"
        case "weight":
            topTextField.placeholder = "Pounds"
            bottonTextField.placeholder = "Kg"
        default:
            topTextField.placeholder = "Miles"
            bottonTextField.placeholder = "KM"
        }
    }

}

extension ViewController: UITextFieldDelegate{
    

}

