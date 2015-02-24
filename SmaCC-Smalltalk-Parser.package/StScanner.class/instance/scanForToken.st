generated
scanForToken
	self step.
	currentCharacter = $"
		ifTrue: [ 
			self recordMatch: #(32).
			self step.
			currentCharacter = $"
				ifTrue: [ ^ self recordAndReportMatch: #(28) ].
			true
				ifTrue: [ 
					[ 
					self step.
					currentCharacter = $"
						ifTrue: [ ^ self recordAndReportMatch: #(28) ] ] repeat ].
			^ self reportLastMatch ].
	currentCharacter = $#
		ifTrue: [ ^ self recordAndReportMatch: #(1 32) ].
	currentCharacter = $$
		ifTrue: [ 
			self recordMatch: #(32).
			self step.
			^ self recordAndReportMatch: #(30) ].
	currentCharacter = $'
		ifTrue: [ 
			self recordMatch: #(32).
			self step.
			currentCharacter = $'
				ifTrue: [ ^ self scan2 ].
			^ self scan1 ].
	currentCharacter = $(
		ifTrue: [ ^ self recordAndReportMatch: #(10 32) ].
	currentCharacter = $)
		ifTrue: [ ^ self recordAndReportMatch: #(4 32) ].
	currentCharacter = $-
		ifTrue: [ 
			self recordMatch: #(26 32).
			self step.
			currentCharacter isDigit
				ifTrue: [ ^ self recordAndReportMatch: #(22) ].
			(currentCharacter = $!
				or: [ 
					(currentCharacter between: $% and: $&)
						or: [ 
							(currentCharacter between: $* and: $,)
								or: [ currentCharacter = $/ or: [ (currentCharacter between: $< and: $@) or: [ '\|~' includes: currentCharacter ] ] ] ] ])
				ifTrue: [ ^ self recordAndReportMatch: #(26) ].
			^ self reportLastMatch ].
	currentCharacter = $.
		ifTrue: [ ^ self recordAndReportMatch: #(5 32) ].
	currentCharacter = $:
		ifTrue: [ 
			self recordMatch: #(18 32).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(13) ].
			^ self reportLastMatch ].
	currentCharacter = $;
		ifTrue: [ ^ self recordAndReportMatch: #(2 32) ].
	currentCharacter = $<
		ifTrue: [ 
			self recordMatch: #(6 26 32).
			self step.
			(currentCharacter = $!
				or: [ 
					(currentCharacter between: $% and: $&)
						or: [ 
							(currentCharacter between: $* and: $,)
								or: [ currentCharacter = $/ or: [ (currentCharacter between: $< and: $@) or: [ '\|~' includes: currentCharacter ] ] ] ] ])
				ifTrue: [ ^ self recordAndReportMatch: #(26) ].
			^ self reportLastMatch ].
	^ self scanSplitSeq1