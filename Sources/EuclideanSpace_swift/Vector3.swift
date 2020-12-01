///
///  Vector3.swift
///  EuclideanSpace
///
///  Created by Gemuele Aludino on 12/1/20.
///

/// TODO: Documentation

public struct Vector3 {
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
    }
    
    public init(_ src: [Double], _ dst: [Double]) {
        x = dst[0] - src[0]
        y = dst[1] - src[1]
    }
    
    public init(otherVector v: Vector3) {
        array = v.array
    }
}

/// Properties
extension Vector3 {
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
    
    public var magnitude: Double {
        return computeEuclideanDistance(
            srcCoords: Vector3.zeroVector.array,
            dstCoords: m_impl)
    }
}

/// Methods
extension Vector3 {
    public mutating func reset(){
        x = 0.0
        y = 0.0
        z = 0.0
    }
    
    public func angle(withRespectTo v: Vector3) -> Double {
        return computeDotProduct(srcComponent: m_impl, dstComponent: v.m_impl) / (magnitude * v.magnitude)
    }
}

/// Operators (inout)
extension Vector3 {
    public static prefix func - (v: inout Vector3) -> Vector3 {
        v.x = -v.x
        v.y = -v.y
        v.z = -v.z
        return v
    }

    public static func += (lhs: inout Vector3, rhs: Vector3) -> Vector3 {
        lhs.x += rhs.x
        lhs.y += rhs.y
        lhs.z += rhs.z
        return lhs
    }

    public static func -= (lhs: inout Vector3, rhs: Vector3) -> Vector3 {
        lhs.x -= rhs.x
        lhs.y -= rhs.y
        lhs.z -= rhs.z
        return lhs
    }
    
    public static func *= (v: inout Vector3, scalar: Double) -> Vector3 {
        v.x *= scalar
        v.y *= scalar
        return v
    }
    
    public static func *= (lhs: inout Vector3, rhs: Vector3) -> Double {
        return computeDotProduct(srcComponent: lhs.array, dstComponent: rhs.array)
    }
    
    public static func /= (v: inout Vector3, scalar: Double) -> Vector3 {
        v.x /= scalar
        v.y /= scalar
        v.z /= scalar
        return v
    }
}
 
/// Operators (pass/return by value)
extension Vector3 {
    public static func + (lhs: Vector3, rhs: Vector3) -> Vector3{
        var tempLeft = lhs
        return tempLeft += rhs
    }

    public static func - (lhs: Vector3, rhs: Vector3) -> Vector3 {
        var tempLeft = lhs
        return tempLeft -= rhs
    }

    public static func * (v: Vector3, scalar: Double) -> Vector3 {
        var tempLeft = v
        return tempLeft *= scalar
    }
    
    public static func * (lhs: Vector3, rhs: Vector3) -> Double {
        var tempLeft = lhs
        return tempLeft *= rhs
    }
    
    public static func / (v: Vector3, scalar: Double) -> Vector3 {
        var tempLeft = v
        return tempLeft /= scalar
    }
}

/// Operators as static methods (pass/return by value)
extension Vector3 {
    public static func negation(ofVector v: Vector3) -> Vector3 {
        var tempLeft = v
        return -tempLeft
    }
    
    public static func sum(ofVector u: Vector3, andVector v: Vector3) -> Vector3 {
        var tempLeft = u
        return tempLeft += v
    }
    
    public static func difference(ofVector u: Vector3, andVector v: Vector3) -> Vector3 {
        var tempLeft = u
        return tempLeft -= v
    }
    
    public static func product(ofVector v: Vector3, andScalar s: Double) -> Vector3 {
        var tempLeft = v
        return tempLeft *= s
    }
    
    public static func quotient(ofVector v: Vector3, andScalar s: Double) -> Vector3 {
        var tempLeft = v
        return tempLeft /= s
    }
    
    public static func dotProduct(ofVector u: Vector3, andVector v: Vector3) -> Double {
        var tempLeft = u
        return tempLeft *= v
    }
}
  
/// Operators as instance methods
extension Vector3 {
    public mutating func negate() -> Vector3 {
        return -self
    }
    
    public mutating func add(withVector v: Vector3) -> Vector3 {
        return self += v
    }
    
    public mutating func subtract(byVector v: Vector3) -> Vector3 {
        return self -= v
    }
    
    public mutating func multiply(byScalar s: Double) -> Vector3 {
        return self *= s
    }
    
    public mutating func divide(byScalar s: Double) -> Vector3 {
        return self /= s
    }
    
    public mutating func asDotProduct(withVector v: Vector3) -> Double {
        return self *= v
    }
}

/// Vector cross product - unique to Vector3
extension Vector3 {
    ///
    /// TODO: an operator for cross product. Maybe 'x' ?
    ///     public static func x= (u: inout Vector3, v: Vector3)
    ///     public static func x (u: Vector3, v: Vector3)
    ///     public static func crossProduct(u: Vector3, v: Vector3)
    ///     public mutating func asCrossProduct(v: Vector3)
    ///
    
    
    /// This static method should be an operator., like
    /// u x= v
    public static func crossProduct(ofVector u: inout Vector3,
                                    withVector v: Vector3) -> Vector3 {
        let c_x = (u.y * v.z) - (u.z * v.y)
        let c_y = (u.z * v.x) - (u.x * v.z)
        let c_z = (u.x * v.y) - (u.y * v.x)
        
        u.x = c_x
        u.y = c_y
        u.z = c_z
        
        return u
    }

    /// This static method should be an operator, like
    /// t = u x v
    public static func crossProduct(ofVector u: Vector3,
                                    withVector v: Vector3) -> Vector3 {
        var tempLeft = u
        return Vector3.crossProduct(ofVector: &tempLeft, withVector: v)
    }
    
    /// Then here, have a static func crossProduct(u: Vector3, v: Vector3), like the one above
    
    public mutating func asCrossProduct(withVector v: Vector3) -> Vector3 {
        self = Vector3.crossProduct(ofVector: self,
                                    withVector: v)
        return self
    }
    
    /// Finally, have a mutating func asCrossProduct(v: Vector3), like the one above
}

extension Vector3 : CustomStringConvertible {
    public var description: String {
        return "[\(x), \(y), \(z)]"
    }
}

extension Vector3 : Equatable {
    public static func == (_ lhs: Vector3, _ rhs: Vector3) -> Bool {
        return lhs.x.isEqual(to: rhs.x) 
            && lhs.y.isEqual(to: rhs.y) 
            && lhs.z.isEqual(to: rhs.z)
    }
}

extension Vector3 {
    public static let zeroVector = Vector3()
    public static let unitVector_i = Vector3(1.0, 0.0, 0.0)
    public static let unitVector_j = Vector3(0.0, 1.0, 0.0)
    public static let unitVector_k = Vector3(0.0, 0.0, 1.0)
}
