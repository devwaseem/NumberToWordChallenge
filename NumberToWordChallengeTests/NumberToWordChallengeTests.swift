//
//  NumberToWordChallengeTests.swift
//  NumberToWordChallengeTests
//
//  Created by Waseem Akram on 27/08/20.
//  Copyright © 2020 Waseem Akram. All rights reserved.
//

import XCTest
@testable import NumberToWordChallenge

class NumberToWordChallengeTests: XCTestCase {

    //Tests are compared with apple's inbuilt spellout formatter
    
    var formatter: NumberFormatter!

    override func setUp() {
        formatter = NumberFormatter()
        formatter.numberStyle = .spellOut
    }
    
    func test_word_for_first_hundred_numbers() throws {
        for value in (0...9999) {
            guard let expectedWord = formatter.string(from: NSNumber(value: value)) else {
                XCTFail("Error from formatter")
                return
            }
            do {
                let generatedWord = try NumberToWordFormatter.convert(from: value)
                if  expectedWord != generatedWord {
                    XCTFail("Expected: \(expectedWord), Generated Word: \(generatedWord)")
                }
            }catch let error {
                XCTFail(error.localizedDescription)
            }
            
        }
    }
    
    
    func test_word_for_hundred_to_thousand_numbers() throws {
        for value in (100...1000) {
            guard let expectedWord = formatter.string(from: NSNumber(value: value)) else {
                XCTFail("Error from formatter")
                return
            }
            do {
                let generatedWord = try NumberToWordFormatter.convert(from: value)
                if  expectedWord != generatedWord {
                    XCTFail("Expected: \(expectedWord), Generated Word: \(generatedWord).")
                }
            }catch let error {
                XCTFail(error.localizedDescription)
            }
            
        }
    }
    
    func test_word_for_thousand_to_million_numbers() throws {
        for value in (1000...100000) {
            guard let expectedWord = formatter.string(from: NSNumber(value: value)) else {
                XCTFail("Error from formatter")
                return
            }
            do {
                let generatedWord = try NumberToWordFormatter.convert(from: value)
                if  expectedWord != generatedWord {
                    XCTFail("Expected: \(expectedWord), Generated Word: \(generatedWord).")
                }
            }catch let error {
                XCTFail(error.localizedDescription)
            }
            
        }
    }
    
    func test_word_for_hundred_thousand_to_million_numbers() throws {
        for value in (100000...1000000) {
            guard let expectedWord = formatter.string(from: NSNumber(value: value)) else {
                XCTFail("Error from formatter")
                return
            }
            do {
                let generatedWord = try NumberToWordFormatter.convert(from: value)
                if  expectedWord != generatedWord {
                    XCTFail("Expected: \(expectedWord), Generated Word: \(generatedWord).")
                }
            }catch let error {
                XCTFail(error.localizedDescription)
            }
            
        }
    }
    
    override func tearDown() {
        formatter = nil
    }
    

}
