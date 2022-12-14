"
Core command framework.
"
Class {
	#name : #SmaCCBrowserCommand,
	#superclass : #Object,
	#instVars : [
		'target',
		'requestor'
	],
	#category : 'SmaCC-Browser'
}

{ #category : #'instance creation' }
SmaCCBrowserCommand class >> on: target for: requestor [
	^ self new setTarget: target requestor: requestor
]

{ #category : #'user interface' }
SmaCCBrowserCommand >> addItemToMenu: aMenu [
	(self isActive and: [ self wantsMenu ])
		ifTrue: [ 
			(aMenu add: self label target: self selector: #execute)
				enablementSelector: #isEnabled;
				icon:
						(self icon ifNotNil: [ :iconSelector | Smalltalk ui icons perform: iconSelector ]);
				keyText: self keyString ]
]

{ #category : #'user interface' }
SmaCCBrowserCommand >> buildShortcut: aKMDispatcher [
	"Add a shortcut to the keymap. Conditions : must have a keystroke, must wantsKeyboard and must be active."

	(self keystroke isNil or: [ self isActive not ])
		ifTrue: [ ^ self ].
	aKMDispatcher bindKeyCombination: self keystroke asKeyCombination toAction: [ self execute ]
]

{ #category : #execution }
SmaCCBrowserCommand >> execute [
	self subclassResponsibility
]

{ #category : #accessing }
SmaCCBrowserCommand >> icon [
	^ nil
]

{ #category : #testing }
SmaCCBrowserCommand >> isActive [
	^ false
]

{ #category : #testing }
SmaCCBrowserCommand >> isEnabled [
	^ true
]

{ #category : #accessing }
SmaCCBrowserCommand >> keyString [
	"Note: printing is broken on KeyCombination."
	
	| c |
	^ (c := self keystroke) isNil
		ifFalse: [ (String streamContents: [ :stream | c printOn: stream ]) copyWithout: Character space ]
		ifTrue: [ nil ]
]

{ #category : #accessing }
SmaCCBrowserCommand >> keystroke [
	^ nil

]

{ #category : #accessing }
SmaCCBrowserCommand >> label [
	self subclassResponsibility

]

{ #category : #accessing }
SmaCCBrowserCommand >> on: anObject for: aRequestor [
	^ self class on: anObject for: aRequestor
]

{ #category : #'initialize-release' }
SmaCCBrowserCommand >> setTarget: anObject requestor: aRequestor [ 
	target := anObject.
	requestor := aRequestor
]

{ #category : #testing }
SmaCCBrowserCommand >> wantsMenu [
	"true if the command wants to be in Menus."

	^ true

]
