//
//  ContentView.swift
//  Quiet Please v2
//
//  Created by Sarah Kapelner on 11/4/22.
//

import SwiftUI

struct ContentView: View {
    @State var showResult: Bool = false
    var body: some View {
        Button(action: {
            UpdateConfig.update(newSortOrder: "cpu", newThreshold: "3.0", newNumProcesses: 3, newIterations: 3)
            runPythonCode()
            showResult.toggle()
        }) {Text("Run Python")}
        if showResult {
            Text(String("\(runPythonCode)"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
