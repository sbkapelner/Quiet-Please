//
//  Quiet.swift
//  Quiet Please v2
//
//  Created by Sarah Kapelner on 11/4/22.
//

import PythonKit

let dirPath = "/Users/sbkapelner/Desktop"
//Access config file root "\(ConfigValues.get().{KEY})"

func runPythonCode() -> PythonObject {
    let Iterations = ConfigValues.get().Iterations
    let NumProcesses = ConfigValues.get().NumProcesses
    let SortOrder = ConfigValues.get().SortOrder
    let Threshold = ConfigValues.get().Threshold
    
    let sys = Python.import("sys")
      sys.path.append(dirPath)
      let example = Python.import("main")
      let response = example.main(Iterations, SortOrder, NumProcesses, Threshold)
      print(response)
      return response
}
