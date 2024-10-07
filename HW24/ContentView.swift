//
//  ContentView.swift
//  HW24
//
//  Created by Максим Громов on 23.09.2024.
//

import SwiftUI

struct ContentView: View {
    var cities: [City] = [City(name: "Moscow", timeZone: 3), City(name: "Kazan", timeZone: 4), City(name: "New York", timeZone: -4), City(name: "London", timeZone: 0), City(name: "Tokyo", timeZone: 9)]
    @State private var currentDate = Date()
    var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var body: some View {
        List(cities){ city in
            HStack{
                VStack(alignment: .leading){
                    Text(city.name).font(.title2)
                    Text("\(city.timeZone >= 0 ? "+" : "")\(city.timeZone)").font(.subheadline)
                }
                Spacer()
                let time = currentDate.addingTimeInterval(TimeInterval(city.timeZone) * 3600).addingTimeInterval(-3 * 3600)
                Text(time.formatted(date: .omitted, time: .standard)).font(.title)
                    .onReceive(timer, perform: { _ in
                        currentDate = Date()
                    })
            }
            
        }
    }
}

#Preview {
    ContentView()
}
