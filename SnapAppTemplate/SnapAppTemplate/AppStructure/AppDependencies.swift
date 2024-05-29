//
//  AppDependencies.swift
//  SnapAppTemplate
//
//  Created by Simon Nickel on 04.10.23.
//

import SwiftUI
import Observation
import SnapTemplateShared

/// Definition and application of dependenies to use in the app.
@Observable class AppDependencies: DependencyContainer {
	
	private let templateDependencies: TemplateDependencies
	private var appState: AppState
	
	init(templateDependencies: TemplateDependencies, appState: AppState = AppState()) {
		
		self.templateDependencies = templateDependencies
		self.appState = appState
		
		self.dataSource = DataSource()
		
	}
	
	private var dataSource: DataSource
	
	
	// MARK: - Apply
	
	/// Apply dependencies defined in project. See `TemplateDependencies` for template defined dependencies.
	@MainActor
	func apply<Content: View>(on content: Content) -> any View {
		
		return content
			.environment(\.appState, appState)
			.environment(\.appStateBinding, Binding(get: {
				self.appState
			}, set: { newValue in
				self.appState = newValue
			}))
			.environment(\.destinationFactory, self)
			.environment(\.dataSource, dataSource)
		
	}
	
}
