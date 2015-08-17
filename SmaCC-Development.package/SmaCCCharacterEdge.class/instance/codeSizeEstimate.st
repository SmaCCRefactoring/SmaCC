compiling
codeSizeEstimate
	| last size |
	size := 1.
	last := transitionObjects first asInteger - 1.
	transitionObjects
		do: [ :each | 
			each asInteger - 1 = last
				ifFalse: [ size := size + 1 ].
			last := each asInteger ].
	^ size * 8 + 4