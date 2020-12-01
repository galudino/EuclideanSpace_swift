///
///  Vector2.swift
///  EuclideanSpace
///
///  Created by Gemuele Aludino on 11/30/20.
///

/// TODO: Documentation

public struct Vector2 {
    private var m_impl: [Double] = [0.0, 0.0]
    
    public init() { }
    
    public init(_ x: Double, _ y: Double) {
        self.x = x
        self.y = y
    }
    
    public init(src: Point2, dst: Point2) {
        x = dst.x - src.x
        y = dst.y - src.y
    }
    
    public init(_ arr: [Double]) {
        x = arr[0]
        y = arr[1]
    }
    
    public init(_ src: [Double], _ dst: [Double]) {
        x = dst[0] - src[0]
        y = dst[1] - src[1]
    }
    
    public init(otherVector v: Vector2) {
        array = v.array
    }
}

/// Properties
extension Vector2 {
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
        set { m_impl[1] = newValue}
    }
    
    public var array: [Double] {
        get { return m_impl } 
        set { m_impl = newValue }
    }

    public var magnitude: Double {
        return computeEuclideanDistance(
            srcCoords: Vector2.Constants.zeroVector.array,
            dstCoords: m_impl)
    }

}

/// Methods
extension Vector2 {
    public mutating func reset() { 
        x = 0.0
        y = 0.0
    }
    
    public func angle(withRespectTo v: Vector2) -> Double {
        return computeDotProduct(srcComponent: m_impl, dstComponent: v.array)
            / (magnitude * v.magnitude)
    }
}

/// Operators (inout)
extension Vector2 {
    public static prefix func - (v: inout Vector2) -> Vector2 {
        v.x = -v.x
        v.y = -v.y
        return v
    }

    public static func += (lhs: inout Vector2, rhs: Vector2) -> Vector2 {
        lhs.x += rhs.x
        lhs.y += rhs.y
        return lhs
    }

    public static func -= (lhs: inout Vector2, rhs: Vector2) -> Vector2 {
        lhs.x -= rhs.x
        lhs.y -= rhs.y
        return lhs
    }
    
    public static func *= (v: inout Vector2, scalar: Double) -> Vector2 {
        v.x *= scalar
        v.y *= scalar
        return v
    }
    
    public static func *= (lhs: inout Vector2, rhs: Vector2) -> Double {
        return computeDotProduct(srcComponent: lhs.array, dstComponent: rhs.array)
    }
    
    public static func /= (v: inout Vector2, scalar: Double) -> Vector2 {
        v.x /= scalar
        v.y /= scalar
        return v
    }
}

/// Operators (pass/return by value)
extension Vector2 {
    public static func + (lhs: Vector2, rhs: Vector2) -> Vector2 {
        var tempLeft = lhs
        return tempLeft += rhs
    }
    
    public static func - (lhs: Vector2, rhs: Vector2) -> Vector2 {
        var tempLeft = lhs
        return tempLeft -= rhs
    }

    
    public static func * (v: Vector2, scalar: Double) -> Vector2 {
        var tempLeft = v
        return tempLeft *= scalar
    }
    
    public static func * (lhs: Vector2, rhs: Vector2) -> Double {
        var tempLeft = lhs
        return tempLeft *= rhs
    }
    
    public static func / (v: Vector2, scalar: Double) -> Vector2 {
        var tempLeft = v
        return tempLeft /= scalar
    }
}

/// Operators as static methods (pass/return by value)
extension Vector2 {
    public static func negation(ofVector v: Vector2) -> Vector2 {
        var tempLeft = v
        return -tempLeft
    }
    
    public static func sum(ofVector u: Vector2, andVector v: Vector2) -> Vector2 {
        var tempLeft = u
        return tempLeft += v
    }
    
    public static func difference(ofVector u: Vector2, andVector v: Vector2) -> Vector2 {
        var tempLeft = u
        return tempLeft -= v
    }
    
    public static func product(ofVector v: Vector2, andScalar s: Double) -> Vector2 {
        var tempLeft = v
        return tempLeft *= s
    }
    
    public static func quotient(ofVector v: Vector2, andScalar s: Double) -> Vector2 {
        var tempLeft = v
        return tempLeft /= s
    }
    
    public static func dotProduct(ofVector u: Vector2, andVector v: Vector2) -> Double {
        var tempLeft = u
        return tempLeft *= v
    }
}
 
/// Operators as instance methods
extension Vector2 {
    public mutating func negate() -> Vector2 {
        return -self
    }
    
    public mutating func add(withVector v: Vector2) -> Vector2 {
        return self += v
    }
    
    public mutating func subtract(byVector v: Vector2) -> Vector2 {
        return self -= v
    }

    public mutating func multiply(byScalar s: Double) -> Vector2 {
        return self *= s
    }
    
    public mutating func divide(byScalar s: Double) -> Vector2 {
        return self /= s
    }
    
    public mutating func asDotProduct(withVector v: Vector2) -> Double {
        return self *= v
    }
}

extension Vector2 : CustomStringConvertible {
    public var description: String {
        return "[\(x), \(y)]"
    }
}

extension Vector2 : Equatable {
    public static func == (_ lhs: Vector2, _ rhs: Vector2) -> Bool {
        return lhs.x.isEqual(to: rhs.x) 
            && lhs.y.isEqual(to: rhs.y)
    }
}

extension Vector2 {
    enum Constants {
        static let zeroVector = Vector2()
        static let unitVector_i = Vector2(1.0, 0.0)
        static let unitVector_j = Vector2(0.0, 1.0)
    }
}
