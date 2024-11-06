//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SnapNavigation
import SnapTemplate
import SwiftUI
import SnapTemplateSettings

// TODO: === AttributeGraph: cycle detected through attribute 1891112 ===
// TODO: Settings on iPhone

@main
struct SnapAppTemplateApp: App {
	
    var body: some Scene {

		SnapNavigationWindows(provider: AppNavigationProvider()) { scene, content in
			content
				.modifier(TemplateModifierScene(scene: scene))
		}

    }
	
}


// MARK: - Preview

#Preview {
	
	// TODO: Theme in Dependencies with .override
//	let template = TemplateDependencies(templateState: .init(),
//		theme: .baseApp.replacingValues(
//			colors: [
//				.accentColorBase: .color(.purple)
//			]
//		)
//	)
	
	SnapNavigationPreview(provider: AppNavigationProvider(), scene: .main)

	
}
