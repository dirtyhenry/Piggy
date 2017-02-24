//
//  SelectContactSelectContactConfiguratorTests.swift
//  Piggy
//
//  Created by Bootstragram on 13/01/2017.
//  Copyright © 2017 Bootstragram. All rights reserved.
//

import XCTest

class SelectContactModuleConfiguratorTests: XCTestCase {

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
        let viewController = SelectContactViewControllerMock()
        let configurator = SelectContactModuleConfigurator()

        //when
        configurator.configureModuleForViewInput(viewInput: viewController)

        //then
        XCTAssertNotNil(viewController.output, "SelectContactViewController is nil after configuration")
        XCTAssertTrue(viewController.output is SelectContactPresenter, "output is not SelectContactPresenter")

        let presenter: SelectContactPresenter = viewController.output as! SelectContactPresenter
        XCTAssertNotNil(presenter.view, "view in SelectContactPresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in SelectContactPresenter is nil after configuration")
        XCTAssertTrue(presenter.router is SelectContactRouter, "router is not SelectContactRouter")

        let interactor: SelectContactInteractor = presenter.interactor as! SelectContactInteractor
        XCTAssertNotNil(interactor.output, "output in SelectContactInteractor is nil after configuration")
    }

    class SelectContactViewControllerMock: SelectContactViewController {

        var setupInitialStateDidCall = false

        override func setupInitialState() {
            setupInitialStateDidCall = true
        }
    }
}
