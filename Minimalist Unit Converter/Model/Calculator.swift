//
//  Calculator.swift
//  Minimalist Unit Converter
//
//  Created by FGT MAC on 2/22/20.
//  Copyright © 2020 FGT MAC. All rights reserved.
//

import Foundation

struct Calculator {
    
    private var num: Double?

    func calResult(symbol: String, topValue: Double = 0, bottomValue: Double = 0) -> Double {
        if topValue != 0{
            return imperialToMetric(for: symbol, value: topValue)
        }else if bottomValue != 0{
            return metricToImperial(for: symbol, value: bottomValue)
        }
        return 0
    }
    
    
    //Calculates the result from the given value in the top textField to show on the botton textField
    private func imperialToMetric(for symbol: String,value num:Double ) -> Double{

        switch symbol {
        case "temp":
            return (num - 32) * 5/9
        case "lenght":
            return num * 0.3048
        case "volumen":
            return  3.78541 * num
        case "weight":
            return num * 0.45359237
        case "lenght2":
            return num * 2.54
        default:
            return 1.609 * num
        }
    }
    
    
    //Calculates the result from the given value in the botton textField to show on the top textField
    private func metricToImperial(for symbol: String,value num: Double ) -> Double{
        
        switch symbol {
        case "temp":
            return num * 9/5 + 32
        case "lenght":
            return num * 3.28084
        case "volumen":
            return num * 0.2641
        case "weight":
            return num * 2.2046226218
        case "lenght2":
            return num / 2.54
        default:
            return 0.621 * num
        }
    }
    
    
}
