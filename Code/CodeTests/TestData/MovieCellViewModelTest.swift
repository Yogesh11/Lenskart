//
//  MovieCellViewModelTest.swift
//  CodeTests
//
//  Created by Yogesh2 Gupta on 15/02/22.
//

import XCTest
@testable import Code

class MovieCellViewModelTest: XCTestCase {
    var  movie : Movie?
    func testMovieCellViewModel(){
        let viewModel = MovieCellViewModel(movie: movie)
        if viewModel == nil {
            XCTAssertNil(viewModel, "Result should be nil")
            XCTAssertNil(viewModel?.getMovieTitle(), "title should not be nil")
            XCTAssertNil(viewModel?.getOverView(), "Overview should not be nil")
            XCTAssertNil(viewModel?.getPopularity(), "Popularity should be nil")
            XCTAssertFalse(((movie?.addedToWatchList()) != nil))
        } else{
            XCTAssertNotNil(viewModel, "Result should not be nil")
            XCTAssertNotNil(viewModel?.getMovieTitle(), "Title should not be nil")
            XCTAssertNotNil(viewModel?.getOverView(), "Overview should not be nil")
            XCTAssertNotNil(viewModel?.getPopularity(), "Popularity should not be nil")
            viewModel?.ctaAddedToWatchListAction()
            if movie?.addedToWatchList() ?? false {
                XCTAssertTrue(movie?.addedToWatchList() ?? false)
            } else{
                XCTAssertFalse(movie?.addedToWatchList() ?? false)
            }
           
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
