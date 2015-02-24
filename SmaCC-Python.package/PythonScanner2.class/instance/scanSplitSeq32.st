generated
scanSplitSeq32
	currentCharacter = $=
		ifTrue: [ 
			self recordMatch: #(25).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(56) ].
			^ self reportLastMatch ].
	currentCharacter = $>
		ifTrue: [ 
			self recordMatch: #(65).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(54) ].
			currentCharacter = $>
				ifTrue: [ 
					self recordMatch: #(4).
					self step.
					currentCharacter = $=
						ifTrue: [ ^ self recordAndReportMatch: #(9) ] ].
			^ self reportLastMatch ].
	currentCharacter = $@
		ifTrue: [ ^ self recordAndReportMatch: #(23) ].
	currentCharacter = $R
		ifTrue: [ ^ self scan13 ].
	currentCharacter = $[
		ifTrue: [ ^ self recordAndReportMatch: #(83) ].
	currentCharacter = $\
		ifTrue: [ 
			self step.
			currentCharacter = Character lf
				ifTrue: [ ^ self recordAndReportMatch: #(79) ].
			currentCharacter = Character cr
				ifTrue: [ 
					self recordMatch: #(79).
					self step.
					currentCharacter = Character lf
						ifTrue: [ ^ self recordAndReportMatch: #(79) ] ].
			^ self reportLastMatch ].
	currentCharacter = $]
		ifTrue: [ ^ self recordAndReportMatch: #(84) ].
	currentCharacter = $^
		ifTrue: [ 
			self recordMatch: #(37).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(34) ].
			^ self reportLastMatch ].
	currentCharacter = $`
		ifTrue: [ ^ self recordAndReportMatch: #(46) ].
	currentCharacter = $a
		ifTrue: [ ^ self scanSplit14 ].
	currentCharacter = $b
		ifTrue: [ 
			self recordMatch: #(71).
			self step.
			currentCharacter = $"
				ifTrue: [ ^ self scan1 ].
			currentCharacter = $'
				ifTrue: [ ^ self scan5 ].
			currentCharacter = $R
				ifTrue: [ ^ self scan13 ].
			currentCharacter = $r
				ifTrue: [ ^ self scanSplit12 ].
			((currentCharacter between: $0 and: $9)
				or: [ 
					(currentCharacter between: $A and: $Q)
						or: [ 
							(currentCharacter between: $S and: $Z)
								or: [ currentCharacter = $_ or: [ (currentCharacter between: $a and: $q) or: [ currentCharacter between: $s and: $z ] ] ] ] ])
				ifTrue: [ 
					[ 
					self recordMatch: #(71).
					self step.
					(currentCharacter between: $0 and: $9)
						or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
						whileTrue ].
			^ self reportLastMatch ].
	currentCharacter = $c
		ifTrue: [ ^ self scanSplit20 ].
	currentCharacter = $d
		ifTrue: [ ^ self scanSplit1 ].
	currentCharacter = $e
		ifTrue: [ ^ self scanSplit31 ].
	^ self scanSplitSeq29