//
//  LatLonToIrishGrid.swift
//  Hiiker
//
//  Created by Paul Finlay on 06/03/2021.
//  Copyright © 2021 Waymarked Trails. All rights reserved.
//

import JavaScriptCore
import CoreLocation

class LatLonToIrishGrid {
    
    let context = JSContext()
    var proj4: JSValue? = nil
    let irishGridESPG = "EPSG:29903"
    
    private static var sharedInstance: LatLonToIrishGrid? = nil
    static func shared() -> LatLonToIrishGrid {
        if LatLonToIrishGrid.sharedInstance == nil {
            LatLonToIrishGrid.sharedInstance = LatLonToIrishGrid()
            LatLonToIrishGrid.sharedInstance?.setupJS()
            return LatLonToIrishGrid.sharedInstance!
        } else {
            return LatLonToIrishGrid.sharedInstance!
        }
    }
    
    private func setupJS() {
        guard let path = Bundle.main.path(forResource:"proj4", ofType: "js"), let data = FileManager.default.contents(atPath: path) else {
            fatalError("Can not get json data")
        }
        let proj4String = String(data: data, encoding: .utf8)!
        context?.evaluateScript(proj4String)
        self.proj4 = context?.objectForKeyedSubscript("proj4")
    }
    
    func getGridRef(for location: CLLocationCoordinate2D) -> String {
        let args = [irishGridESPG, [location.longitude, location.latitude]] as [Any]
        let result = proj4?.call(withArguments: args)
        if result?.isArray == true {
            let val1Full = result?.toArray()[0] as! Double
            let val2Full = result?.toArray()[1] as! Double
            let firstInt = Int(val1Full.toString().first?.description ?? "")!
            let secondInt = Int(val2Full.toString().first?.description ?? "")!
            let gridRefLetter = arrayToGridRef(gridRefArray: [firstInt, secondInt])
            let string1 = val1Full.roundToInt().toString().dropFirst()
            let string2 = val2Full.roundToInt().toString().dropFirst()
            return "\(gridRefLetter) \(string1) \(string2)"
        }
        return "Out of range"
    }
    
    private func arrayToGridRef(gridRefArray: [Int]) -> String {
        switch gridRefArray {
        case [0, 0]:
            return "V"
        case [1, 0]:
            return "W"
        case [2, 0]:
            return "X"
        case [3, 0]:
            return "Y"
        case [4, 0]:
            return "Z"
        case [0, 1]:
            return "Q"
        case [1, 1]:
            return "R"
        case [2, 1]:
            return "S"
        case [3, 1]:
            return "T"
        case [4, 1]:
            return "U"
        case [0, 2]:
            return "L"
        case [1, 2]:
            return "M"
        case [2, 2]:
            return "N"
        case [3, 2]:
            return "O"
        case [4, 2]:
            return "P"
        case [0, 3]:
            return "F"
        case [1, 3]:
            return "G"
        case [2, 3]:
            return "H"
        case [3, 3]:
            return "J"
        case [4, 3]:
            return "K"
        case [0, 4]:
            return "A"
        case [1, 4]:
            return "B"
        case [2, 4]:
            return "C"
        case [3, 4]:
            return "D"
        case [4, 4]:
            return "E"
        default:
            return "Out of range"
        }
    }
}
