//
//  UnitTestingBootCampViewModel_Tests.swift
//  SwiftAdvancedLearning_Tests
//
//  Created by Manish Parihar on 07.08.23.
//

import XCTest
@testable import SwiftAdvancedLearning
import Combine

// Naming Structure: test_UnitOfWork_StateUnderTest_ExpectedBehavior
// Naming Structure: test_[struct or class]_[variable or function]_[expected result]
// Testing Structure: Given, When, Then

final class UnitTestingBootCampViewModel_Tests: XCTestCase {
    
    var  viewModel: UnitTestingBootCampViewModel?
    var cancellables = Set<AnyCancellable>()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        viewModel = UnitTestingBootCampViewModel(isPremium: Bool.random())
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        // Reset everything
        viewModel = nil
    }

    func test_UnitTestingBootCampViewModel_isPremium_shouldBeTrue() {
        // Given
        let userIsPremium: Bool = true
        
        // When
        let vm = UnitTestingBootCampViewModel(isPremium: userIsPremium)
        
        // Then
        XCTAssertTrue(vm.isPremium)
    }
    
    func test_UnitTestingBootCampViewModel_isPremium_shouldBeFalse() {
        // Given
        let userIsPremium: Bool = false
        
        // When
        let vm = UnitTestingBootCampViewModel(isPremium: userIsPremium)
        
        // Then
        
        XCTAssertFalse(vm.isPremium)
    }
    
    func test_UnitTestingBootCampViewModel_isPremium_shouldBeInjectedValue() {
        // Given
        let userIsPremium: Bool = Bool.random()
        
        // When
        let vm = UnitTestingBootCampViewModel(isPremium: userIsPremium)
        
        // Then
        XCTAssertEqual(vm.isPremium, userIsPremium)
    }
    
    // This test is safer than test_UnitTestingBootCampViewModel_isPremium_shouldBeInjectedValue()
    func test_UnitTestingBootCampViewModel_isPremium_shouldBeInjectedValue_stress() {
        
        for _ in 0..<10 {
            // Given
            let userIsPremium: Bool = Bool.random()
            
            // When
            let vm = UnitTestingBootCampViewModel(isPremium: userIsPremium)
            
            // Then
            XCTAssertEqual(vm.isPremium, userIsPremium)
        }
    }
    
    func test_UnitTestingBootCampViewModel_dataArray_shouldBeEmpty() {
        // Given
        
        
        // When
        let vm = UnitTestingBootCampViewModel(isPremium: Bool.random())
        
        // Then
        XCTAssertTrue(vm.dataArray.isEmpty)
        XCTAssertEqual(vm.dataArray.count, 0) // We can add multiple XCTAssert
    }
    
    func test_UnitTestingBootCampViewModel_dataArray_shouldAddItem() {
        // Given
        let vm = UnitTestingBootCampViewModel(isPremium: Bool.random())

        
        // When
        vm.addItem(item: "hello")
        
        // Then
        XCTAssertTrue(!vm.dataArray.isEmpty)
        XCTAssertFalse(vm.dataArray.isEmpty)
        XCTAssertEqual(vm.dataArray.count,1)
        XCTAssertNotEqual(vm.dataArray.count,0)
        XCTAssertGreaterThan(vm.dataArray.count,0)
        // XCTAssertGreaterThanOrEqual(<#T##expression1: Comparable##Comparable#>, <#T##expression2: Comparable##Comparable#>)
        // XCTAssertLessThan(<#T##expression1: Comparable##Comparable#>, <#T##expression2: Comparable##Comparable#>)
        // XCTAssertLessThanOrEqual(<#T##expression1: Comparable##Comparable#>, <#T##expression2: Comparable##Comparable#>)
    }
    
    func test_UnitTestingBootCampViewModel_dataArray_shouldNotAddBlankString() {
        // Given
        let vm = UnitTestingBootCampViewModel(isPremium: Bool.random())

        // When
        vm.addItem(item: "hello")
        
        // Then
        XCTAssertTrue(!vm.dataArray.isEmpty)
       
    }
    
    func test_UnitTestingBootCampViewModel_dataArray_shouldAddItems() {
        // Given
        let vm = UnitTestingBootCampViewModel(isPremium: Bool.random())

        // When
        let loopCount: Int = Int.random(in: 1..<100)
        for _ in 0..<loopCount {
            vm.addItem(item: UUID().uuidString)
        }
        
        // Then
        XCTAssertTrue(!vm.dataArray.isEmpty)
        XCTAssertFalse(vm.dataArray.isEmpty)
        XCTAssertEqual(vm.dataArray.count, loopCount)
        XCTAssertNotEqual(vm.dataArray.count,0)
        XCTAssertGreaterThan(vm.dataArray.count,0)
    }
    
    func test_UnitTestingBootCampViewModel_dataArray_shouldStartAsNil() {
        // Given
        

        // When
        let vm = UnitTestingBootCampViewModel(isPremium: Bool.random())
        
        // Then
        XCTAssertTrue(vm.selectedItem == nil)
        XCTAssertNil(vm.selectedItem)
       
    }
    
    func test_UnitTestingBootCampViewModel_dataArray_shouldBeNilWhenSelectingInvalidItem() {
        // Given
        let vm = UnitTestingBootCampViewModel(isPremium: Bool.random())

        // When
        let newItem = UUID().uuidString
        vm.addItem(item: newItem)
        vm.selectedItem(item: newItem)
        
        
        vm.selectedItem(item: UUID().uuidString)
        
        // Then
        XCTAssertTrue(vm.selectedItem == nil)
       
    }

    func test_UnitTestingBootCampViewModel_dataArray_shouldBeSelected() {
        // Given
        let vm = UnitTestingBootCampViewModel(isPremium: Bool.random())

        // When
        let newItem = UUID().uuidString
        vm.selectedItem(item: newItem)
        
        // Then
        XCTAssertNil(vm.selectedItem)
       // XCTAssertEqual(vm.selectedItem, newItem)
       
    }
    
    func test_UnitTestingBootCampViewModel_selectedItem_shouldBeSelected_stress() {
        // Given
        let vm = UnitTestingBootCampViewModel(isPremium: Bool.random())

        // When
        let loopCount : Int = Int.random(in: 1..<100)
        var itemsArray : [String] = []
        
        for _ in 0..<loopCount {
            let newItem = UUID().uuidString
            vm.addItem(item: newItem)
            itemsArray.append(newItem)
        }
        
        let randomItem = itemsArray.randomElement() ?? ""
        vm.selectedItem(item: randomItem)
        
        // Then
        XCTAssertNotNil(vm.selectedItem)
        XCTAssertEqual(vm.selectedItem, randomItem)
       
    }
    
    func test_UnitTestingBootCampViewModel_saveItem_shouldThrowError_noData() {
        // Given
        let vm = UnitTestingBootCampViewModel(isPremium: Bool.random())

        // When
        
        
        // Then
        XCTAssertThrowsError(try vm.saveItem(item: UUID().uuidString))
        XCTAssertThrowsError(try vm.saveItem(item: UUID().uuidString), "Should throw Item not found error") {error in
            let returnedError = error as? UnitTestingBootCampViewModel.DataError
            XCTAssertEqual(returnedError, UnitTestingBootCampViewModel.DataError.itemNotFound)
        }
       
    }
    
    func test_UnitTestingBootCampViewModel_saveItem_shouldSaveItem() {
        // Given
        let vm = UnitTestingBootCampViewModel(isPremium: Bool.random())
        
        // When
        let loopCount: Int = Int.random(in: 1..<100)
        var itemsArray:[String] = []
        
        for _ in 0..<loopCount {
            let newItem = UUID().uuidString
            vm.addItem(item: newItem)
            itemsArray.append(newItem)
        }
        
        let randomItem = itemsArray.randomElement() ?? ""
        XCTAssertFalse(randomItem.isEmpty)
        
        // Then
        XCTAssertNoThrow(try vm.saveItem(item: randomItem))
        
        do {
            try vm.saveItem(item: randomItem)
        } catch {
            XCTFail()
        }
    }
    
    
    func test_UnitTestingBootCampViewModel_downloadWithEscaping_shouldReturnItems() {
        // Given
        let vm = UnitTestingBootCampViewModel(isPremium: Bool.random())
        
        // When
        let expectation = XCTestExpectation(description: "Should return items after 3 seconds.")
        vm.$dataArray
            .dropFirst() // Because our first dataArray is empty, dataArray: [String] = []
            .sink { returnedItems in
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        vm.downloadWithEscaping()
        
        // Then
        // Because our downloadData is delayed by 3 second
        wait(for: [expectation], timeout: 5)
        XCTAssertGreaterThan(vm.dataArray.count, 0)
        
        
    }
    
    func test_UnitTestingBootCampViewModel_downloadWithCombine_shouldReturnItems() {
        // Given
        let vm = UnitTestingBootCampViewModel(isPremium: Bool.random())
        
        // When
        let expectation = XCTestExpectation(description: "Should return items after 3 seconds.")
        vm.$dataArray
            .dropFirst() // Because our first dataArray is empty, dataArray: [String] = []
            .sink { returnedItems in
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        vm.downloadWithCombine()  
        
        // Then
        // Because our downloadData is delayed by 3 second
        wait(for: [expectation], timeout: 5)
        XCTAssertGreaterThan(vm.dataArray.count, 0)
        
        
    }
    
}
