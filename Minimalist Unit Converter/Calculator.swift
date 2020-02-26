//
//  Calculator.swift
//  Minimalist Unit Converter
//
//  Created by FGT MAC on 2/22/20.
//  Copyright © 2020 FGT MAC. All rights reserved.
//

import Foundation

struct Calculator {

    
    
    func calResult(type: String, topValue: String = "", bottonValue: String = "") -> String {
        //Switch to pass correct equation base on selected method
        var topEquation: Double{
            var tempValue = 00.00
            let num = Double(topValue)
            switch type {
            case "temp":
                tempValue = (num! - 32) * 5/9
            case "lenght":
                tempValue = num! * 0.3048
            case "volumen":
                tempValue =  3.78541 * num!
            case "weight":
                tempValue = num! * 0.45359237
            default:
                tempValue = 1.609 * num!
            }
            return tempValue
        }
        
        var bottonEquation: Double{
              var tempValue = 00.00
              let num = Double(bottonValue)
              switch type {
              case "temp":
                  tempValue = num! * 9/5 + 32
              case "lenght":
                  tempValue = num! * 3.28084
              case "volumen":
                  tempValue = num! * 0.2641
              case "weight":
                  tempValue = num! * 2.2046226218
              default:
                  tempValue = 0.621 * num!
              }
              return tempValue
          }
        
        
        var finalValue = 00.00
        
        if !topValue.isEmpty{
            finalValue = topEquation
        }else if !bottonValue.isEmpty{
            finalValue = bottonEquation
        }
        //Return final value as String
        return String(format:"%.2f", finalValue)
    }
    
    
}
