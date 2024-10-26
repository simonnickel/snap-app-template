//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SwiftUI


// MARK: - AppState

extension EnvironmentValues {
	
	/// It's a Binding to allow values to be changed from inside the view hierarchy.
	@Entry var appStateBinding: Binding<AppState> = .constant(AppState())
	
	@Entry var appState: AppState = AppState()
	
}
