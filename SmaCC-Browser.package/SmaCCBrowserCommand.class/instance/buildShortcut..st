user interface
buildShortcut: aKMDispatcher
	"Add a shortcut to the keymap. Conditions : must have a keystroke, must wantsKeyboard and must be active."

	(self keystroke isNil or: [ self isActive not ])
		ifTrue: [ ^ self ].
	aKMDispatcher bindKeyCombination: self keystroke asKeyCombination toAction: [ self execute ]