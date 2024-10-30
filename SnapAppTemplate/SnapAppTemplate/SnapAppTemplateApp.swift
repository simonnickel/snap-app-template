//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SnapTemplateSettings
import SwiftUI

@main
struct SnapAppTemplateApp: App {
	
    var body: some Scene {
		WindowGroup {
			AppContent()
		}
		
#if os(macOS)
		Settings {
			// TODO: Fix navigation by implementing window support in SnapNavigation
			TemplateSettingsScreen()
		}
#endif
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
	
	return AppContent()
	
}
