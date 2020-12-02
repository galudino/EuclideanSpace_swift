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

public extension Point3 {
    static let origin = Point3()
}

/// Properties
public extension Point3 {
    subscript(index: Int) -> Double {
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
    
    var z: Double {
        get { return m_impl[2] } 
        set { m_impl[2] = newValue }
    }
    
    var array: [Double] {
        get { return m_impl } 
        set { m_impl = newValue }
    }
    
    var distanceFromOrigin: Double {
        return distanceFrom(otherPoint: Point3.origin)
    }
}

/// Methods
public extension Point3 {
    mutating func reset() {
        x = 0.0
        y = 0.0
    }
    
    func distanceFrom(otherPoint p: Point3) -> Double {
        return computeEuclideanDistance(srcCoords: p.array, dstCoords: array)
    }
}
 
/// Operators
public extension Point3 {
    static prefix func - (p: inout Point3) -> Point3 {
        p.x = -p.x
        p.y = -p.y
        p.z = -p.z
        return p
    }
}

/// Operators on self
public extension Point3 {
    mutating func negate() -> Point3 {
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
