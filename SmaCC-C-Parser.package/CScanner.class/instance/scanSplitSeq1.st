generated
scanSplitSeq1
	currentCharacter = $=
		ifTrue: [ 
			self recordMatch: #(12).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(4) ].
			^ self reportLastMatch ].
	currentCharacter = $>
		ifTrue: [ 
			self recordMatch: #(7).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(3) ].
			currentCharacter = $>
				ifTrue: [ 
					self recordMatch: #(18).
					self step.
					currentCharacter = $=
						ifTrue: [ ^ self recordAndReportMatch: #(63) ] ].
			^ self reportLastMatch ].
	currentCharacter = $?
		ifTrue: [ ^ self recordAndReportMatch: #(16) ].
	currentCharacter = $L
		ifTrue: [ 
			self recordMatch: #(76).
			self step.
			currentCharacter = $"
				ifTrue: [ ^ self scan1 ].
			currentCharacter = $'
				ifTrue: [ ^ self scan2 ].
			((currentCharacter between: $0 and: $9)
				or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ] ])
				ifTrue: [ 
					[ 
					self recordMatch: #(76).
					self step.
					(currentCharacter between: $0 and: $9)
						or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
						whileTrue ].
			^ self reportLastMatch ].
	currentCharacter = $[
		ifTrue: [ ^ self recordAndReportMatch: #(79) ].
	currentCharacter = $]
		ifTrue: [ ^ self recordAndReportMatch: #(80) ].
	currentCharacter = $^
		ifTrue: [ 
			self recordMatch: #(2).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(59) ].
			^ self reportLastMatch ].
	currentCharacter = ${
		ifTrue: [ ^ self recordAndReportMatch: #(81) ].
	currentCharacter = $|
		ifTrue: [ 
			self recordMatch: #(5).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(60) ].
			currentCharacter = $|
				ifTrue: [ ^ self recordAndReportMatch: #(15) ].
			^ self reportLastMatch ].
	currentCharacter = $}
		ifTrue: [ ^ self recordAndReportMatch: #(82) ].
	currentCharacter = $~
		ifTrue: [ ^ self recordAndReportMatch: #(32) ].
	currentCharacter isDigit
		ifTrue: [ ^ self scan10 ].
	(currentCharacter isSeparator or: [ currentCharacter = Character pageUp ])
		ifTrue: [ 
			[ 
			self recordMatch: #(83).
			self step.
			currentCharacter isSeparator or: [ currentCharacter = Character pageUp ] ] whileTrue.
			^ self reportLastMatch ].
	currentCharacter isSafeForHTTP
		ifTrue: [ 
			[ 
			self recordMatch: #(76).
			self step.
			(currentCharacter between: $0 and: $9)
				or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
				whileTrue ].
	^ self reportLastMatch