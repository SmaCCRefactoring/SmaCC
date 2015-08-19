generated
scanForToken
	self step.
	currentCharacter = $!
		ifTrue: [ 
			self recordMatch: #(102).
			self step.
			currentCharacter = $"
				ifTrue: [ 
					[ 
					self step.
					currentCharacter = $"
						ifTrue: [ ^ self recordAndReportMatch: #(263) ] ] repeat ].
			currentCharacter isDigit
				ifTrue: [ 
					[ 
					self recordMatch: #(258).
					self step.
					currentCharacter isDigit ] whileTrue.
					^ self reportLastMatch ].
			(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
				ifTrue: [ 
					[ 
					self recordMatch: #(259).
					self step.
					currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ] ] whileTrue ].
			^ self reportLastMatch ].
	currentCharacter = $"
		ifTrue: [ 
			[ 
			self step.
			currentCharacter = $"
				ifTrue: [ 
					self recordMatch: #(253).
					self step.
					currentCharacter = $:
						ifTrue: [ ^ self recordAndReportMatch: #(257) ].
					^ self reportLastMatch ] ] repeat ].
	currentCharacter = $#
		ifTrue: [ 
			self step.
			currentCharacter isDigit
				ifTrue: [ 
					[ 
					self recordMatch: #(260).
					self step.
					currentCharacter isDigit ] whileTrue.
					^ self reportLastMatch ].
			(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
				ifTrue: [ 
					[ 
					self recordMatch: #(260).
					self step.
					currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ] ] whileTrue ].
			^ self reportLastMatch ].
	currentCharacter = $%
		ifTrue: [ 
			self step.
			currentCharacter = $"
				ifTrue: [ 
					[ 
					self step.
					currentCharacter = $"
						ifTrue: [ ^ self recordAndReportMatch: #(256) ] ] repeat ].
			currentCharacter isDigit
				ifTrue: [ 
					[ 
					self recordMatch: #(256).
					self step.
					currentCharacter isDigit ] whileTrue.
					^ self reportLastMatch ].
			(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
				ifTrue: [ 
					[ 
					self recordMatch: #(256).
					self step.
					currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ] ] whileTrue ].
			^ self reportLastMatch ].
	currentCharacter = $(
		ifTrue: [ ^ self recordAndReportMatch: #(66) ].
	currentCharacter = $)
		ifTrue: [ ^ self recordAndReportMatch: #(64) ].
	currentCharacter = $*
		ifTrue: [ ^ self recordAndReportMatch: #(151) ].
	currentCharacter = $+
		ifTrue: [ 
			self step.
			currentCharacter isDigit
				ifTrue: [ 
					[ 
					self recordMatch: #(261).
					self step.
					currentCharacter = $.
						ifTrue: [ ^ self scan2 ].
					currentCharacter isDigit ] whileTrue ].
			^ self reportLastMatch ].
	currentCharacter = $,
		ifTrue: [ ^ self recordAndReportMatch: #(69) ].
	currentCharacter = $-
		ifTrue: [ ^ self scan4 ].
	currentCharacter = $.
		ifTrue: [ 
			self step.
			currentCharacter = $.
				ifTrue: [ 
					self step.
					currentCharacter = $.
						ifTrue: [ 
							self recordMatch: #(28).
							self step ] ].
			currentCharacter = $:
				ifTrue: [ ^ self recordAndReportMatch: #(257) ].
			(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
				ifTrue: [ ^ self scan1 ].
			^ self reportLastMatch ].
	^ self scanSplitSeq1