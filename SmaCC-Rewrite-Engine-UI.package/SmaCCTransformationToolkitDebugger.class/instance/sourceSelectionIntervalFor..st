private
sourceSelectionIntervalFor: selection
	selection isNil
		ifTrue: [ ^ 1 to: 0 ].
	^ self intervalFromMethodNode: (selection last method sourceNodeForPC: selection last pc) inSource: (self sourceForSelection: selection)