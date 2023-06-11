//
//  Two_Views_with_Complex_WidthsUITestsLaunchTests.swift
//  Two_Views_with_Complex_WidthsUITests
//
//  Created by Jae hyuk Yim on 2023/06/07.
//

import XCTest

final class Two_Views_with_Complex_WidthsUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
