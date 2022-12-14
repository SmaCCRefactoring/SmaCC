"
This action steps one forward into the scanner input, but tries to never go over the end.
"
Class {
	#name : #SmaCCStepToNextCharacterAction,
	#superclass : #SmaCCScannerStepToAction,
	#category : 'SmaCC-Debugging-Support'
}

{ #category : #registration }
SmaCCStepToNextCharacterAction class >> gtActionFor: aDebugger [
	<gtSmaCCDebuggingScannerAction>
	^ (self forDebugger: aDebugger) icon: GLMUIThemeExtraIcons glamorousInto
]

{ #category : #accessing }
SmaCCStepToNextCharacterAction >> defaultLabel [
	^ 'Step Next Character'
]

{ #category : #accessing }
SmaCCStepToNextCharacterAction >> help [
	^ 'Step to the next character in the input'
]

{ #category : #accessing }
SmaCCStepToNextCharacterAction >> stepToIndex [
	^ self session scanner stream position + 1
]
