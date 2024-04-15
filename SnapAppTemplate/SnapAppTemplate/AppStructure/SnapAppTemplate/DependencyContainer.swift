//
//  DependencyContainer.swift
//  SnapAppTemplate
//
//  Created by Simon Nickel on 03.09.23.
//

import SwiftUI
import SnapTheme
import SnapTemplateShared

/// The main SnapAppTemplate container view to setup scenes for `TemplateContent` and apply `AppDependencies` and `TemplateDependencies`.
/// Uses `AppContainer` as an intermediate view to apply further customisation to the content.
struct DependencyContainer: View {
	
	private let dependencies: AppDependencies
	private let templateDependencies: TemplateDependencies
	
	/// The `DependencyContainer` wraps the `TemplateContent` in the `AppContainer` and the `TemplateContainer` and forwards Dependencies.
	/// - Parameters:
	///   - dependencies: `AppDependencies` should be owned outside of the View.
	///   - dependenciesTemplate: `TemplateDependencies` should be owned outside of the View.
	init(dependencies: AppDependencies, dependenciesTemplate: TemplateDependencies) {
		self.dependencies = dependencies
		self.templateDependencies = dependenciesTemplate
	}
	
	var body: some View {
	
		AppContainer {
			TemplateContent(splitScene: {
				NavSplitScene(sections: NavItem.sidebarSections)
			}, tabScene: { settings in
				NavTabScene(tabsSetting: settings.value(.navigationTabs))
			}, settingsScene: {
				SettingsScene()
			})
		}
		.apply(templateDependencies)
		.apply(dependencies)
		
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
	)
	
}
