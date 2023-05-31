//
//  alignTextViewVerticallyInContainer.swift
//  UpDownGame
//
//  Created by Jae hyuk Yim on 2023/05/31.
//

import Foundation
import UIKit

extension UITextView {
    func alignTextViewVerticallyInContainer() {
        var topCorrect = (self.bounds.size.height - self.contentSize.height * self.zoomScale)
        topCorrect = topCorrect < 0.0 ? 0.0 : topCorrect
        self.contentInset.top = topCorrect
    }
}
