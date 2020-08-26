import UIKit

let ones = ["", "one","two","three","four", "five", "six","seven","eight","nine","ten","eleven","twelve", "thirteen", "fourteen", "fifteen","sixteen","seventeen", "eighteen","nineteen"]
 
let decades = ["","","twenty","thirty","forty", "fifty","sixty","seventy","eighty","ninety"]
 
let thousands = ["","thousand","million", "billion", "trillion", "quadrillion", "quintillion"]


func wordForThreeDigitNumber(_ n:Int) -> String {
    guard n <= 999 else { return "" }
    
    let singleDigit = n % 10
    let tensDigit = (n % 100 - singleDigit) / 10
    let hundredsDigit = ((n % 1000) - (tensDigit*10) - singleDigit) / 100
    
    var thousands = ""
    var hundreds = ""
    
     if hundredsDigit != 0 {
        thousands = ones[hundredsDigit] + " hundred" + (tensDigit == 0 && singleDigit == 0 ? "" : " ")
    }
    
    if tensDigit <= 1 {
        hundreds = ones[n % 100]
    }else if tensDigit > 1 {
        hundreds = decades[tensDigit]
        if singleDigit != 0 {
            hundreds = hundreds + "-" + ones[singleDigit]
        }
    }
    
    return thousands + hundreds
}

func numberToWord(value: String) -> String {
    
    if value.count > thousands.count * 3 {
        return "Not supported"
    }
    
    guard let integerValue = Int(value) else { return "" }
    if integerValue == 0 {
        return "zero"
    }
    
    
    
    var value = value
    var thousandUnitsPlace = 0
    var word = ""
    
    while value.count > 0 {
        guard let lastThreeDigits = Int(value.suffix(3)) else { return "" }
        for _ in (0..<3) { value.popLast() }
        if lastThreeDigits == 0 {
            word = wordForThreeDigitNumber(lastThreeDigits) + " " + word
        } else {
            word = wordForThreeDigitNumber(lastThreeDigits) +  " " +  thousands[thousandUnitsPlace] + " " + word
        }
        thousandUnitsPlace += 1
    }
    
    return word.trimmingCharacters(in: .whitespacesAndNewlines)
}


print(numberToWord(value: "1111"))



//MARK:- Testcases
// compare with apple's spellout formatter

let formatter = NumberFormatter()
formatter.numberStyle = .spellOut

func checkAllTestCases(){
    for value in (0...9999) {
        guard let expectedWord = formatter.string(from: NSNumber(value: value)) else {
            print("Error from formatter")
            return
        }
        let generatedWord = numberToWord(value: "\(value)")
        if  expectedWord != generatedWord {
            print("Test failed")
            print("Expected: \(expectedWord), Generated Word: \(generatedWord)")
            return
        }
    }
    print("All testcases passed")
    
}

//checkAllTestCases()
