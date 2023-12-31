//
//  SharedData.swift
//  interactive-widget-test
//
//  Created by byunghoon on 2023-12-31.
//

import Foundation

class SharedData: ObservableObject {
    static let it = SharedData()

    static let suiteName = "group.test"
    static let countKey = "count"

    @Published var count: Int = 0

    private init() {
        self.count = getCount()
    }

    func getCount() -> Int {
        if let store = UserDefaults(suiteName: SharedData.suiteName) {
            return store.integer(forKey: SharedData.countKey)
        } else {
            return 0
        }
    }

    func changeCount(by change: Int) {
        guard let store = UserDefaults(suiteName: SharedData.suiteName) else {
            return
        }

        self.count = store.integer(forKey: SharedData.countKey) + change
        store.set(self.count, forKey: SharedData.countKey)
    }
}
