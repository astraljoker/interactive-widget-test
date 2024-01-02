//
//  ContentView.swift
//  interactive-widget-test
//
//  Created by byunghoon on 2023-12-30.
//

import SwiftUI
import WidgetKit

struct ContentView: View {
    @AppStorage(SharedData.countKey) var count:Int = 0
    @AppStorage(SharedData.stringKey) var str:String = ""
    
    var body: some View {
        VStack {
            Text("\(count)")
            
            HStack {
                Button(action: {
                    count -= 1
                    WidgetCenter.shared.reloadAllTimelines()
                }, label: {
                    Text("-1")
                })
                Button(action: {
                    count += 1
                    WidgetCenter.shared.reloadAllTimelines()
                }, label: {
                    Text("+1")
                })
            }
            
            Text("\(str)")
            
            HStack {
                Button(action: {
                    str = "A"
                    WidgetCenter.shared.reloadAllTimelines()
                }, label: {
                    Text("A")
                })
                Button(action: {
                    str = "B"
                    WidgetCenter.shared.reloadAllTimelines()
                }, label: {
                    Text("B")
                })
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
