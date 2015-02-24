generated
scanSplitSeq34
	currentCharacter = $&
		ifTrue: [ 
			self recordMatch: #(38).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(28) ].
			^ self reportLastMatch ].
	currentCharacter = $'
		ifTrue: [ ^ self scan5 ].
	currentCharacter = $(
		ifTrue: [ ^ self recordAndReportMatch: #(81) ].
	currentCharacter = $)
		ifTrue: [ ^ self recordAndReportMatch: #(82) ].
	currentCharacter = $*
		ifTrue: [ 
			self recordMatch: #(19).
			self step.
			currentCharacter = $*
				ifTrue: [ 
					self recordMatch: #(20).
					self step.
					currentCharacter = $=
						ifTrue: [ ^ self recordAndReportMatch: #(5) ].
					^ self reportLastMatch ].
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(33) ].
			^ self reportLastMatch ].
	currentCharacter = $+
		ifTrue: [ 
			self recordMatch: #(44).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(35) ].
			^ self reportLastMatch ].
	currentCharacter = $,
		ifTrue: [ ^ self recordAndReportMatch: #(22) ].
	currentCharacter = $-
		ifTrue: [ 
			self recordMatch: #(53).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(32) ].
			^ self reportLastMatch ].
	currentCharacter = $.
		ifTrue: [ 
			self recordMatch: #(13).
			self step.
			currentCharacter isDigit
				ifTrue: [ ^ self scan9 ].
			^ self reportLastMatch ].
	currentCharacter = $/
		ifTrue: [ 
			self recordMatch: #(50).
			self step.
			currentCharacter = $/
				ifTrue: [ 
					self recordMatch: #(48).
					self step.
					currentCharacter = $=
						ifTrue: [ ^ self recordAndReportMatch: #(6) ].
					^ self reportLastMatch ].
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(30) ].
			^ self reportLastMatch ].
	currentCharacter = $0
		ifTrue: [ ^ self scanSplit26 ].
	currentCharacter = $:
		ifTrue: [ ^ self recordAndReportMatch: #(21) ].
	currentCharacter = $;
		ifTrue: [ ^ self recordAndReportMatch: #(26) ].
	currentCharacter = $<
		ifTrue: [ 
			self recordMatch: #(66).
			self step.
			currentCharacter = $<
				ifTrue: [ 
					self recordMatch: #(43).
					self step.
					currentCharacter = $=
						ifTrue: [ ^ self recordAndReportMatch: #(16) ].
					^ self reportLastMatch ].
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(45) ].
			currentCharacter = $>
				ifTrue: [ ^ self recordAndReportMatch: #(52) ].
			^ self reportLastMatch ].
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
						ifTrue: [ ^ self recordAndReportMatch: #(9) ].
					^ self reportLastMatch ].
			^ self reportLastMatch ].
	^ self scanSplitSeq33