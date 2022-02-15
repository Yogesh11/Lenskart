//
//  MockApiManager.swift
//  CodeTests
//
//  Created by Yogesh2 Gupta on 15/02/22.
//

import XCTest
@testable import Code

class MockApiManager: ApiManager {
    override func getDataForPage(_ page: Int, completionBlock: @escaping Constant.CompletionBlock) {
        let data = Bundle(for: type(of: self)).loadJson(fileName: "MockMovie")
        let movie =  data?.jsonObject(ofType: Movies.self)
        completionBlock(movie, prepareErrorWithMessage())
    }

}
