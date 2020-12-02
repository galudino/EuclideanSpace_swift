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

public extension Vector2 {
    static let zeroVector = Vector2()
    
    static let unitVector_i = Vector2(1.0, 0.0)
    static let unitVector_j = Vector2(0.0, 1.0)
}

/// Properties
public extension Vector2 {
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
        set { m_impl[1] = newValue}
    }
    
    var array: [Double] {
        get { return m_impl } 
        set { m_impl = newValue }
    }

    var magnitude: Double {
        return computeEuclideanDistance(
            srcCoords: Vector2.zeroVector.array,
            dstCoords: m_impl)
    }
    
    var angleWithRespectToXAxis: Double {
        return angle(withRespectTo: Vector2.unitVector_i)
    }
    
    var angleWithRespectToYAxis: Double {
        return angle(withRespectTo: Vector2.unitVector_j)
    }
}

/// Methods
public extension Vector2 {
    mutating func reset() {
        x = 0.0
        y = 0.0
    }
    
    func angle(withRespectTo v: Vector2) -> Double {
        return computeDotProduct(srcComponent: m_impl,
                                 dstComponent: v.array)
               / (magnitude * v.magnitude)
    }
}

/// Operators (inout)
public extension Vector2 {
    static prefix func - (v: inout Vector2) -> Vector2 {
        v.x = -v.x
        v.y = -v.y
        return v
    }

    static func += (lhs: inout Vector2, rhs: Vector2) -> Vector2 {
        lhs.x += rhs.x
        lhs.y += rhs.y
        return lhs
    }

    static func -= (lhs: inout Vector2, rhs: Vector2) -> Vector2 {
        lhs.x -= rhs.x
        lhs.y -= rhs.y
        return lhs
    }
    
    static func *= (v: inout Vector2, scalar: Double) -> Vector2 {
        v.x *= scalar
        v.y *= scalar
        return v
    }
    
    static func *= (lhs: inout Vector2, rhs: Vector2) -> Double {
        return computeDotProduct(srcComponent: lhs.array, dstComponent: rhs.array)
    }
    
    static func /= (v: inout Vector2, scalar: Double) -> Vector2 {
        v.x /= scalar
        v.y /= scalar
        return v
    }
}

/// Operators (pass/return by value)
public extension Vector2 {
    static func + (lhs: Vector2, rhs: Vector2) -> Vector2 {
        var tempLeft = lhs
        return tempLeft += rhs
    }
    
    static func - (lhs: Vector2, rhs: Vector2) -> Vector2 {
        var tempLeft = lhs
        return tempLeft -= rhs
    }

    
    static func * (v: Vector2, scalar: Double) -> Vector2 {
        var tempLeft = v
        return tempLeft *= scalar
    }
    
    static func * (lhs: Vector2, rhs: Vector2) -> Double {
        var tempLeft = lhs
        return tempLeft *= rhs
    }
    
    static func / (v: Vector2, scalar: Double) -> Vector2 {
        var tempLeft = v
        return tempLeft /= scalar
    }
}

/// Operators as static methods (pass/return by value)
public extension Vector2 {
    static func negation(ofVector v: Vector2) -> Vector2 {
        var tempLeft = v
        return -tempLeft
    }
    
    static func sum(ofVector u: Vector2, andVector v: Vector2) -> Vector2 {
        var tempLeft = u
        return tempLeft += v
    }
    
    static func difference(ofVector u: Vector2, andVector v: Vector2) -> Vector2 {
        var tempLeft = u
        return tempLeft -= v
    }
    
    static func product(ofVector v: Vector2, andScalar s: Double) -> Vector2 {
        var tempLeft = v
        return tempLeft *= s
    }
    
    static func quotient(ofVector v: Vector2, andScalar s: Double) -> Vector2 {
        var tempLeft = v
        return tempLeft /= s
    }
    
    static func dotProduct(ofVector u: Vector2, andVector v: Vector2) -> Double {
        var tempLeft = u
        return tempLeft *= v
    }
}
 
/// Operators as instance methods
public extension Vector2 {
    mutating func negate() -> Vector2 {
        return -self
    }
    
    mutating func add(withVector v: Vector2) -> Vector2 {
        return self += v
    }
    
    mutating func subtract(byVector v: Vector2) -> Vector2 {
        return self -= v
    }

    mutating func multiply(byScalar s: Double) -> Vector2 {
        return self *= s
    }
    
    mutating func divide(byScalar s: Double) -> Vector2 {
        return self /= s
    }
    
    mutating func asDotProduct(withVector v: Vector2) -> Double {
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
