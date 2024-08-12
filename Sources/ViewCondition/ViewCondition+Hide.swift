//
//  ViewCondition+Hide.swift
//  ViewCondition
//
//  Created by Kevin Hermawan on 8/13/24.
//

import Foundation
import SwiftUI

public extension View {
    /// Hides the view based on a condition, with an option to remove it when hidden.
    ///
    /// This method hides the view if the specified `condition` is true. Depending on
    /// `removingIfHidden`, the view is either hidden or completely removed from the view hierarchy.
    ///
    /// - Parameters:
    ///   - condition: A Boolean value determining if the view should be hidden.
    ///   - removeCompletely: Determines whether the view is removed (true) or just hidden (false) when the condition is met.
    /// - Returns: A hidden view, an `EmptyView`, or the original view, based on the condition.
    @ViewBuilder
    func hide(if condition: Bool, removeCompletely: Bool = false) -> some View {
        if condition {
            if removeCompletely {
                EmptyView()
            } else {
                self.hidden()
            }
        } else {
            self
        }
    }
    
    /// Hides the view based on the operating system.
    ///
    /// This method hides the view depending on the operating system.
    ///
    /// - Parameters:
    ///   - os: The operating system to check against.
    /// - Returns: A hidden view or the original view, contingent upon the operating system.
    @ViewBuilder
    func hide(on os: OS) -> some View {
        switch os {
        case .iOS:
#if os(iOS)
            EmptyView()
#else
            self
#endif
        case .macOS:
#if os(macOS)
            EmptyView()
#else
            self
#endif
        case .tvOS:
#if os(tvOS)
            EmptyView()
#else
            self
#endif
        case .visionOS:
#if os(visionOS)
            EmptyView()
#else
            self
#endif
        case .watchOS:
#if os(watchOS)
            EmptyView()
#else
            self
#endif
        }
    }
    
    /// Hides the view based on the availability of a module.
    ///
    /// This method hides the view depending on whether a specific module can be imported.
    ///
    /// - Parameters:
    ///   - module: The module to check for import availability.
    /// - Returns: A hidden view if the module can be imported; otherwise, the original view.
    @ViewBuilder
    func hide(ifCanImport module: Module) -> some View {
        switch module {
        case .uiKit:
#if canImport(UIKit)
            EmptyView()
#else
            self
#endif
        case .appKit:
#if canImport(AppKit)
            EmptyView()
#else
            self
#endif
        case .watchKit:
#if canImport(WatchKit)
            EmptyView()
#else
            self
#endif
        case .tvUIKit:
#if canImport(TVUIKit)
            EmptyView()
#else
            self
#endif
        }
    }
    
    /// Hides the view based on multiple conditions.
    ///
    /// This method hides the view if all specified conditions are true.
    ///
    /// - Parameters:
    ///   - conditions: An array of Boolean values determining if the view should be hidden.
    ///   - removeCompletely: Determines whether the view is removed (true) or just hidden (false) when the conditions are met.
    /// - Returns: A hidden view, an `EmptyView`, or the original view, based on the conditions.
    @ViewBuilder
    func hide(if conditions: [Bool], removeCompletely: Bool = false) -> some View {
        if conditions.allSatisfy({ $0 }) {
            if removeCompletely {
                EmptyView()
            } else {
                self.hidden()
            }
        } else {
            self
        }
    }
    
    /// Hides the view based on multiple operating systems.
    ///
    /// This method hides the view if any of the specified operating systems match.
    ///
    /// - Parameters:
    ///   - oses: An array of operating systems to check against.
    /// - Returns: A hidden view if any of the specified OS conditions are met; otherwise, the original view.
    @ViewBuilder
    func hide(on oses: [OS]) -> some View {
        if oses.contains(where: { os in
            switch os {
            case .iOS:
#if os(iOS)
                return true
#else
                return false
#endif
            case .macOS:
#if os(macOS)
                return true
#else
                return false
#endif
            case .tvOS:
#if os(tvOS)
                return true
#else
                return false
#endif
            case .visionOS:
#if os(visionOS)
                return true
#else
                return false
#endif
            case .watchOS:
#if os(watchOS)
                return true
#else
                return false
#endif
            }
        }) {
            EmptyView()
        } else {
            self
        }
    }
    
    /// Hides the view based on the availability of multiple modules.
    ///
    /// This method hides the view if any of the specified modules can be imported.
    ///
    /// - Parameters:
    ///   - modules: An array of modules to check for import availability.
    /// - Returns: A hidden view if any of the specified modules can be imported; otherwise, the original view.
    @ViewBuilder
    func hide(ifCanImport modules: [Module]) -> some View {
        if modules.contains(where: { module in
            switch module {
            case .uiKit:
#if canImport(UIKit)
                return true
#else
                return false
#endif
            case .appKit:
#if canImport(AppKit)
                return true
#else
                return false
#endif
            case .watchKit:
#if canImport(WatchKit)
                return true
#else
                return false
#endif
            case .tvUIKit:
#if canImport(TVUIKit)
                return true
#else
                return false
#endif
            }
        }) {
            EmptyView()
        } else {
            self
        }
    }
}
