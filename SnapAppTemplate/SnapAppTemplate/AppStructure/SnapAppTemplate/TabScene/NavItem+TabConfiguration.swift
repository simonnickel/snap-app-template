//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import Foundation
import SnapTemplateShared

extension AppDestination {
	var configTab: TabConfiguration.Tab {
		TabConfiguration.Tab(id: id, name: title, icon: icon)
	}
}

extension Collection where Element == AppDestination {
	var configArray: [TabConfiguration.Tab] {
		self.map({ item in
			item.configTab
		})
	}
	
	var configSet: Set<TabConfiguration.Tab> {
		Set<TabConfiguration.Tab>(self.map({ item in
			item.configTab
		}))
	}
}

extension AppDestination {
	
	static var tabConfigDefault: TabConfiguration { TabConfiguration(tabs: AppDestination.tabsAvailable.configArray, required: AppDestination.tabsRequired.configSet, disabled: AppDestination.tabsDisabledByDefault.configSet, initial: AppDestination.initial.configTab) }
	
	@MainActor
	static func tabs(with configuration: TabConfiguration?) -> [AppDestination] {
		let configuration = configuration?.updated(withDefaults: AppDestination.tabConfigDefault) ?? AppDestination.tabConfigDefault

		return configuration.visibleTabs
		// Map to AppDestination and filter configured Tabs that are no longer available (already done in TabConfiguration.updated(availableTabs:) though).
			.compactMap({ tab in
				AppDestination.tabsAvailable.first { destination in
					tab.id == destination.id
				}
			})
		
	}
	
}
