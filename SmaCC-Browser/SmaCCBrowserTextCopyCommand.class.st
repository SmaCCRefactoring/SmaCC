"
I allow copy of some code in the text pane of the browser
"
Class {
	#name : #SmaCCBrowserTextCopyCommand,
	#superclass : #SmaCCBrowserCommand,
	#category : 'SmaCC-Browser'
}

{ #category : #execution }
SmaCCBrowserTextCopyCommand >> execute [
	target copySelection
]

{ #category : #accessing }
SmaCCBrowserTextCopyCommand >> icon [
	^ #smallCopyIcon
]

{ #category : #testing }
SmaCCBrowserTextCopyCommand >> isActive [
	^ true
]

{ #category : #testing }
SmaCCBrowserTextCopyCommand >> isEnabled [
	| interval |
	interval := requestor textSelectionInterval ifNil: [ ^ false ].
	^ (target text copyFrom: interval first to: interval last) isEmpty not
]

{ #category : #accessing }
SmaCCBrowserTextCopyCommand >> keystroke [
	^ $c ctrl
]

{ #category : #accessing }
SmaCCBrowserTextCopyCommand >> label [
	^ 'Copy'
]
