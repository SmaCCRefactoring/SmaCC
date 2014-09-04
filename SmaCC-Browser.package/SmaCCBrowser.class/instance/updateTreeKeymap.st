shortcuts
updateTreeKeymap
	"Update the tree keymap."

	(self treeMorph kmDispatcher isKindOf: AlKMDispatcher)
		ifFalse: [ textMorph setProperty: #kmdispatcher toValue: AlKMDispatcher new ].
	self treeMorph kmDispatcher
		reset;
		attachCategory: #MorphFocusNavigation;
		attachCategory: #MorphFocusCtrlNavigation.
	self selectedNode notNil
		ifTrue: [ self selectedNode item buildTreeShortcutsOn: self treeMorph kmDispatcher with: self ]
		ifFalse: [ 
			(Pragma allNamed: #treeAreaCommand from: self class to: self class)
				do: [ :e | (self perform: e selector) do: [ :c | (c on: self treeMorph for: self) buildShortcut: self treeMorph kmDispatcher ] ] ]