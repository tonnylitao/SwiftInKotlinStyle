import Foundation

public protocol Appliable {}

extension NSObject: Appliable {}

public extension Appliable {
    typealias Decorator1 = (inout Self) -> Void

    @discardableResult
    mutating func apply(_ decorators: Decorator1...) -> Self {

        decorators.forEach {
            $0(&self)
        }
        
        return self
    }
}

public extension Appliable where Self: NSObject {
    typealias Decorator = (Self) -> Void

    @discardableResult
    func apply(_ decorators: Decorator...) -> Self {

        decorators.forEach {
            $0(self)
        }

        return self
    }
}
