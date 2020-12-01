///
///  Point3.swift
///  EuclideanSpace
///
///  Created by Gemuele Aludino on 12/1/20.
///

/// TODO: Documentation

public struct Point3 {
    private var m_impl: [Double] = [0.0, 0.0, 0.0]
    
    public init() { }
    
    public init(_ x: Double, _ y: Double, _ z: Double) {
        self.x = x
        self.y = y
        self.z = z
    }
    
    public init(_ arr: [Double]) {
        x = arr[0]
        y = arr[1]
        z = arr[2]
    }
    
    public init(otherPoint p: Point3) {
        array = p.array
    }
}

/// Properties
extension Point3 {
    public subscript(index: Int) -> Double {
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
    
    public var z: Double {
        get { return m_impl[2] } 
        set { m_impl[2] = newValue }
    }
    
    public var array: [Double] {
        get { return m_impl } 
        set { m_impl = newValue }
    }
}

/// Methods
extension Point3 {
    public mutating func reset() {        
        x = 0.0
        y = 0.0
    }
}
 
/// Operators
extension Point3 {
    public static prefix func - (p: inout Point3) -> Point3 {
        p.x = -p.x
        p.y = -p.y
        p.z = -p.z
        return p
    }
}

/// Operators on self
extension Point3 {
    public mutating func negate() -> Point3 {
        return -self
    }
}

extension Point3 : CustomStringConvertible {
    public var description: String {
        return "(\(x), \(y), \(z)"
    }
}

extension Point3 : Equatable {
    public static func == (_ lhs: Point3, 
                           _ rhs: Point3) -> Bool {
        return lhs.x == rhs.x 
            && lhs.y == rhs.y 
            && lhs.z == rhs.z
    }
}
