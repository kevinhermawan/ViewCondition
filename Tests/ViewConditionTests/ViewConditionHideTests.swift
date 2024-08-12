//
//  ViewConditionHideTests.swift
//  ViewCondition
//
//  Created by Kevin Hermawan on 8/13/24.
//

import XCTest
@testable import ViewCondition
import SwiftUI
import ViewInspector

final class ViewExtensionHideTests: XCTestCase {
    func testHideModifierWithBooleanCondition() throws {
        let view = Text("Test")
            .hide(if: true)
        
        let text = try view.inspect().find(ViewType.Text.self)
        XCTAssertTrue(text.isHidden())
        
        let view2 = Text("Test")
            .hide(if: false)
        
        let text2 = try view2.inspect().find(ViewType.Text.self)
        XCTAssertFalse(text2.isHidden())
    }
    
    func testHideModifierWithBooleanConditionAndRemoveCompletely() throws {
        let view = Text("Test")
            .hide(if: true, removeCompletely: true)
        
        XCTAssertThrowsError(try view.inspect().find(ViewType.Text.self))
        XCTAssertNoThrow(try view.inspect().emptyView())
    }
    
    func testHideModifierWithOS() throws {
        let view = Text("Test")
            .hide(on: .iOS)
        
#if os(iOS)
        XCTAssertThrowsError(try view.inspect().find(ViewType.Text.self))
        XCTAssertNoThrow(try view.inspect().emptyView())
#else
        XCTAssertNoThrow(try view.inspect().find(ViewType.Text.self))
#endif
    }
    
    func testHideModifierWithCanImport() throws {
        let view = Text("Test")
            .hide(ifCanImport: .uiKit)
        
#if canImport(UIKit)
        XCTAssertThrowsError(try view.inspect().find(ViewType.Text.self))
        XCTAssertNoThrow(try view.inspect().emptyView())
#else
        XCTAssertNoThrow(try view.inspect().find(ViewType.Text.self))
#endif
    }
    
    func testHideModifierWithMultipleConditions() throws {
        let view = Text("Test")
            .hide(if: [true, true, true])
        
        let text = try view.inspect().find(ViewType.Text.self)
        XCTAssertTrue(text.isHidden())
        
        let view2 = Text("Test")
            .hide(if: [true, false, true])
        
        let text2 = try view2.inspect().find(ViewType.Text.self)
        XCTAssertFalse(text2.isHidden())
    }
    
    func testHideModifierWithMultipleOS() throws {
        let view = Text("Test")
            .hide(on: [.iOS, .macOS])
        
#if os(iOS) || os(macOS)
        XCTAssertThrowsError(try view.inspect().find(ViewType.Text.self))
        XCTAssertNoThrow(try view.inspect().emptyView())
#else
        XCTAssertNoThrow(try view.inspect().find(ViewType.Text.self))
#endif
    }
    
    func testHideModifierWithMultipleCanImport() throws {
        let view = Text("Test")
            .hide(ifCanImport: [.uiKit, .appKit])
        
#if canImport(UIKit) || canImport(AppKit)
        XCTAssertThrowsError(try view.inspect().find(ViewType.Text.self))
        XCTAssertNoThrow(try view.inspect().emptyView())
#else
        XCTAssertNoThrow(try view.inspect().find(ViewType.Text.self))
#endif
    }
}
