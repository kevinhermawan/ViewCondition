import SwiftUI

public extension View {
    @ViewBuilder
    func `if`<Content: View>(_ condition: Bool, content: (Self) -> Content) -> some View {
        if condition {
            content(self)
        } else {
            self
        }
    }
    
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
}
