as yet unclassified
buildTextShortcutsOn: aKMDispatcher with: aRequestor
	"This is an attempt at handling shortcuts... Which works, with the help of a custom KMDispatcher."

	(self pragmas: #textAreaCommand from: self class to: AltAbstractNode)
		do: [ :e | 
			(self perform: e selector)
				do: [ :c | 
					| command |
					command := c on: aRequestor textMorph for: aRequestor.
					command buildShortcut: aKMDispatcher ] ]