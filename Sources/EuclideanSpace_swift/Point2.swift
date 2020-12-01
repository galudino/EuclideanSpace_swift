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
 
/// Properties
extension Point2 {
    public subscript(_ index: Int) -> Double {
        get { return m_impl[index] }
        set { m_impl[index] = newValue }
    }
    
    public var x: Double {
        get { return m_impl[0] } 
        set { m_impl[0] = newValue }
    }
    
    public var y: Double {
        get { return m_impl[1] } 
        set { m_impl[1] = newValue }
    }
    
    public var array: [Double] {
        get { return m_impl } 
        set { m_impl = newValue }
    }
}

/// Methods
extension Point2 {
    public mutating func reset() {
        x = 0.0
        y = 0.0
    }
}

/// Operators
extension Point2 {
    public static prefix func - (p: inout Point2) -> Point2 {
        p.x = -p.x
        p.y = -p.y
        return p
    }
}

/// Operators on self
extension Point2 {
    public mutating func negate() -> Point2 {
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
