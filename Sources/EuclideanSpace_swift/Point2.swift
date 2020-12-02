///
///  Point2.swift
///  EuclideanSpace
///
///  Created by Gemuele Aludino on 11/30/20.
///

/// TODO: Documentation

public struct Point2 {
    private var m_impl: [Double] = [0.0, 0.0]
    
    public init() { }
    
    public init(_ x: Double, _ y: Double) {
        self.x = x
        self.y = y
    }
    
    public init(_ arr: [Double]) {
        x = arr[0]
        y = arr[1]
    }
    
    public init(otherPoint p: Point2) {
        array = p.array
    }
}

public extension Point2 {
    static let origin = Point2()
}
 
/// Properties
public extension Point2 {
    subscript(_ index: Int) -> Double {
        get { return m_impl[index] }
        set { m_impl[index] = newValue }
    }
    
    var x: Double {
        get { return m_impl[0] } 
        set { m_impl[0] = newValue }
    }
    
    var y: Double {
        get { return m_impl[1] } 
        set { m_impl[1] = newValue }
    }
    
    var array: [Double] {
        get { return m_impl } 
        set { m_impl = newValue }
    }
    
    var distanceFromOrigin: Double {
        return distanceFrom(otherPoint: Point2.origin)
    }
}

/// Methods
public extension Point2 {
    mutating func reset() {
        x = 0.0
        y = 0.0
    }
    
    func distanceFrom(otherPoint p: Point2) -> Double {
        // distance from p to self
        return computeEuclideanDistance(srcCoords: p.array, dstCoords: array)
    }
}

/// Operators
public extension Point2 {
    static prefix func - (p: inout Point2) -> Point2 {
        p.x = -p.x
        p.y = -p.y
        return p
    }
}

/// Operators on self
public extension Point2 {
    mutating func negate() -> Point2 {
        return -self
    }
}

extension Point2 : CustomStringConvertible {
    public var description: String {
        return "{\(x), \(y)}"
    }
}

extension Point2 : Equatable {
    public static func == (_ lhs: Point2, 
                           _ rhs: Point2) -> Bool {
        return lhs.x == rhs.x
            && lhs.y == rhs.y
    }
}
