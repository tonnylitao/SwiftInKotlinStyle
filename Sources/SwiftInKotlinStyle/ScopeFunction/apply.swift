import Foundation

protocol Appliable {}

extension NSObject: Appliable {}

extension Appliable {
    typealias Decorator1 = (inout Self) -> Void

    @discardableResult
    mutating func apply(_ decorators: Decorator1...) -> Self {

        decorators.forEach {
            $0(&self)
        }
        
        return self
    }
}

extension Appliable where Self: NSObject {
    typealias Decorator = (Self) -> Void

    @discardableResult
    func apply(_ decorators: Decorator...) -> Self {

        decorators.forEach {
            $0(self)
        }

        return self
    }
}
