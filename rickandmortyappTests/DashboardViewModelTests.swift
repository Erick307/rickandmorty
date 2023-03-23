//
//  rickandmortyappTests.swift
//  rickandmortyappTests
//
//  Created by Erick Silva on 21/03/2023.
//

import XCTest
import Combine
@testable import rickandmortyapp

final class DashboardViewModelTests: XCTestCase {

    var repository : IRepository?
    var sut : DashboardViewModel?
    private var cancellable = Set<AnyCancellable>()
    
    override func setUp(){
        super.setUp()
        repository = MockRepository()
        sut = DashboardViewModel(repo: repository!)
        
    }

    func testFirstPages() throws {
        let expectation = XCTestExpectation()
        let sut = sut!
        sut.$all.sink{
            if $0.count > 0 {
                expectation.fulfill()
            }
        }.store(in: &cancellable)
        sut.fetchMore()
        wait(for: [expectation], timeout: 1)
        XCTAssertEqual( sut.all.count, 4)
    }
    
    func testSecondPages() throws {
        let expectation = XCTestExpectation()
        let sut = sut!
        sut.all = Character.characterList
        sut.$all.sink{
            if $0.count > 4 {
                expectation.fulfill()
            }
        }.store(in: &cancellable)
        sut.fetchMore()
        wait(for: [expectation], timeout: 1)
        XCTAssertEqual( sut.all.count, 8)
    }
    
    func testSearch() throws {
        let expectation = XCTestExpectation()
        let sut = sut!
        sut.$results.sink{
            if $0.count > 0 {
                expectation.fulfill()
            }
        }.store(in: &cancellable)
        sut.search = "Bill"
        wait(for: [expectation], timeout: 1)
        XCTAssertEqual( sut.results.count, Character.characterList.count)
    }

}

struct MockRepository : IRepository {
    
    func search(name:String, status:String?) async -> Result<Characters, Error> {
        return .success(Characters(results: Character.characterList))
    }
    
    func getCharacters(page:Int, status:String?) async -> Result<Characters, Error>{
        return .success(Characters(results: Character.characterList))
    }
    
}
