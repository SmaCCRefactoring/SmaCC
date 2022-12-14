"
I inspect the currently selected item
"
Class {
	#name : #SmaCCBrowserInspectItemCommand,
	#superclass : #SmaCCBrowserCommand,
	#category : 'SmaCC-Browser'
}

{ #category : #execution }
SmaCCBrowserInspectItemCommand >> execute [
	requestor selectedNode item inspect
]

{ #category : #accessing }
SmaCCBrowserInspectItemCommand >> icon [
	^ #smallInspectItIcon
]

{ #category : #testing }
SmaCCBrowserInspectItemCommand >> isActive [
	^ true
]

{ #category : #testing }
SmaCCBrowserInspectItemCommand >> isEnabled [
	^ requestor selectedNode notNil
]

{ #category : #accessing }
SmaCCBrowserInspectItemCommand >> keystroke [
	^ $i command
]

{ #category : #accessing }
SmaCCBrowserInspectItemCommand >> label [
	^ 'Inspect It'
]
