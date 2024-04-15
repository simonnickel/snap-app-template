//
//  NavItem+TabConfiguration.swift
//  SnapAppTemplate
//
//  Created by Simon Nickel on 10.10.23.
//

import Foundation
import SnapTemplateShared

extension NavItem {
	var configTab: TabConfiguration.Tab {
		TabConfiguration.Tab(id: id, name: title, icon: icon)
	}
}

extension Collection where Element == NavItem {
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

extension NavItem {
	
	static var tabConfigDefault: TabConfiguration { TabConfiguration(tabs: NavItem.tabsAvailable.configArray, required: NavItem.tabsRequired.configSet, disabled: NavItem.tabsDisabledByDefault.configSet, initial: NavItem.initial.configTab) }
	
	@MainActor
	static func tabs(with configuration: TabConfiguration?) -> [NavItem] {
		let configuration = configuration?.updated(withDefaults: NavItem.tabConfigDefault) ?? NavItem.tabConfigDefault

		return configuration.visibleTabs
		// Map to NavItem and filter configured Tabs that are no longer available (already done in TabConfiguration.updated(availableTabs:) though).
			.compactMap({ tab in
				NavItem.tabsAvailable.first { navItem in
					tab.id == navItem.id
				}
			})
		
	}
	
}
