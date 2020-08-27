//
//  NumberToWordFormatter.swift
//  NumberToWordChallenge
//
//  Created by Waseem Akram on 27/08/20.
//  Copyright © 2020 Waseem Akram. All rights reserved.
//

import Foundation

enum NumberToWordFormatError: Error, LocalizedError {
    case notSupported
    case invalidInteger
    
    var errorDescription: String? {
        switch self {
        case .notSupported:
            return "Conversion Maximum limit reached. Use a smaller value"
        case .invalidInteger:
            return "Invalid integer provided"
        }
    }
}


/// Utility class to convert a integer to human readable word.
class NumberToWordFormatter {
    
    private init(){}
    
    private static let ones = ["", "one","two","three","four", "five", "six","seven","eight","nine","ten","eleven","twelve", "thirteen", "fourteen", "fifteen","sixteen","seventeen", "eighteen","nineteen"]
    private static let decades = ["","","twenty","thirty","forty", "fifty","sixty","seventy","eighty","ninety"]
    private static let thousands = ["","thousand","million", "billion", "trillion", "quadrillion", "quintillion"] //can add more. the code will adapt itself.

    
    /// Converts a Integer to Human readable format word
    /// - Parameter value: String value containing integer. (Maximum value upto quintillion)
    /// - Throws: can throw invalid integer and Integer not supported errors
    /// - Returns: Human readable format string
    public static func convert(from value:Int) throws -> String {
        try NumberToWordFormatter.convert(from: String(value))
    }
    
    /// Converts a String of Integer to Human readable format word
    /// - Parameter value: String value containing integer. (Maximum value upto quintillion)
    /// - Throws: can throw invalid integer and Integer not supported errors
    /// - Returns: Human readable format string
    public static func convert(from value: String) throws -> String {
        
        //check if the integer can be converted
        if value.count > thousands.count * 3 {
            throw NumberToWordFormatError.notSupported
        }
        
        //premature check for valid integers in string.
        for i in value {
            guard Int("\(i)") != nil else { throw NumberToWordFormatError.invalidInteger }
        }
        
        if value == "0" {
            return "zero"
        }
        
        var value = value
        var thousandUnitsPlace = 0
        var word = ""
        
        //take last three numbers from input and generate word until the input is emmpty
        while value.count > 0 {
            guard let lastThreeDigits = Int(value.suffix(3)) else { throw NumberToWordFormatError.invalidInteger }
            for _ in (0..<3) { let _ = value.popLast() }
            if lastThreeDigits == 0 {
                word = wordForThreeDigitNumber(lastThreeDigits) + " " + word
            } else {
                word = wordForThreeDigitNumber(lastThreeDigits) +  " " +  thousands[thousandUnitsPlace] + " " + word
            }
            thousandUnitsPlace += 1
        }
        
        return word.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    /// Generate human readable format string for 3 digit number
    /// - Parameter n: 3 digit number
    /// - Returns: human readable string
    private static func wordForThreeDigitNumber(_ n:Int) -> String {
        guard n <= 999 else { return "" }
        
        let singleDigit = n % 10 //get last digit
        let tensDigit = (n % 100 - singleDigit) / 10 //get 2nd digit
        let hundredsDigit = ((n % 1000) - (tensDigit*10) - singleDigit) / 100 //get 1st digit
        
        var thousands = ""
        var hundreds = ""
        
         if hundredsDigit != 0 { //if hundred digit is set then we can represent hundred in word.
            thousands = ones[hundredsDigit] + " hundred" + (tensDigit == 0 && singleDigit == 0 ? "" : " ")
        }
        
        if tensDigit <= 1 { //check if the number contains teens or single digit number
            hundreds = ones[n % 100]
        }else if tensDigit > 1 { // else proceed with decades.
            hundreds = decades[tensDigit]
            if singleDigit != 0 {
                hundreds = hundreds + "-" + ones[singleDigit]
            }
        }
        
        return thousands + hundreds
    }
        
}
