//
//  DependencyContainer.swift
//  SnapAppTemplate
//
//  Created by Simon Nickel on 03.09.23.
//

import SwiftUI
import SnapTheme
import SnapTemplateShared

/// The `DependencyContainer` applies dependencies on the `Content`.
struct DependencyContainer<Content: View>: View {
	
	private let dependencies: AppDependencies
	private let templateDependencies: TemplateDependencies

	@ViewBuilder private let content: () -> Content
	
	/// The `DependencyContainer` applies dependencies on the `Content`.
	/// - Parameters:
	///   - dependencies: `AppDependencies` should be owned outside of the View.
	///   - dependenciesTemplate: `TemplateDependencies` should be owned outside of the View.
	init(dependencies: AppDependencies, dependenciesTemplate: TemplateDependencies, @ViewBuilder content: @escaping () -> Content) {
		self.dependencies = dependencies
		self.templateDependencies = dependenciesTemplate
		self.content = content
	}
	
	var body: some View {
		
		content()
			.apply(dependencies)
			.apply(templateDependencies)
		
	}
	
}


// MARK: - Preview

#Preview {
	
	let template = TemplateDependencies(templateState: .init(
		theme: .baseApp.replacingValues(
			colors: [
				.accentColorBase: .color(.purple)
			]
		),
		showSettings: false
	))
	let appState = AppState()
	
	return DependencyContainer(
		dependencies: .init(templateDependencies: template, appState: appState),
		dependenciesTemplate: template
	) {
		AppContent()
	}
	
}
