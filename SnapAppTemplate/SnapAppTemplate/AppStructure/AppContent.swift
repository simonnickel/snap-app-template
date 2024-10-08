//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SwiftUI
import SnapTheme
import SnapTemplateShared

/// A container to apply app specific customisation to the content.
struct AppContent: View {
	
	// Access to AppState via Environment
	//@Environment(\.appState) private var appState
	//@Environment(\.appStateBinding) private var appStateBinding
	//@Environment(\.templateStateBinding) private var templateStateBinding
	
	var body: some View {
	
		templateBody
		// App specific things, e.g. :
		// .modalPresentation(style: appStateBinding., isPresented:, content: {}, onClose: { appStateBinding..wrappedValue = nil })
		
	}
	
	@MainActor
	private var templateBody: some View {
		TemplateContent(splitScene: {
			NavSplitScene(sections: AppDestination.sidebarSections)
		}, tabScene: { settings in
			NavTabScene(tabsSetting: settings.value(.navigationTabs))
		}, settingsScene: {
			SettingsScene()
		})
	}
	
}
