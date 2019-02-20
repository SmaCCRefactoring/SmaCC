private
createResultFor: anObject
	| found search |
	(patternNode isKindOf: SmaCCToken)
		ifTrue: [ ^ nil ].
	found := false.
	search := [ :each | found := found or: [ each == anObject ] ].
	patternNode nodesDo: search andTokensDo: search.
	found
		ifTrue: [ ^ children
				add:
					((self class forPattern: anObject)
						parent: self;
						yourself) ].
	patternNode
		nodesDo: [ :each | 
			(self doesNode: each contain: anObject)
				ifTrue: [ | result |
					result := self class forPattern: each.
					result parent: self.
					children add: result.
					^ result createResultFor: anObject ] ].
	^ nil