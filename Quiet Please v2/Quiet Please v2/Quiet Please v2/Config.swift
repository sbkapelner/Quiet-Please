//
//  Config.swift
//  ConfigSwift
//
//  Created by Alex Nagy on 07/06/2019.
//  Copyright © 2019 Alex Nagy. All rights reserved.
//

import Foundation
import SwiftUI

struct Config: Decodable {
    let SortOrder: String
    let Threshold: String
    let NumProcesses: Int
    let Iterations: Int
}

struct ConfigValues {
    static func get() -> Config {
        guard let url = Bundle.main.url(forResource: "Config", withExtension: "plist")
        else {
            fatalError("Could not find Config.plist in your Bundle")
        }
        do {
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            return try decoder.decode(Config.self, from: data)
        } catch let err {
            fatalError(err.localizedDescription)
        }
    }
}
