actions
buildTextShortcutsOn: aKMDispatcher with: aRequestor
	"This is an attempt at handling shortcuts... Which works, with the help of a custom KMDispatcher."

	(self selectorsForProtocol: '.*text commands')
		do: [ :e | 
				(self perform: e)
				do: [ :c | 
					| command |
					command := c asClass on: aRequestor textMorph for: aRequestor.
					command buildShortcut: aKMDispatcher ] ]