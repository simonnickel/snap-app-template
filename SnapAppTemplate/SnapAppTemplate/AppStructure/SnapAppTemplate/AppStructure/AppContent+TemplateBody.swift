//
//  AppContent+TemplateBody.swift
//  SnapAppTemplate
//
//  Created by Simon Nickel on 14.05.24.
//

import SwiftUI
import SnapTemplateShared

extension AppContent {
	
	var templateBody: some View {
		TemplateContent(splitScene: {
			NavSplitScene(sections: NavItem.sidebarSections)
		}, tabScene: { settings in
			NavTabScene(tabsSetting: settings.value(.navigationTabs))
		}, settingsScene: {
			SettingsScene()
		})
	}
	
}
