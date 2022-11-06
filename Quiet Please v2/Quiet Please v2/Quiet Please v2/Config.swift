//
//  Config.swift
//  ConfigSwift
//
//  Created by Alex Nagy on 07/06/2019.
//  Copyright © 2019 Alex Nagy. All rights reserved.
//
//  Modified by Sarah Kapelner on 11/6/22.

import Foundation
import SwiftUI

struct Config: Decodable {
    var SortOrder: String
    var Threshold: String
    var NumProcesses: Int
    var Iterations: Int
}

struct NewConfig: Codable {
    var SortOrder: String
    var Threshold: String
    var NumProcesses: Int
    var Iterations: Int
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

struct UpdateConfig {
    static func update (newSortOrder: String, newThreshold: String, newNumProcesses: Int, newIterations: Int) {
        let newData = NewConfig(SortOrder: newSortOrder, Threshold: newThreshold, NumProcesses: newNumProcesses, Iterations: newIterations)
        
        let encoder = PropertyListEncoder()
        encoder.outputFormat = .xml
        
        guard let url = Bundle.main.url(forResource: "Config", withExtension: "plist")
        else {
            fatalError("Could not find Config.plist in your Bundle")
        }
        
        do {
            let data = try encoder.encode(newData)
            try data.write(to: url)
        } catch {
            print(error)
        }
    }
}
