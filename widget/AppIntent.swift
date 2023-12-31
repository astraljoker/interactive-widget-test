//
//  AppIntent.swift
//  widget
//
//  Created by byunghoon on 2023-12-30.
//

import WidgetKit
import AppIntents

struct ConfigurationAppIntent: WidgetConfigurationIntent {
    static var title: LocalizedStringResource = "Configuration"
    static var description = IntentDescription("This is an example widget.")

    // An example configurable parameter.
    @Parameter(title: "Favorite Emoji", default: "😃")
    var favoriteEmoji: String
}


struct CountIntent: AppIntent {
    static var title: LocalizedStringResource = "Count"
    static var description = IntentDescription("Change Count")

    
    @Parameter(title: "Value") // 이 코드를 써야 값을 넘길 수 있음
    var change: Int
    
    init(change: Int) {
        self.change = change
    }
    
    init() {
        self.change = 0
    }
    
    func perform() async throws -> some IntentResult {
        let result = SharedData.it.changeCount(by: self.change)
        return .result()
    }
}
