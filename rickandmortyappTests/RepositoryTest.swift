//
//  RepositoryTest.swift
//  rickandmortyappTests
//
//  Created by Erick Silva on 22/03/2023.
//

import XCTest
@testable import rickandmortyapp

final class RepositoryTest: XCTestCase {
    
    var sut : IRepository?
    
    override func setUp(){
        super.setUp()
        sut = Repository()
    }

    func testSearchBill() async throws {
        let sut = self.sut!
        let response = await sut.search(name:"Bill", status:nil)
        switch response {
        case .success(let data):
            XCTAssertEqual( data.results.count, 2)
        case .failure(_):
            break
        }
    }
    
    func testFirstPage() async throws {
        let sut = self.sut!
        let response = await sut.getCharacters(page:1, status:nil)
        switch response {
        case .success(let data):
            XCTAssertEqual( data.results.count, 20)
        case .failure(_):
            break
        }
    }
    
    func testFirstPageStatusUnknown() async throws {
        let sut = self.sut!
        let response = await sut.getCharacters(page:1, status:"unknown")
        switch response {
        case .success(let data):
            XCTAssertEqual( data.results[0].id, 7)
        case .failure(_):
            break
        }
    }

}
