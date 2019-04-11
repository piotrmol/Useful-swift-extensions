//
//  DateExtension.swift
//  GISMO
//
//  Created by Piotr Mol on 18/02/2019.
//  Copyright © 2019 Piotr Mol. All rights reserved.
//

import Foundation

extension Date {
    var timestamp: UInt64 {
        return UInt64((self.timeIntervalSince1970 + 62_135_596_800) * 10_000_000)
    }
}
