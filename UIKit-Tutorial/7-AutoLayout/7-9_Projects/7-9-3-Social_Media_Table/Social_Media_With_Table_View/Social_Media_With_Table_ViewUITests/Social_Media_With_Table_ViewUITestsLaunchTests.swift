//
//  Social_Media_With_Table_ViewUITestsLaunchTests.swift
//  Social_Media_With_Table_ViewUITests
//
//  Created by Jae hyuk Yim on 2023/06/14.
//

import XCTest

final class Social_Media_With_Table_ViewUITestsLaunchTests: XCTestCase {

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