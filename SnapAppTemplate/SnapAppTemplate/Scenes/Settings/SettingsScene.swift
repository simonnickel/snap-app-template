//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SwiftUI
import SnapTheme
import SnapTemplateShared

// TODO Localization

struct SettingsScene: View {
	
	@Environment(\.appState) private var appState
	@Environment(\.theme) private var theme
	@Environment(\.serviceSettings) private var settings
	
	private let navSelectionState = ListNavState<SettingsNavItem>()
	
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
					
					SettingsRow(title: InterfaceScale.title) {
						SettingsPicker(setting: settings.value(.interfaceScale))
					}
					
				} header: {
					ThemeLabel(text: "Appearance", style: .themeSectionHeader())
				}
				
				Section {
					
					SettingsRow(title: NavigationLayout.title) {
						SettingsPicker(setting: settings.value(.navigationLayout))
					}
					
					ThemeListRowNavigationLink(value: SettingsNavItem.tabs, state: navSelectionState) {
						ThemeLabel(text: "Configure Tab Bar", style: .themeListRow())
					}
					
				} header: {
					ThemeLabel(text: "Navigation", style: .themeSectionHeader())
				}
				
			}
			.navigationDestinationStored(in: navSelectionState) { item in
				AnyView(item.destination)
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

