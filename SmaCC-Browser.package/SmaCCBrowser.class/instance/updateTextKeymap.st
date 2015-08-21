shortcuts
updateTextKeymap
	"Update the text keymap."

	(Array with: textMorph kmDispatcher with: textMorph textMorph kmDispatcher)
		do: [ :aKMDispatcher | 
			aKMDispatcher reset.
			aKMDispatcher attachCategory: #MorphFocusCtrlNavigation.
			self selectedNode notNil
				ifTrue: [ self selectedNode item buildTextShortcutsOn: aKMDispatcher with: self ] ]