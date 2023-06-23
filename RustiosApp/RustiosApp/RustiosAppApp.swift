//
//  RustiosAppApp.swift
//  RustiosApp
//
//  Created by Ryohei Kameyama on 2023/06/23.
//

import SwiftUI
import Rustios

@main
struct RustiosAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
            Text("\(add(2, 3))")
        }
    }
}
