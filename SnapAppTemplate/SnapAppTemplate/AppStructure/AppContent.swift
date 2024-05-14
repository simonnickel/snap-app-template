//
//  AppContent.swift
//  SnapAppTemplate
//
//  Created by Simon Nickel on 12.10.23.
//

import SwiftUI
import SnapTheme

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
	
}
