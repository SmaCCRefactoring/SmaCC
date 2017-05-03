private
sourceForSelection: anArray
	anArray isNil
		ifTrue: [ ^ '' ].
	^ (self codeObjectForSelection: anArray) source