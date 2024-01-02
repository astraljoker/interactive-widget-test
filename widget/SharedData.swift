//
//  SharedData.swift
//  interactive-widget-test
//
//  Created by byunghoon on 2023-12-31.
//

import Foundation

class SharedData: ObservableObject {
    static let suiteName = "group.test"
    
    static let countKey = "count"
    static let stringKey = "alphabet"
    
    
    static let it = SharedData()
    
    @Published var count: Int = 0
    @Published var strTest: String = ""
    
    private init() {
        self.count = Self.getValue(forKey: Self.countKey, defaultValue: 0)
        self.strTest = Self.getValue(forKey: Self.stringKey, defaultValue: "")
    }
    
    private static func getValue<T>(forKey key: String, defaultValue: T) -> T {
        guard let store = UserDefaults(suiteName: suiteName) else { return defaultValue }
        
        if let value = store.value(forKey: key) as? T {
            return value
        }
        
        return defaultValue
    }
    
    private static func setValue<T>(forKey key: String, value: T) {
        guard let store = UserDefaults(suiteName: suiteName) else { return }
        store.set(value, forKey: key)
    }
    
    func changeCount(by change: Int) {
        count += change
        Self.setValue(forKey: Self.countKey, value: count)
    }
    
    func setAlphabet(to newValue: String) {
        strTest = newValue
        Self.setValue(forKey: Self.stringKey, value: strTest)
    }
    
    func getCount() -> Int {
        return Self.getValue(forKey: SharedData.countKey, defaultValue: 0)
    }
    
    func getString() -> String {
        return Self.getValue(forKey: Self.stringKey, defaultValue: "")
    }
}
