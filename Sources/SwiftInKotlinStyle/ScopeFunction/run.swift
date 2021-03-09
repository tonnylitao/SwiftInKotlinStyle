import Foundation

@inline(__always) public func run<R>(block: () -> R) -> R {
    return block()
}
