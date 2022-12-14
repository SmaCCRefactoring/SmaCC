"
I setp forward until my scanner has reached a certain position in the input stream. The position comes from the GUI.
"
Class {
	#name : #SmaCCStepToCursorAction,
	#superclass : #SmaCCScannerStepToAction,
	#category : 'SmaCC-Debugging-Support'
}

{ #category : #registration }
SmaCCStepToCursorAction class >> gtActionFor: aDebugger [
	<gtSmaCCDebuggingInputAction>
	^ (self forDebugger: aDebugger) icon: GLMUIThemeExtraIcons glamorousInto
]

{ #category : #accessing }
SmaCCStepToCursorAction >> defaultLabel [
	^ 'Step to Cursor'
]

{ #category : #accessing }
SmaCCStepToCursorAction >> help [
	^ 'step forward until I reach the cursor position in the input'
]

{ #category : #accessing }
SmaCCStepToCursorAction >> stepToIndex [
	^ self debugger currentInputSelectionInterval last
]
