actions
acceptScannerCode: aStringOrAText notifying: aRequestor 
	SmaCCScannerParser
		parse: aStringOrAText
		onError: [:aString :position | 
			| morph | 
			self tabList selectedPageIndex: 1.
			self
				displayError: aString
				at: position
				notifying: aRequestor.
			^ false].
	^ true