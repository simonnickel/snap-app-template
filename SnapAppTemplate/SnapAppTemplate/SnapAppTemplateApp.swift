//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SnapNavigation
import SnapTemplate
import SwiftUI
import SnapTemplateSettings

@main
struct SnapAppTemplateApp: App {
	
    var body: some Scene {

		SnapNavigationWindows(provider: AppNavigationProvider()) { scene, content in
			content
				.setupTemplateConfig(for: scene, sidebarModifier: TemplateSidebarModifier())
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
