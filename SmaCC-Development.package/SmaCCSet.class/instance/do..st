enumerating
do: aBlock
	objects do: aBlock.
	characters
		keysAndValuesDo:
			[ :key :value | 
			1 to: 8 do:
				[ :j | 
				((value bitShift: 1 - j) bitAnd: 1) = 1
					ifTrue: [ aBlock value: (Character value: (key - 1) * 8 + j - 1) ] ] ]