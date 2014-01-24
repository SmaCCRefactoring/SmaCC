accessing
sortedChildren
	^ self children
		asSortedCollection: [ :a :b | 
			| startA startB |
			startA := a startPosition.
			startB := b startPosition.
			startA isNil
				or: [ 
					b notNil
						and: [ 
							startA class = startB class
								ifTrue: [ startA < startB ]
								ifFalse: [ startA class name < startB class name ] ] ] ]