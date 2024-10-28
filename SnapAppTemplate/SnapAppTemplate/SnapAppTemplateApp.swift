//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SwiftUI
import SnapTemplateShared

@main
struct SnapAppTemplateApp: App {
	
    var body: some Scene {
		WindowGroup {
			AppContent()
		}
		
#if os(macOS)
		Settings {
			SettingsScene()
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
