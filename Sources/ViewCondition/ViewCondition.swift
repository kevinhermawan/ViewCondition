//
//  ViewCondition.swift
//
//
//  Created by Kevin Hermawan on 02/12/23.
//

import Foundation
import SwiftUI

/// An extension to the `View` protocol providing conditional view modifiers.
public extension View {
    /// Conditionally applies a modifier to the view.
    ///
    /// This method is used to apply a custom modifier to a view if a specified condition
    /// is true. If the condition is met, the `content` closure is executed with `self`
    /// as its argument. Otherwise, the view remains unchanged.
    ///
    /// - Parameters:
    ///   - condition: A Boolean value determining the application of the modifier.
    ///   - content: A closure that takes the current view and returns a modified view.
    /// - Returns: The view, modified if the condition is true; otherwise, the original view.
    @ViewBuilder
    func `if`<Content: View>(_ condition: Bool, content: (Self) -> Content) -> some View {
        if condition {
            content(self)
        } else {
            self
        }
    }
    
    /// Applies a modifier to the view based on the operating system.
    ///
    /// This method allows for conditional modification of a view based on the operating system.
    ///
    /// - Parameters:
    ///   - os: The operating system to check against.
    ///   - content: A closure that modifies the view.
    /// - Returns: A modified view for the specified OS; otherwise, the original view.
    @ViewBuilder
    func `if`<Content: View>(os: VCOS, content: (Self) -> Content) -> some View {
        switch os {
        case .iOS:
#if os(iOS)
            content(self)
#else
            self
#endif
        case .macOS:
#if os(macOS)
            content(self)
#else
            self
#endif
        case .tvOS:
#if os(tvOS)
            content(self)
#else
            self
#endif
        case .visionOS:
#if os(visionOS)
            content(self)
#else
            self
#endif
        case .watchOS:
#if os(watchOS)
            content(self)
#else
            self
#endif
        }
    }
    
    /// Applies a modifier to the view based on the availability of a module.
    ///
    /// This method allows for conditional modification of a view based on whether a specific module can be imported.
    ///
    /// - Parameters:
    ///   - module: The module to check for import availability.
    ///   - content: A closure that modifies the view.
    /// - Returns: A modified view if the module can be imported; otherwise, the original view.
    @ViewBuilder
    func `if`(canImport module: VCModule, content: (Self) -> some View) -> some View {
        switch module {
        case .uiKit:
#if canImport(UIKit)
            content(self)
#else
            self
#endif
        case .appKit:
#if canImport(AppKit)
            content(self)
#else
            self
#endif
        case .watchKit:
#if canImport(WatchKit)
            content(self)
#else
            self
#endif
        case .tvUIKit:
#if canImport(TVUIKit)
            content(self)
#else
            self
#endif
        }
    }
    
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
    func visible(on os: VCOS) -> some View {
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
    func visible(ifCanImport module: VCModule) -> some View {
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
    func hide(on os: VCOS) -> some View {
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
    func hide(ifCanImport module: VCModule) -> some View {
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
}
