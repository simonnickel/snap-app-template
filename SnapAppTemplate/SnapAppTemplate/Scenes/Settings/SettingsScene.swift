//
//  SettingsScene.swift
//  SnapAppTemplate
//
//  Created by Simon Nickel on 28.09.23.
//

import SwiftUI
import SnapTheme
import SnapTemplateShared

// TODO Localization

struct SettingsScene: View {
	
	@Environment(\.appState) private var appState
	@Environment(\.theme) private var theme
	@Environment(\.serviceSettings) private var settings
	
	private let navSelectionState = SelectionState()
	
	@Observable class SelectionState {
		var selectedItems: [SettingsNavItem] = []
	}
	
	var body: some View {
		
		NavigationStack {
			
			ThemeSceneSettings(title: "Settings") {
				
				SettingsHeaderSection(name: "I am Simon Nickel", text: "I hope you enjoy using this template as much as I do enjoy creating it!")
				
				Section {
					
					SettingsRow(title: "Accent Color") {
						AccentColorPicker(
							setting: settings.value(.accentColor),
							defaultSet: .accentColors
						)
						.frame(maxWidth: .infinity, alignment: .center)
					}
					
					SettingsRow(title: DisplayMode.title) {
						SettingsPicker(setting: settings.value(.displayMode))
						
					}
					
					SettingsRow(title: NavigationLayout.title) {
						SettingsPicker(setting: settings.value(.navigationLayout))
						
					}
					
					NavigationLink(value: SettingsNavItem.tabs) {
						ThemeLabel(text: "Configure Tab Bar")
					}
					.themeListRow(isSelected: navSelectionState.selectedItems.contains(SettingsNavItem.tabs))
					
				} header: {
					ThemeLabel(text: "Appearance")
						.labelStyle(.themeSectionHeader())
				}
				
			}
			.navigationDestination(for: SettingsNavItem.self) { item in
				AnyView(item.destination)
					.onAppear {
						navSelectionState.selectedItems.append(item)
					}
					.onDisappear {
						navSelectionState.selectedItems.removeAll(where: { $0 == item })
					}
					.environment(navSelectionState)
			}
			
		}
		
	}
	
}


// MARK - Preview

#Preview {
	
	NavigationStack {
		
		SettingsScene()
		
	}
	
}

