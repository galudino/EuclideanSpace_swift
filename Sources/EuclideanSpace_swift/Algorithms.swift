///
///  Algorithms.swift
///  EuclideanSpace
///
///  Created by Gemuele Aludino on 12/1/20.
///

import Foundation

public func computeEuclideanDistance(srcCoords p: [Double],
                                     dstCoords q: [Double]) -> Double {
    var distance = 0.0
    
    let sizeSource = p.count
    let sizeDestination = q.count
    
    if sizeSource != sizeDestination {
        distance = -1.0
    } else {
        var sum = 0.0
        
        for i in 0...sizeDestination - 1 {
            let delta = q[i] - p[i]
            sum += Double(delta * delta)
        }
        
        distance = sum.squareRoot()
    }
    
    return distance
 }

public func computeDotProduct(srcComponent u: [Double],
                              dstComponent v: [Double]) -> Double {
    var result = 0.0
    
    let sizeSrc = u.count
    let sizeDst = v.count
    
    if sizeSrc != sizeDst {
        result = -1.0
    } else {
        var sum = 0.0
        
        for i in 0...sizeDst - 1 {
            let product = u[i] * v[i]
            sum += product
        }
        
        result = sum
    }
    
    return result
}

public func convertToRadians(degrees: Double) -> Double {
    return (Double.pi * degrees) / 180
}

public func convertToDegrees(radians: Double) -> Double {
    return (180 * radians) / Double.pi
}
