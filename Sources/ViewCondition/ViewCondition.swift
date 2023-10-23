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
    func visible(if condition: Bool) -> some View {
        if condition {
            self
        } else {
            self.hidden()
        }
    }
    
    @ViewBuilder
    func hide(if condition: Bool) -> some View {
        if condition {
            self.hidden()
        } else {
            self
        }
    }
}
