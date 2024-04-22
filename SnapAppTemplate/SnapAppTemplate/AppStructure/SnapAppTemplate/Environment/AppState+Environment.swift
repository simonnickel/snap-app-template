//
//  AppState+Environment.swift
//  SnapAppTemplate
//
//  Created by Simon Nickel on 19.09.23.
//

import SwiftUI


// MARK: - AppState

private struct AppStateBindingKey: EnvironmentKey {
	static let defaultValue: Binding<AppState> = .constant(AppState())
}

private struct AppStateKey: EnvironmentKey {
	static let defaultValue: AppState = AppState()
}

extension EnvironmentValues {
	
	/// It's a Binding to allow values to be changed from inside the view hierarchy.
	var appStateBinding: Binding<AppState> {
		get { self[AppStateBindingKey.self] }
		set { self[AppStateBindingKey.self] = newValue }
	}
	
	var appState: AppState {
		get { self[AppStateKey.self] }
		set { self[AppStateKey.self] = newValue }
	}
	
}
