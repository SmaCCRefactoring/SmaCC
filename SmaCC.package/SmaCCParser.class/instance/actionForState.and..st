private
actionForState: stateIndex and: aSymbolIndex
	| index row |
	row := self transitionTable at: stateIndex.
	^ row isArray 
		ifTrue: [ 
			(row at: 1) == 2 
				ifTrue: [
					index := self binarySearchInArray: row
						for: aSymbolIndex
						size: 1.
					index == 0 
						ifTrue: [ ^ self errorAction ]
						ifFalse: [ ^ row at: 2 ] ]
				ifFalse: [ 
					index := self binarySearchInArray: row
						for: aSymbolIndex
						size: 2.
					index == 0
						ifTrue: [ ^ self errorAction ]
						ifFalse: [ ^ row at: index - 1 ] ] ]
		ifFalse: [ 
			(row at: 1) == 0 
				ifTrue: [ 
					index := self binarySearchInBytes: row
						for: aSymbolIndex
						size: 2.
					index == 0 
						ifTrue: [ ^ self errorAction ] 
						ifFalse: [ ^ ((row at: 2) bitShift: 8) + (row at: 3) ] ]
				ifFalse: [ 
					index := self binarySearchInBytes: row
						for: aSymbolIndex
						size: 4.
					index == 0 
						ifTrue: [ ^ self errorAction ] 
						ifFalse: [ ^ ((row at: index - 2) bitShift: 8) + (row at: index - 1) ] ] ]