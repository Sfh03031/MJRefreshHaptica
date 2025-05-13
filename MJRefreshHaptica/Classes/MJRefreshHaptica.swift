//
//  MJRefreshHaptica.swift
//  MJRefreshHaptica_Example
//
//  Created by sfh on 2025/5/13.
//  Copyright © 2025 CocoaPods. All rights reserved.
//

#if canImport(UIKit)

import UIKit
import MJRefresh
import Haptica

@objcMembers
public class MJRefreshHaptica: NSObject {

    public static let `default` = MJRefreshHaptica()
    
    public var style: HapticFeedbackStyle { self.hapticStyle }
    
    private var hapticStyle: HapticFeedbackStyle = .light
    private var exchanged: Bool = false
    
    
    /// whether open haptica feed back or not
    /// - Parameters:
    ///   - enable: default = `false`
    ///   - style: HapticFeedbackStyle, default = `light`
    public func open(_ enable: Bool = false, style: HapticFeedbackStyle = .light) {
        self.hapticStyle = style
        if enable {
            exchange()
        }
    }
    
}

extension MJRefreshHaptica {
    
    func exchange() {
        if exchanged { return }
        exchanged = true
        exchangeMethod(MJRefreshComponent.self,
                       selector: #selector(setter: MJRefreshComponent.state),
                       replace: #selector(MJRefreshComponent.haptica_setState(_:)))
    }
    
    /// exchange methods
    /// - Parameters:
    ///   - classType: AnyClass
    ///   - selector: origin method
    ///   - replace: replace method
    func exchangeMethod(_ classType: AnyClass, selector: Selector, replace: Selector) {
        guard let originM = class_getInstanceMethod(classType, selector) else {
            fatalError("get origin instance method failed")
        }
        guard let replaceM = class_getInstanceMethod(classType, replace) else {
            fatalError("get replace instance method failed")
        }
        let already = class_addMethod(classType, selector, method_getImplementation(replaceM), method_getTypeEncoding(replaceM))
        if already {
            class_replaceMethod(classType, replace, method_getImplementation(originM), method_getTypeEncoding(originM))
        } else {
            method_exchangeImplementations(originM, replaceM)
        }
    }
    
}

extension MJRefreshComponent {
    
    @objc func haptica_setState(_ state: MJRefreshState) {
        haptica_setState(state)
        if state == .pulling {
            Haptic.impact(MJRefreshHaptica.default.style).generate()
        }
    }
    
}

#endif
