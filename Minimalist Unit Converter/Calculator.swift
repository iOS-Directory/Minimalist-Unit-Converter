//
//  Calculator.swift
//  Minimalist Unit Converter
//
//  Created by FGT MAC on 2/22/20.
//  Copyright © 2020 FGT MAC. All rights reserved.
//

import Foundation

struct Calculator {
    
    
    func distance(miles: String = "", km: String = "") -> String {

        var finalValue = 00.00

        if !miles.isEmpty{
            let num = Double(miles)
            finalValue = 0.62 * num!

        }else if !km.isEmpty{
            let num = Double(km)
            finalValue = 1.60 * num!
        }
        return String(format:"%.2f", finalValue)
    }
    
    
    func temp(fahrenheit: String = "", celsius: String = "") -> String {

           var finalValue = 00.00

           if !fahrenheit.isEmpty{
               let num = Double(fahrenheit)
               finalValue = num! * 9/5 + 32

           }else if !celsius.isEmpty{
               let num = Double(celsius)
               finalValue = (num! - 32) * 5/9
           }
           return String(format:"%.2f", finalValue)
       }
    
    
}
