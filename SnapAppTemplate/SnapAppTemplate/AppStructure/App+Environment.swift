//
//  App+Environment.swift
//  SnapAppTemplate
//
//  Created by Simon Nickel on 22.04.24.
//

import SwiftUI

/*
// MARK: - MyType

private struct MyTypeKey: EnvironmentKey {
	static let defaultValue: MyType = MyType()
}

extension EnvironmentValues {

	var myType: MyType {
		get { self[MyTypeKey.self] }
		set { self[MyTypeKey.self] = newValue }
	}
	
}
*/


// MARK: - Data Source

private struct DataSourceKey: EnvironmentKey {
	
	static var defaultValue: DataSource {
		// TODO concurrency: Instead of a `static let` this needs to be a computed property. Just applying @MainActor does not fullfill requirements for `EnvironmentKey` implementation.
		// Not sure if this might be something that is solved in a future version of Swift or SwiftUI.EnvironmentKey.
		// Static property 'defaultValue' is not concurrency-safe because it is not either conforming to 'Sendable' or isolated to a global actor; this is an error in Swift 6
		// Main actor-isolated static property 'defaultValue' cannot be used to satisfy nonisolated protocol requirement
		DataSource()
	}
	
}

extension EnvironmentValues {
	
	var dataSource: DataSource {
		get { self[DataSourceKey.self] }
		set { self[DataSourceKey.self] = newValue }
	}
	
}
