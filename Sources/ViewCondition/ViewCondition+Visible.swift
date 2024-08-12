//
//  ViewCondition+Visible.swift
//  ViewCondition
//
//  Created by Kevin Hermawan on 8/13/24.
//

import Foundation
import SwiftUI

public extension View {
    /// Controls the view's visibility, with an option to remove it when not visible.
    ///
    /// This method conditionally displays the view. If the `condition` is false,
    /// the view is either made invisible or completely removed from the view hierarchy,
    /// based on the value of `removingIfInvisible`.
    ///
    /// - Parameters:
    ///   - condition: A Boolean value determining the view's visibility.
    ///   - removeCompletely: If true, removes the view when not visible; if false, hides it.
    /// - Returns: The original view, a hidden view, or an `EmptyView`, contingent upon the condition.
    @ViewBuilder
    func visible(if condition: Bool, removeCompletely: Bool = false) -> some View {
        if condition {
            self
        } else {
            if removeCompletely {
                EmptyView()
            } else {
                self.hidden()
            }
        }
    }
    
    /// Controls the view's visibility based on the operating system.
    ///
    /// This method conditionally displays the view depending on the operating system.
    ///
    /// - Parameters:
    ///   - os: The operating system to check against.
    /// - Returns: The view, either as is or as an `EmptyView`, based on the operating system.
    @ViewBuilder
    func visible(on os: OS) -> some View {
        switch os {
        case .iOS:
#if os(iOS)
            self
#else
            EmptyView()
#endif
        case .macOS:
#if os(macOS)
            self
#else
            EmptyView()
#endif
        case .tvOS:
#if os(tvOS)
            self
#else
            EmptyView()
#endif
        case .visionOS:
#if os(visionOS)
            self
#else
            EmptyView()
#endif
        case .watchOS:
#if os(watchOS)
            self
#else
            EmptyView()
#endif
        }
    }
    
    /// Controls the view's visibility based on the availability of a module.
    ///
    /// This method conditionally displays the view depending on whether a specific module can be imported.
    ///
    /// - Parameters:
    ///   - module: The module to check for import availability.
    /// - Returns: The view if the module can be imported; otherwise, an `EmptyView`.
    @ViewBuilder
    func visible(ifCanImport module: Module) -> some View {
        switch module {
        case .uiKit:
#if canImport(UIKit)
            self
#else
            EmptyView()
#endif
        case .appKit:
#if canImport(AppKit)
            self
#else
            EmptyView()
#endif
        case .watchKit:
#if canImport(WatchKit)
            self
#else
            EmptyView()
#endif
        case .tvUIKit:
#if canImport(TVUIKit)
            self
#else
            EmptyView()
#endif
        }
    }
    
    /// Controls the view's visibility based on multiple conditions.
    ///
    /// This method conditionally displays the view if all specified conditions are true.
    ///
    /// - Parameters:
    ///   - conditions: An array of Boolean values determining the view's visibility.
    ///   - removeCompletely: If true, removes the view when not visible; if false, hides it.
    /// - Returns: The original view, a hidden view, or an `EmptyView`, contingent upon the conditions.
    @ViewBuilder
    func visible(if conditions: [Bool], removeCompletely: Bool = false) -> some View {
        if conditions.allSatisfy({ $0 }) {
            self
        } else {
            if removeCompletely {
                EmptyView()
            } else {
                self.hidden()
            }
        }
    }
    
    /// Controls the view's visibility based on multiple operating systems.
    ///
    /// This method conditionally displays the view if any of the specified operating systems match.
    ///
    /// - Parameters:
    ///   - oses: An array of operating systems to check against.
    /// - Returns: The view if any of the specified OS conditions are met; otherwise, an `EmptyView`.
    @ViewBuilder
    func visible(on oses: [OS]) -> some View {
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
            self
        } else {
            EmptyView()
        }
    }
    
    /// Controls the view's visibility based on the availability of multiple modules.
    ///
    /// This method conditionally displays the view if any of the specified modules can be imported.
    ///
    /// - Parameters:
    ///   - modules: An array of modules to check for import availability.
    /// - Returns: The view if any of the specified modules can be imported; otherwise, an `EmptyView`.
    @ViewBuilder
    func visible(ifCanImport modules: [Module]) -> some View {
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
            self
        } else {
            EmptyView()
        }
    }
}
