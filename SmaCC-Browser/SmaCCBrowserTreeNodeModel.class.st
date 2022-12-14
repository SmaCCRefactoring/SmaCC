"
I am a MorphTreeNodeModel with some contents (children) and I cache that content.
"
Class {
	#name : #SmaCCBrowserTreeNodeModel,
	#superclass : #MorphTreeNodeModel,
	#instVars : [
		'contents'
	],
	#category : 'SmaCC-Browser'
}

{ #category : #converting }
SmaCCBrowserTreeNodeModel >> asString [
	^ item asStringIn: self
]

{ #category : #querying }
SmaCCBrowserTreeNodeModel >> buildTextMenu: aMenu on: aTarget with: aRequestor [
	^ self item buildTextMenu: aMenu on: aTarget with: aRequestor
]

{ #category : #querying }
SmaCCBrowserTreeNodeModel >> buildTreeMenu: aMenu on: aTarget with: aRequestor [
	^ self item buildTreeMenu: aMenu on: aTarget with: aRequestor
]

{ #category : #accessing }
SmaCCBrowserTreeNodeModel >> childrenItems [
	"Children items."

	^ item contents
]

{ #category : #accessing }
SmaCCBrowserTreeNodeModel >> contents [
	"The contents are cached."

	contents isNil
		ifTrue: [ contents := super contents ].
	^ contents
]

{ #category : #actions }
SmaCCBrowserTreeNodeModel >> doubleClickOn: aMorph in: anAltBrowser [
	^ self item doubleClickOn: aMorph in: anAltBrowser
]

{ #category : #accessing }
SmaCCBrowserTreeNodeModel >> icon [
	"When returned an icon symbol, sees if it exists before trying to get it. We depend on some packages which may not exist or be unloaded."

	| iconSelector |
	iconSelector := self item icon.
	iconSelector ifNil: [ ^ nil ].
	(Smalltalk ui icons respondsTo: iconSelector)
		ifTrue: [ ^ Smalltalk ui icons perform: iconSelector ]
		ifFalse: [ ^ nil ]
]

{ #category : #protocol }
SmaCCBrowserTreeNodeModel >> isExpanded: aBoolean [
	"When not expanded, destroy its contents. Too much caching hurts."

	aBoolean
		ifFalse: [ contents := nil ]
]
