accessing
inputFilenames
	| names |
	names := OrderedCollection new.
	(self inputDirectory entries select: [ :e | e extension = self extension ]) do: [ :each | names add: each ].
	^ names