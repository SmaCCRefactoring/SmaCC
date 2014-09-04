drag and drop
wantsDroppedMorph: aMorph event: anEvent inMorph: destMorph
	"Done: has a framework for filtering possible drop targets."

	^ destMorph == self treeMorph
		and: [ 
			aMorph isTransferable
				and: [ 
					(destMorph scrollerSubMorphFromPoint: anEvent position)
						ifNil: [ false ]
						ifNotNil: [ :target | target complexContents item acceptDropItem: aMorph passenger ] ] ]