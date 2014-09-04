drag and drop
acceptDroppingMorph: aMorph event: evt inMorph: aTreeMorph
	| aTarget |
	aTarget := aTreeMorph scrollerSubMorphFromPoint: evt position.
	self assert: aTarget == aTreeMorph potentialDropMorph.
	aTarget notNil
		ifTrue: [ (aTarget complexContents item dropItem: aMorph passenger) ifNotNil: [ :result | self selectPathForAbstractItem: result ] ]