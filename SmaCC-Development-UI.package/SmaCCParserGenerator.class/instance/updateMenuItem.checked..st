private
updateMenuItem: aSymbol checked: aBoolean
	| item |
	item := self menuItemFor: aSymbol.
	item
		icon:
			(aBoolean
				ifTrue: [ item onImage ]
				ifFalse: [ item offImage ])