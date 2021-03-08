import XCTest
@testable import SwiftInKotlinStyle

class AObject: NSObject {
    var name: String = ""
}

class AClass: Appliable, Equatable {
    var name: String = ""
    
    static func == (lhs: AClass, rhs: AClass) -> Bool {
        lhs.name == rhs.name
    }
}

struct AStruct: Appliable, Equatable {
    var name: String = ""
}

final class ScopeFunctionTests: XCTestCase {
    
    func test_apply_NSObject() throws {
        let obj = AObject()
        
        let appliedObj = obj.apply {
            $0.name = "new name"
        }
        
        XCTAssertEqual(obj.name, "new name")
        XCTAssertTrue(obj === appliedObj)
    }
    
    func test_apply_class() throws {
        var instance = AClass()
        instance.apply {
            $0.name = "new name"
        }
        XCTAssertEqual(instance.name, "new name")
        
        
        let appliedInstance = instance.apply {
            $0.name = "another name"
        }
        XCTAssertEqual(instance.name, "another name")
        XCTAssertTrue(instance == appliedInstance)
    }
    
    func test_apply_struct() throws {
        var aStruct = AStruct()
        aStruct.apply {
            $0.name = "new name"
        }
        XCTAssertEqual(aStruct.name, "new name")
        
        
        let appliedStruct = aStruct.apply {
            $0.name = "another name"
        }
        XCTAssertEqual(aStruct.name, "another name")
        XCTAssertTrue(aStruct == appliedStruct)
    }
    
    func test_let() throws {
        var int: Int? = 1
        int.let { XCTAssertEqual($0, 1) }
        
        let string = int.let { "\($0)" }
        XCTAssertEqual(string, "1")
        
        
        let double = int.let { Double($0+1)*10.0 }
        XCTAssertEqual(double, 20.0)
        XCTAssertEqual(Mirror(reflecting: double as Any).description, "Mirror for Optional<Double>")
        
        int = nil
        int.let { _ in
            XCTFail("if nil, never call")
        }
    }
    
    static var allTests = [
        ("test_apply_NSObject", test_apply_NSObject),
        ("test_apply_class", test_apply_class),
        ("test_apply_struct", test_apply_struct),
        
        ("test_let", test_let),
    ]
}
