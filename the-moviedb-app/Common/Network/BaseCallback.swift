//
//  BaseCallback.swift
//  the-moviedb-app
//
//  Created by Alexandre Henrique on 2/22/20.
//  Copyright © 2020 Alexandre Henrique. All rights reserved.
//

import Foundation

struct BaseCallback<T> {
    private let status: TypedCallbackEnum
    private var responseSuccess: T?
    private var error: Any?
    
    private init(status: TypedCallbackEnum, error: Any? = nil) {
        self.status = status
        self.error  = error
    }
    
    private init(status: TypedCallbackEnum, responseSuccess: T) {
        self.status          = status
        self.responseSuccess = responseSuccess
    }
    
    public static func success(_ response: T) -> BaseCallback {
        return BaseCallback(status: TypedCallbackEnum.success, responseSuccess: response)
    }
    
    public static func failed(error: Any? = nil) -> BaseCallback {
        return BaseCallback(status: TypedCallbackEnum.failed, error: error)
    }
    
    public static func emptyData() -> BaseCallback {
        return BaseCallback(status: TypedCallbackEnum.onEmptyData)
    }
    
    public func onSuccess(_ response: (T) -> Void) {
        if status == TypedCallbackEnum.success {
            response(responseSuccess!)
        }
    }
    
    public func onFailed(_ response: (Any?) -> Void) {
        if status == TypedCallbackEnum.failed {
            response(error)
        }
    }
    
    public func onEmptyData(_ response: () -> Void) {
        if status == TypedCallbackEnum.onEmptyData {
            response()
        }
    }
}
