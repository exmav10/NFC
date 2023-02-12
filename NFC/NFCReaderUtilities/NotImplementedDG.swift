//
//  NotImplementedDG.swift
//  NFC
//
//  Created by Aydın ÜNAL on 12.02.2023.
//

import Foundation

@available(iOS 13, macOS 10.15, *)
public class NotImplementedDG : DataGroup {
    required init( _ data : [UInt8] ) throws {
        try super.init(data)
        datagroupType = .Unknown
    }
}
import Foundation
