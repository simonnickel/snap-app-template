//
//  SnapAppTemplateApp.swift
//  SnapAppTemplate
//
//  Created by Simon Nickel on 15.04.24.
//

import SwiftUI
import SnapTemplateShared

@main
struct SnapAppTemplateApp: App {
	
	private let dependenciesTemplate: TemplateDependencies
	private let dependencies: AppDependencies
	
	init() {
		
		self.dependenciesTemplate = TemplateDependencies(theme: .baseApp)
		self.dependencies = AppDependencies(templateDependencies: dependenciesTemplate)
		
	}
	
    var body: some Scene {
		WindowGroup {
			DependencyWrapper(app: dependencies, template: dependenciesTemplate) {
				AppContent()
			}
		}
		
#if os(macOS)
		Settings {
			DependencyWrapper(app: dependencies, template: dependenciesTemplate) {
				SettingsScene()
			}
		}
#endif
    }
}


// MARK: - Preview

#Preview {
	
	let template = TemplateDependencies(templateState: .init(showSettings: false),
		theme: .baseApp.replacingValues(
			colors: [
				.accentColorBase: .color(.purple)
			]
		)
	)
	let appState = AppState()
	
	return DependencyWrapper(
		app: AppDependencies(templateDependencies: template, appState: appState),
		template: template
	) {
		AppContent()
	}
	
}
