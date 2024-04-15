//
//  Dependencies+Environment.swift
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


// MARK: - Data Source

private struct DataSourceKey: EnvironmentKey {
	
	static var defaultValue: DataSource {
		// TODO concurrency: Instead of a `static let` this needs to be a computed property wrapped in MainActor. Just applying @MainActor does not fullfill requirements for `EnvironmentKey` implementation.
		// Not sure if this might be something that is solved in a future version of Swift or SwiftUI.EnvironmentKey.
		// Static property 'defaultValue' is not concurrency-safe because it is not either conforming to 'Sendable' or isolated to a global actor; this is an error in Swift 6
		// Main actor-isolated static property 'defaultValue' cannot be used to satisfy nonisolated protocol requirement
		MainActor.assumeIsolated {
			DataSource()
		}
	}
	
}

extension EnvironmentValues {
	
	var dataSource: DataSource {
		get { self[DataSourceKey.self] }
		set { self[DataSourceKey.self] = newValue }
	}
	
}
