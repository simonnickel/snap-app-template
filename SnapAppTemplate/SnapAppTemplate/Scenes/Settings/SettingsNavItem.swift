//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SwiftUI
import SnapTemplateShared

enum SettingsNavItem: Codable {
	
	case tabs
	
	var title: String {
		switch self {
			case .tabs: "Configure Tabs"
		}
	}
	
	
	// MARK: - Destination
	
	var destination: any View {
		destinationPlain
			.navigationTitle(title)
	}
	
	var destinationPlain: any View {
		switch self {
				
			case .tabs: ConfigureTabsScreen(defaultConfiguration: AppDestination.tabConfigDefault)
				
		}
	}
	
}
