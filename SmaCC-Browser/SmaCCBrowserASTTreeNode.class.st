"
A SmaCCASTTreeNode  holds an AST node (with the generated api from SmaCC).

"
Class {
	#name : #SmaCCBrowserASTTreeNode,
	#superclass : #Object,
	#instVars : [
		'parent',
		'item'
	],
	#category : 'SmaCC-Browser'
}

{ #category : #'instance creation' }
SmaCCBrowserASTTreeNode class >> with: anObject [
	^ self new item: anObject
]

{ #category : #'instance creation' }
SmaCCBrowserASTTreeNode class >> with: anObject parent: aNode [
	^ self new
		item: anObject;
		parent: aNode;
		yourself
]

{ #category : #printing }
SmaCCBrowserASTTreeNode >> asStringIn: aMorphTreeNode [
	^ item printString
]

{ #category : #actions }
SmaCCBrowserASTTreeNode >> buildTextMenu: aMenu on: aTarget with: aRequestor [
	"Ok, now I work with protocols."

	| t |
	t := false.
	((self selectorsForProtocol: '.*text commands') sorted: [ :a :b | a < b ])
		do: [ :p | 
			t
				ifTrue: [ aMenu addLine ]
				ifFalse: [ t := true ].
			(self perform: p) do: [ :c | (c asClass on: aTarget for: aRequestor) addItemToMenu: aMenu ] ]
]

{ #category : #actions }
SmaCCBrowserASTTreeNode >> buildTextShortcutsOn: aKMDispatcher with: aRequestor [
	"This is an attempt at handling shortcuts... Which works, with the help of a custom KMDispatcher."

	(self selectorsForProtocol: '.*text commands')
		do: [ :e | 
				(self perform: e)
				do: [ :c | 
					| command |
					command := c asClass on: aRequestor textMorph for: aRequestor.
					command buildShortcut: aKMDispatcher ] ]
]

{ #category : #actions }
SmaCCBrowserASTTreeNode >> buildTreeMenu: aMenu on: aTarget with: aRequestor [
	| t |
	t := false.
	((self selectorsForProtocol: '.*tree commands') sorted: [ :a :b | a < b ])
		do: [ :e | 
			t
				ifTrue: [ aMenu addLine ]
				ifFalse: [ t := true ].
			(self perform: e) do: [ :c | (c asClass on: aTarget for: aRequestor) addItemToMenu: aMenu ] ]
]

{ #category : #actions }
SmaCCBrowserASTTreeNode >> buildTreeShortcutsOn: aMorph with: aRequestor [
	"This is an attempt at handling shortcuts... Which works, with the help of a custom KMDispatcher."

	(self selectorsForProtocol: '.*tree commands')
		do: [ :e | 
			(self perform: e)
				do: [ :c | 
					| command |
					command := c asClass on: aRequestor treeMorph for: aRequestor.
					command isEnabled
						ifTrue: [ command buildShortcut: aMorph ] ] ]
]

{ #category : #accessing }
SmaCCBrowserASTTreeNode >> contents [
	^ item sortedChildren collect: [ :e | SmaCCBrowserASTTreeNode with: e parent: self ]
]

{ #category : #actions }
SmaCCBrowserASTTreeNode >> doubleClickOn: aMorphTreeNodeMorph in: anAlTreeModel [
	"Handle a double click on the current node: toggle the expanded state by default, or do something else."

	aMorphTreeNodeMorph toggleExpandedState.
	anAlTreeModel treeMorph adjustSubmorphPositions
]

{ #category : #accessing }
SmaCCBrowserASTTreeNode >> icon [
	"The icon used to display the node in the tree."

	^ nil
]

{ #category : #accessing }
SmaCCBrowserASTTreeNode >> item [
	^ item
]

{ #category : #accessing }
SmaCCBrowserASTTreeNode >> item: anObject [
	item := anObject
]

{ #category : #accessing }
SmaCCBrowserASTTreeNode >> parent [
	^ parent
]

{ #category : #accessing }
SmaCCBrowserASTTreeNode >> parent: anObject [
	parent := anObject
]

{ #category : #actions }
SmaCCBrowserASTTreeNode >> selectIn: aBrowser [
	"Tracking the fact that we are selected."
	
]

{ #category : #private }
SmaCCBrowserASTTreeNode >> selectorsForProtocol: aString [
	"Return all selectors belonging to those protocols"

	"Beware: this is dependent on the fact protocols are strings or symbols"

	^ OrderedCollection
		streamContents: [ :stream | 
			self class withAllSuperclasses
				do: [ :c | 
					c protocols
						do: [ :p | 
							(p matchesRegex: aString)
								ifTrue: [ stream nextPutAll: (c selectorsInProtocol: p) ] ] ] ]

]

{ #category : #accessing }
SmaCCBrowserASTTreeNode >> startPosition [
	^ item startPosition
]

{ #category : #accessing }
SmaCCBrowserASTTreeNode >> stopPosition [
	^ item stopPosition
]

{ #category : #accessing }
SmaCCBrowserASTTreeNode >> title [
	^ ''
]

{ #category : #'tree commands' }
SmaCCBrowserASTTreeNode >> wDebugTreeCommands [
	^ #(#SmaCCBrowserInspectItemCommand)
]

{ #category : #'text commands' }
SmaCCBrowserASTTreeNode >> wTextCommands [
	^ #(#SmaCCBrowserTextCopyCommand #SmaCCBrowserTextCancelCommand)
]
