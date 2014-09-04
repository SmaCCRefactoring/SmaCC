shortcuts
updateTextKeymap
	"Update the text keymap. Reset the dispatcher and make it an AltKMDispatcher if needed."

	(textMorph kmDispatcher isKindOf: AlKMDispatcher)
		ifFalse: [ textMorph setProperty: #kmdispatcher toValue: (AlKMDispatcher target: textMorph) ].
	(textMorph textMorph kmDispatcher isKindOf: AltKMDispatcher)
		ifFalse: [ textMorph textMorph setProperty: #kmDispatcher toValue: (AltKMDispatcher target: textMorph textMorph) ].
	{(textMorph kmDispatcher).
	(textMorph textMorph kmDispatcher)}
		do: [ :aKMDispatcher | 
			aKMDispatcher reset.
			aKMDispatcher attachCategory: #MorphFocusCtrlNavigation.
			self selectedNode notNil
				ifTrue: [ self selectedNode item buildTextShortcutsOn: aKMDispatcher with: self ] ]