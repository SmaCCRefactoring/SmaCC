compiling-scanner
codeSizeEstimate: methodStates
	"Estimate how many bytecodes will be generated from this node and its containing nodes."

	^ 8
		+
			(self transitions
				inject: 0
				into:
					[ :sum :each | 
					sum
						+
							(each codeSizeEstimate
								+
									((self == each to or: [ methodStates includes: each to ])
										ifTrue: [ 4 ]
										ifFalse: [ each to codeSizeEstimate: methodStates ])) ])