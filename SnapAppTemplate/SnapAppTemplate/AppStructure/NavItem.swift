//
//  NavItem.swift
//  SnapAppTemplate
//
//  Created by Simon Nickel on 03.09.23.
//

import SwiftUI
import SnapTheme
import SnapMatchingNavigation

/// Definition of main navigation hierarchy for Tab and Sidebar layouts.
enum NavItem: MNavItem, Codable, Equatable, Hashable, Identifiable {
	
	
	// MARK: - Scenes
	
	case rectangle
	case rectangleA, rectangleB
	
	case circle
	case circleA
	
	case triangle

	
	// MARK: - Navigation
	
	static let initial: NavItem = .rectangle
	
	
	// MARK: Sidebar
	
	static let sidebarSections: [NavItem] = [.rectangle, .circle]
	
	
	// MARK: Tabs
	
	/// TabConfiguration limits number of visible tabs based on device. Showing them in order of this array, required tabs will move forward to be visible. Additional tabs would be displayed in a list under the `more` tab. Should be avoided as this list can not be modified and has its own NavigationStack.
	static let tabsAvailable: [NavItem] = [.rectangle, .circle, .triangle]
	static let tabsRequired: [NavItem] = [.rectangle]
	static let tabsDisabledByDefault: Set<NavItem> = [.triangle]
	
	
	// MARK: - Hierarchy
	
	var subItems: [NavItem] {
		switch self {
			case .rectangle: [
				// Multiple Scenes in Tab are displayed as a list.
				.rectangleA, .rectangleB
			]
			case .circle: [
				// Single Scene in Tab is displayed directly.
				.circleA
			]
			default: []
		}
	}
	
	
	// MARK: - Values
	
	var id: String { idDefault }
	
	var title: String? {
		switch self {
			case .rectangleA: "Rectangle A"
			case .rectangleB: "Rectangle B"
			case .circleA: "Circle A"
				
			default: self.id.uppercasedFirstLetter
		}
	}
	
	var icon: Theme.IconKey? {
		switch self {
			case .rectangle: .navGroupRectangle
			case .circle: .navGroupCircle
			case .triangle: .navGroupTriangle
				
			default: nil
		}
	}
	
}
