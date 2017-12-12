enumerating
commonElementWith: aCollection
	| intersected |
	characters class = aCollection class
		ifTrue: [ intersected := characters smaccIntersect: aCollection.
			^ intersected isEmpty
				ifTrue: [ nil ]
				ifFalse: [ intersected first ] ].
	aCollection
		do: [ :each | 
			(self includes: each)
				ifTrue: [ ^ each ] ].
	^ nil