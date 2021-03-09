import Foundation

@inline(__always) public func `repeat`(times: Int, action: (Int) -> ()) {
    for index in 0..<times {
        action(index)
    }
}

public extension Int {
    @inline(__always) func `repeat`(action: (Int) -> ()) {
        SwiftInKotlinStyle.`repeat`(times: self, action: action)
    }
}
