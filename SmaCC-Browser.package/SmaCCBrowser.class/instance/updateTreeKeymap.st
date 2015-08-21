shortcuts
updateTreeKeymap
	"Update the tree keymap."

	self treeMorph kmDispatcher
		reset;
		attachCategory: #MorphFocusNavigation;
		attachCategory: #MorphFocusCtrlNavigation.
	self selectedNode notNil
		ifTrue: [ self selectedNode item buildTreeShortcutsOn: self treeMorph kmDispatcher with: self ]