"
A SmaCCBrowser browse an AST (generated with the SmaCC framework) along with the parsed text.

It combines the model aspects of a TreeModel and a StringHolder/CodeHolder (sort of: a StringHolder is already far too full of Smalltalk code related stuff, and not just about editing stuff).
"
Class {
	#name : #SmaCCBrowser,
	#superclass : #MorphTreeModel,
	#instVars : [
		'treeMorph',
		'isSelectionUpdate',
		'window',
		'textMorph',
		'history',
		'text',
		'textSelectionInterval'
	],
	#category : 'SmaCC-Browser'
}

{ #category : #'instance creation' }
SmaCCBrowser class >> displayAstFor: aString do: aBlock [
	"Opens itself on a parsed ast with the string and the block."

	| ast browser |
	ast := aBlock value: aString.
	browser := self new.
	browser rootItems: {(SmaCCBrowserASTTreeNode with: ast)}.
	browser text: aString.
	browser open
]

{ #category : #'instance creation' }
SmaCCBrowser class >> on: ast [
	"Opens itself on a parsed ast."

	| browser |
	browser := self new.
	browser rootItems: {(SmaCCBrowserASTTreeNode with: ast)}.
	browser text: ast completeSource.
	browser open
]

{ #category : #'instance creation' }
SmaCCBrowser class >> parseAndDisplay: aString with: aParser [
	"Opens itself on a parsed ast with the string and the parser."

	| ast browser |
	ast := aParser parse: aString.
	browser := self new.
	browser rootItems: {(SmaCCBrowserASTTreeNode with: ast)}.
	browser text: aString.
	browser open
]

{ #category : #menus }
SmaCCBrowser >> buildTextMenu: aMenu [
	self selectedNode notNil
		ifTrue: [ self selectedNode buildTextMenu: aMenu on: textMorph with: self ].
	^ aMenu
]

{ #category : #menus }
SmaCCBrowser >> buildTreeMenu: aMenu [
	"Ask the selection for builidng a menu, otherwise create a default one."

	self selectedNode notNil
		ifTrue: [ self selectedNode item buildTreeMenu: aMenu on: self treeMorph with: self ]
		ifFalse: [ 
			| t |
			t := false.
			(Pragma allNamed: #treeAreaCommand from: self class to: self class)
				do: [ :e | 
					t
						ifTrue: [ aMenu addLine ]
						ifFalse: [ t := true ].
					(self perform: e selector) do: [ :c | (c on: self treeMorph for: self) addItemToMenu: aMenu ] ] ].
	^ aMenu
]

{ #category : #view }
SmaCCBrowser >> defaultTextMorph [
	^ (PluggableTextMorph
		on: self
		text: #text
		accept: #text:
		readSelection: #textSelectionInterval
		menu: #buildTextMenu:
		setSelection: #textSelectionInterval:) font: StandardFonts codeFont
]

{ #category : #view }
SmaCCBrowser >> defaultTreeMorph [
	^ super defaultTreeMorph
		doubleClickSelector: #doubleClick;
		nodeStringGetter: #asString;
		getMenuSelector: #buildTreeMenu:;
		withHLines: false;
		yourself
]

{ #category : #'user action' }
SmaCCBrowser >> doubleClick [
	"Delegate the double click to the selected node, if any."

	self treeMorph selectedMorph ifNotNil: [ :aMorph | aMorph complexContents doubleClickOn: aMorph in: self ]
]

{ #category : #accessing }
SmaCCBrowser >> history [
	history isNil
		ifTrue: [ 
			history := NavigationHistory new.
			history maxSize: 50 ].
	^ history
]

{ #category : #private }
SmaCCBrowser >> isSelectionUpdate [
	^ isSelectionUpdate ifNil: [ isSelectionUpdate := false ]
]

{ #category : #view }
SmaCCBrowser >> open [
	"Open the window, as simple as that."

	| pane group |
	pane := PanelMorph new
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		fillStyle: Color transparent;
		changeTableLayout;
		cellInset: 0;
		cellPositioning: #leftCenter;
		yourself.	"non pane color tracking"
	group := Morph new
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		fillStyle: Color transparent;
		changeProportionalLayout;
		yourself.	"non pane color tracking"
	window := self theme newWindowIn: World for: self title: self title.
	window addMorph: pane frame: (0 @ 0 corner: 1 @ 1).
	treeMorph := self defaultTreeMorph.
	textMorph := self defaultTextMorph.
	treeMorph buildContents.
	treeMorph on: #keyStroke send: #startSearch:for: to: AltKeyboardSearchInTree.
	pane addMorph: group.
	group addMorph: treeMorph fullFrame: (LayoutFrame fractions: (0 @ 0.0 corner: 0.3 @ 1) offsets: (0 @ 1 corner: 0 @ -1)).
	group addMorph: textMorph fullFrame: (LayoutFrame fractions: (0.3 @ 0.0 corner: 1 @ 1) offsets: (4 @ 0 corner: 0 @ 0)).
	group
		addMorph:
			(ProportionalSplitterMorph new
				layoutFrame: (LayoutFrame fractions: (0.3 @ 0.0 corner: 0.3 @ 1) offsets: (0 @ 0 corner: 4 @ 0));
				addLeftOrTop: treeMorph;
				addRightOrBottom: textMorph).
	window minimumExtent: 500 @ 500.
	window open
]

{ #category : #accessing }
SmaCCBrowser >> rootNodeClassFromItem: anItem [
	^ SmaCCBrowserTreeNodeModel
]

{ #category : #selecting }
SmaCCBrowser >> selection: anItem [
	"This is called when a node is selected in the tree. We should there select the relevant source code item / deselect as appropriate."

	| sel |
	anItem selectedNodePath notNil
		ifTrue: [ sel := anItem selectedNodePath last ].
	super selection: anItem.
	self isSelectionUpdate
		ifTrue: [ ^ self ].
	self updateTextKeymap.
	self updateTreeKeymap.
	self updateTextSelection.
	sel isNil
		ifTrue: [ 
			"Need to unselect things?"
			 ]
		ifFalse: [ 
			self history add: sel.
			sel item selectIn: self ]
]

{ #category : #accessing }
SmaCCBrowser >> text [
	^ text ifNil: [ text := '' ]
]

{ #category : #accessing }
SmaCCBrowser >> text: anObject [
	text := anObject
]

{ #category : #accessing }
SmaCCBrowser >> textMorph [
	^ textMorph 
]

{ #category : #accessing }
SmaCCBrowser >> textSelectionInterval [
	^ textSelectionInterval
]

{ #category : #accessing }
SmaCCBrowser >> textSelectionInterval: anObject [
	textSelectionInterval := anObject
]

{ #category : #accessing }
SmaCCBrowser >> title [
	^ 'SmaCC Browser'
]

{ #category : #accessing }
SmaCCBrowser >> treeMorph [
	^ treeMorph
]

{ #category : #shortcuts }
SmaCCBrowser >> updateTextKeymap [
	"Update the text keymap."

	(Array with: textMorph kmDispatcher with: textMorph textMorph kmDispatcher)
		do: [ :aKMDispatcher | 
			aKMDispatcher reset.
			aKMDispatcher attachCategory: #MorphFocusCtrlNavigation.
			self selectedNode notNil
				ifTrue: [ self selectedNode item buildTextShortcutsOn: aKMDispatcher with: self ] ]
]

{ #category : #updating }
SmaCCBrowser >> updateTextSelection [
	"Ok, we need to select the right item."

	self selectedNode
		ifNil: [  ]
		ifNotNil: [ :aNode | 
			aNode item startPosition
				ifNotNil: [ :startPosition | 
					aNode item stopPosition
						ifNotNil: [ :stopPosition | 
							textMorph
								setSelection:
									{startPosition.
									stopPosition} ] ] ]

]

{ #category : #shortcuts }
SmaCCBrowser >> updateTreeKeymap [
	"Update the tree keymap."

	self treeMorph kmDispatcher
		reset;
		attachCategory: #MorphFocusNavigation;
		attachCategory: #MorphFocusCtrlNavigation.
	self selectedNode notNil
		ifTrue: [ self selectedNode item buildTreeShortcutsOn: self treeMorph kmDispatcher with: self ]
]
