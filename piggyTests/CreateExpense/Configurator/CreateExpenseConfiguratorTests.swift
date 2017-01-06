//
//  CreateExpenseCreateExpenseConfiguratorTests.swift
//  Piggy
//
//  Created by Bootstragram on 06/01/2017.
//  Copyright © 2017 Bootstragram. All rights reserved.
//

import XCTest

class CreateExpenseModuleConfiguratorTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testConfigureModuleForViewController() {

        //given
        let viewController = CreateExpenseViewControllerMock()
        let configurator = CreateExpenseModuleConfigurator()

        //when
        configurator.configureModuleForViewInput(viewInput: viewController)

        //then
        XCTAssertNotNil(viewController.output, "CreateExpenseViewController is nil after configuration")
        XCTAssertTrue(viewController.output is CreateExpensePresenter, "output is not CreateExpensePresenter")

        let presenter: CreateExpensePresenter = viewController.output as! CreateExpensePresenter
        XCTAssertNotNil(presenter.view, "view in CreateExpensePresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in CreateExpensePresenter is nil after configuration")
        XCTAssertTrue(presenter.router is CreateExpenseRouter, "router is not CreateExpenseRouter")

        let interactor: CreateExpenseInteractor = presenter.interactor as! CreateExpenseInteractor
        XCTAssertNotNil(interactor.output, "output in CreateExpenseInteractor is nil after configuration")
    }

    class CreateExpenseViewControllerMock: CreateExpenseViewController {

        var setupInitialStateDidCall = false

        override func setupInitialState() {
            setupInitialStateDidCall = true
        }
    }
}
