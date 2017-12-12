enumerating
select: aBlock
	| selected |
	selected := self copy.
	self
		do: [ :each | 
			(aBlock value: each)
				ifFalse: [ selected remove: each ] ].
	selected normalize.
	^ selected