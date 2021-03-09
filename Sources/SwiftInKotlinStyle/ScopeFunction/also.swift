import Foundation

public protocol Alsoable {}

public extension Alsoable {
    typealias MutatingDecorator = (inout Self) -> Void

    @discardableResult
    @inline(__always) mutating func also(_ decorators: MutatingDecorator...) -> Self {

        decorators.forEach {
            $0(&self)
        }
        
        return self
    }
}

extension NSObject: Alsoable {}

public extension Alsoable where Self: NSObject {
    typealias Decorator = (Self) -> Void

    @discardableResult
    @inline(__always) func also(_ decorators: Decorator...) -> Self {

        decorators.forEach {
            $0(self)
        }

        return self
    }
}
