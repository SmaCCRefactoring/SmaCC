"
I cancel the text pane.
"
Class {
	#name : #SmaCCBrowserTextCancelCommand,
	#superclass : #SmaCCBrowserCommand,
	#category : 'SmaCC-Browser'
}

{ #category : #'instance creation' }
SmaCCBrowserTextCancelCommand class >> on: target for: requestor [
	^ self new setTarget: target requestor: requestor
]

{ #category : #execution }
SmaCCBrowserTextCancelCommand >> execute [
	target cancel
]

{ #category : #accessing }
SmaCCBrowserTextCancelCommand >> icon [
	^ #smallCancelIcon
]

{ #category : #testing }
SmaCCBrowserTextCancelCommand >> isActive [
	^ true
]

{ #category : #accessing }
SmaCCBrowserTextCancelCommand >> keystroke [
	^ $l ctrl
]

{ #category : #accessing }
SmaCCBrowserTextCancelCommand >> label [
	^ 'Cancel'
]
