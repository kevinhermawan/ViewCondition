import XCTest
@testable import ViewCondition
import SwiftUI
import ViewInspector

final class ViewConditionTests: XCTestCase {
    func testIfModifierTrue() throws {
        let view = Text("Original").if(true) { text in
            Text("Modified")
        }
        
        let text = try view.inspect().text().string()
        XCTAssertEqual(text, "Modified")
    }
    
    func testIfModifierFalse() throws {
        let view = Text("Original").if(false) { _ in
            Text("Modified")
        }
        
        let text = try view.inspect().text().string()
        XCTAssertEqual(text, "Original")
    }
    
    func testVisibleModifierTrue() throws {
        let view = Text("Visible").visible(if: true)
        
        let isHidden = try view.inspect().text().isHidden()
        XCTAssertFalse(isHidden)
    }
    
    func testVisibleModifierFalse() throws {
        let view = Text("Hidden").visible(if: false)
        
        let isHidden = try view.inspect().text().isHidden()
        XCTAssertTrue(isHidden)
    }
    
    func testHideModifierTrue() throws {
        let view = Text("Hidden").hide(if: true)
        
        let isHidden = try view.inspect().text().isHidden()
        XCTAssertTrue(isHidden)
    }
    
    func testHideModifierFalse() throws {
        let view = Text("Visible").hide(if: false)
        
        let isHidden = try view.inspect().text().isHidden()
        XCTAssertFalse(isHidden)
    }
}
