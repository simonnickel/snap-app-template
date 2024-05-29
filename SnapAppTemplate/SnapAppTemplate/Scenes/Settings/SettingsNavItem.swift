//
//  SettingsNavItem.swift
//  SnapAppTemplate
//
//  Created by Simon Nickel on 29.09.23.
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
