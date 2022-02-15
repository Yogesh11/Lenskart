//
//  MovieViewModelTests.swift
//  CodeTests
//
//  Created by Yogesh2 Gupta on 15/02/22.
//

import XCTest
@testable import Code
class MovieViewModelTests: XCTestCase {
    var viewModel = MovieViewModel()
    
    func testApiCall() {
        print("I am here- 1")
        viewModel.getDataforPage(0, manager: MockApiManager()) { result, error in
            print("I am here")
        }
    }
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

extension Bundle {
    func loadJson(fileName: String) -> NSDictionary? {
        if let url = self.url(forResource: fileName, withExtension: "json") {
            if let data = NSData(contentsOf: url) {
                do {
                    let dictionary = try JSONSerialization.jsonObject(with: data as Data, options: .fragmentsAllowed) as? NSDictionary
                    return dictionary
                } catch {
                    print("Error!! Unable to parse  \(fileName).json")
                }
            }
            print("Error!! Unable to load  \(fileName).json")
        }
        return nil
    }
}

extension NSDictionary {
    
    func jsonObject <T:Decodable> (ofType type:T.Type) ->T? {
        
        var typeAny:T?
        
            do {
                let jsonData = try? JSONSerialization.data(withJSONObject: self, options: [])
                let decoder = JSONDecoder()
                if jsonData !=  nil {
                    typeAny = try decoder.decode(type, from: jsonData!)
                }
            } catch{
                print(error)
            }
        
        return typeAny
    }
}
