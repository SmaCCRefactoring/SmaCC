generated
scan27
	self step.
	currentCharacter = Character newPage
		ifTrue: [ 
			self recordMatch: #(28 41).
			self step.
			(currentCharacter isWhitespace or: [ currentCharacter = Character pageUp ])
				ifTrue: [ 
					[ 
					self recordMatch: #(28).
					self step.
					currentCharacter isWhitespace or: [ currentCharacter = Character pageUp ] ] whileTrue ].
			^ self reportLastMatch ].
	currentCharacter = $"
		ifTrue: [ 
			self recordMatch: #(41).
			self step.
			currentCharacter = $"
				ifTrue: [ ^ self scan2 ].
			^ self scan1 ].
	currentCharacter = $#
		ifTrue: [ 
			self recordMatch: #(32 41).
			self step.
			(currentCharacter <= Character tab
				or: [ (currentCharacter between: Character pageUp and: Character newPage) or: [ currentCharacter >= (Character value: 14) ] ])
				ifTrue: [ 
					[ 
					self recordMatch: #(32).
					self step.
					currentCharacter <= Character tab
						or: [ (currentCharacter between: Character pageUp and: Character newPage) or: [ currentCharacter >= (Character value: 14) ] ] ]
						whileTrue ].
			^ self reportLastMatch ].
	currentCharacter = $%
		ifTrue: [ 
			self recordMatch: #(36 41).
			self step.
			currentCharacter = $>
				ifTrue: [ ^ self recordAndReportMatch: #(9) ].
			^ self reportLastMatch ].
	currentCharacter = $'
		ifTrue: [ 
			self recordMatch: #(41).
			self step.
			(currentCharacter isLetter or: [ currentCharacter = $_ ])
				ifTrue: [ ^ self scan5 ].
			^ self reportLastMatch ].
	currentCharacter = $(
		ifTrue: [ ^ self recordAndReportMatch: #(3) ].
	currentCharacter = $)
		ifTrue: [ ^ self recordAndReportMatch: #(8 41) ].
	currentCharacter = $*
		ifTrue: [ ^ self recordAndReportMatch: #(2 41) ].
	currentCharacter = $+
		ifTrue: [ ^ self recordAndReportMatch: #(1 41) ].
	currentCharacter = $.
		ifTrue: [ ^ self recordAndReportMatch: #(42) ].
	currentCharacter = $/
		ifTrue: [ 
			self recordMatch: #(41).
			self step.
			currentCharacter = $*
				ifTrue: [ ^ self scan7 ].
			^ self reportLastMatch ].
	currentCharacter = $:
		ifTrue: [ 
			self recordMatch: #(35 41).
			self step.
			currentCharacter = $:
				ifTrue: [ ^ self scan9 ].
			^ self reportLastMatch ].
	currentCharacter = $;
		ifTrue: [ ^ self recordAndReportMatch: #(37 41) ].
	currentCharacter = $<
		ifTrue: [ 
			self recordMatch: #(41).
			self step.
			currentCharacter = $%
				ifTrue: [ ^ self recordAndReportMatch: #(11) ].
			(currentCharacter isLetter or: [ currentCharacter = $_ ])
				ifTrue: [ ^ self scan11 ].
			^ self reportLastMatch ].
	currentCharacter = $?
		ifTrue: [ ^ self recordAndReportMatch: #(5 41) ].
	currentCharacter = $[
		ifTrue: [ 
			self recordMatch: #(7).
			self step.
			currentCharacter = $\
				ifTrue: [ ^ self scan30 ].
			(currentCharacter <= $[ or: [ currentCharacter >= $^ ])
				ifTrue: [ ^ self scan29 ].
			^ self reportLastMatch ].
	currentCharacter = $\
		ifTrue: [ ^ self scan31 ].
	currentCharacter = $]
		ifTrue: [ ^ self recordAndReportMatch: #(6 41) ].
	currentCharacter = $e
		ifTrue: [ ^ self scan32 ].
	currentCharacter = ${
		ifTrue: [ ^ self scan33 ].
	currentCharacter = $|
		ifTrue: [ ^ self recordAndReportMatch: #(4 41) ].
	(currentCharacter isWhitespace or: [ currentCharacter = Character pageUp ])
		ifTrue: [ 
			[ 
			self recordMatch: #(28).
			self step.
			currentCharacter isWhitespace or: [ currentCharacter = Character pageUp ] ] whileTrue.
			^ self reportLastMatch ].
	(currentCharacter isLetter or: [ currentCharacter = $_ ])
		ifTrue: [ ^ self scan28 ].
	^ self recordAndReportMatch: #(41)