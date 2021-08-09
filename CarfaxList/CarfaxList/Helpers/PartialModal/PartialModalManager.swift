//
//  PartialModalManager.swift
//  CarfaxList
//
//  Created by Khatib Mahad H. on 8/8/21.
//

import Combine
import SwiftUI


public class PartialModalManager: ObservableObject {

    /// Published var to present or hide the partial modal
    @Published var isPresented: Bool = false {
        didSet {
            if !isPresented {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.35) { [weak self] in
                    self?.content = AnyView(EmptyView())
                    self?.onDismiss = nil
                }
            }
        }
    }
    @Published private(set) var content: AnyView
    private(set) var onDismiss: (() -> Void)?

    public var defaultAnimation: Animation = .interpolatingSpring(stiffness: 300.0, damping: 30.0, initialVelocity: 10.0)

    public init() {
        self.content = AnyView(EmptyView())
    }

    
    public func showPartialModal<T>(_ onDismiss: (() -> Void)? = nil, @ViewBuilder content: @escaping () -> T) where T: View {
        guard !isPresented else {
            withAnimation(defaultAnimation) {
                updatePartialModal(
                    content: {
                        // do not animate the content, just the partial modal
                        withAnimation(nil) {
                            content()
                        }
                    },
                    onDismiss: onDismiss)
            }
            return
        }

        self.content = AnyView(content())
        self.onDismiss = onDismiss
        DispatchQueue.main.async {
            withAnimation(self.defaultAnimation) {
                self.isPresented = true
            }
        }
    }

    
    public func updatePartialModal<T>(isPresented: Bool? = nil, content: (() -> T)? = nil, onDismiss: (() -> Void)? = nil) where T: View {
        if let content = content {
            self.content = AnyView(content())
        }
        if let onDismiss = onDismiss {
            self.onDismiss = onDismiss
        }
        if let isPresented = isPresented {
            withAnimation(defaultAnimation) {
                self.isPresented = isPresented
            }
        }
    }

    public func closePartialModal() {
        withAnimation(defaultAnimation) {
            self.isPresented = false
        }
        self.onDismiss?()
    }
}
