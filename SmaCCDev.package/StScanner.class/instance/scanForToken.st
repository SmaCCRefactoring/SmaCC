generated-scanner
scanForToken
	self step.
	((currentCharacter between: $A and: $Z)
		or: [ 
			currentCharacter = $_
				or: [ 
					(currentCharacter between: $a and: $z)
						or: [ 
							currentCharacter = $ª
								or: [ 
									currentCharacter = $µ
										or: [ 
											currentCharacter = $º
												or: [ (currentCharacter between: $À and: $Ö) or: [ (currentCharacter between: $Ø and: $ö) or: [ currentCharacter >= $ø ] ] ] ] ] ] ] ])
		ifTrue: [ 
			self recordMatch: #(20 32).
			self step.
			((currentCharacter between: $0 and: $9)
				or: [ 
					(currentCharacter between: $A and: $Z)
						or: [ 
							currentCharacter = $_
								or: [ 
									(currentCharacter between: $a and: $z)
										or: [ 
											currentCharacter = $ª
												or: [ 
													currentCharacter = $µ
														or: [ 
															currentCharacter = $º
																or: [ (currentCharacter between: $À and: $Ö) or: [ (currentCharacter between: $Ø and: $ö) or: [ currentCharacter >= $ø ] ] ] ] ] ] ] ] ])
				ifTrue: [ 
					[ 
					self recordMatch: #(20).
					self step.
					(currentCharacter between: $0 and: $9)
						or: [ 
							(currentCharacter between: $A and: $Z)
								or: [ 
									currentCharacter = $_
										or: [ 
											(currentCharacter between: $a and: $z)
												or: [ 
													currentCharacter = $ª
														or: [ 
															currentCharacter = $µ
																or: [ 
																	currentCharacter = $º
																		or: [ (currentCharacter between: $À and: $Ö) or: [ (currentCharacter between: $Ø and: $ö) or: [ currentCharacter >= $ø ] ] ] ] ] ] ] ] ] ]
						whileTrue.
					currentCharacter = $:
						ifTrue: [ ^ self scan3 ].
					currentCharacter = $.
						ifTrue: [ ^ self scan5 ].
					^ self reportLastMatch ].
			currentCharacter = $:
				ifTrue: [ ^ self scan3 ].
			currentCharacter = $.
				ifTrue: [ ^ self scan5 ].
			^ self reportLastMatch ].
	((currentCharacter between: Character tab and: Character lf)
		or: [ (currentCharacter between: Character newPage and: Character cr) or: [ currentCharacter = Character space ] ])
		ifTrue: [ 
			self recordMatch: #whitespace.
			self step.
			((currentCharacter between: Character tab and: Character lf)
				or: [ (currentCharacter between: Character newPage and: Character cr) or: [ currentCharacter = Character space ] ])
				ifTrue: [ 
					[ 
					self recordMatch: #whitespace.
					self step.
					(currentCharacter between: Character tab and: Character lf)
						or: [ (currentCharacter between: Character newPage and: Character cr) or: [ currentCharacter = Character space ] ] ]
						whileTrue.
					^ self reportLastMatch ].
			^ self reportLastMatch ].
	(currentCharacter between: $0 and: $9)
		ifTrue: [ ^ self recordAndReportMatch: #number ].
	currentCharacter = $:
		ifTrue: [ 
			self recordMatch: #(18 32).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(13) ].
			^ self reportLastMatch ].
	currentCharacter = $.
		ifTrue: [ ^ self recordAndReportMatch: #(5 32) ].
	(currentCharacter = $!
		or: [ 
			(currentCharacter between: $% and: $&)
				or: [ 
					(currentCharacter between: $* and: $,)
						or: [ 
							currentCharacter = $/
								or: [ 
									currentCharacter = $=
										or: [ (currentCharacter between: $? and: $@) or: [ currentCharacter = $\ or: [ currentCharacter = $~ ] ] ] ] ] ] ])
		ifTrue: [ 
			self recordMatch: #(26 32).
			self step.
			(currentCharacter = $!
				or: [ 
					(currentCharacter between: $% and: $&)
						or: [ 
							(currentCharacter between: $* and: $,)
								or: [ 
									currentCharacter = $/
										or: [ 
											(currentCharacter between: $< and: $@)
												or: [ currentCharacter = $\ or: [ currentCharacter = $| or: [ currentCharacter = $~ ] ] ] ] ] ] ])
				ifTrue: [ ^ self recordAndReportMatch: #(26) ].
			^ self reportLastMatch ].
	currentCharacter = $#
		ifTrue: [ ^ self recordAndReportMatch: #(1 32) ].
	currentCharacter = $]
		ifTrue: [ ^ self recordAndReportMatch: #(19 32) ].
	currentCharacter = $[
		ifTrue: [ ^ self recordAndReportMatch: #(17 32) ].
	currentCharacter = $(
		ifTrue: [ ^ self recordAndReportMatch: #(10 32) ].
	currentCharacter = $)
		ifTrue: [ ^ self recordAndReportMatch: #(4 32) ].
	currentCharacter = $"
		ifTrue: [ 
			self recordMatch: #(32).
			self step.
			currentCharacter ~= $"
				ifTrue: [ 
					[ 
					self step.
					currentCharacter ~= $" ] whileTrue.
					currentCharacter = $"
						ifTrue: [ ^ self recordAndReportMatch: #comment ].
					^ self reportLastMatch ].
			currentCharacter = $"
				ifTrue: [ ^ self recordAndReportMatch: #comment ].
			^ self reportLastMatch ].
	currentCharacter = $'
		ifTrue: [ 
			self recordMatch: #(32).
			self step.
			currentCharacter ~= $'
				ifTrue: [ ^ self scan1 ].
			currentCharacter = $'
				ifTrue: [ ^ self scan2 ].
			^ self reportLastMatch ].
	currentCharacter = $^
		ifTrue: [ ^ self recordAndReportMatch: #(16 32) ].
	currentCharacter = $|
		ifTrue: [ 
			self recordMatch: #(9 26 32).
			self step.
			(currentCharacter = $!
				or: [ 
					(currentCharacter between: $% and: $&)
						or: [ 
							(currentCharacter between: $* and: $,)
								or: [ 
									currentCharacter = $/
										or: [ 
											(currentCharacter between: $< and: $@)
												or: [ currentCharacter = $\ or: [ currentCharacter = $| or: [ currentCharacter = $~ ] ] ] ] ] ] ])
				ifTrue: [ ^ self recordAndReportMatch: #(26) ].
			^ self reportLastMatch ].
	currentCharacter = $;
		ifTrue: [ ^ self recordAndReportMatch: #(2 32) ].
	currentCharacter = $-
		ifTrue: [ 
			self recordMatch: #(26 32).
			self step.
			(currentCharacter between: $0 and: $9)
				ifTrue: [ ^ self recordAndReportMatch: #negativeNumber ].
			(currentCharacter = $!
				or: [ 
					(currentCharacter between: $% and: $&)
						or: [ 
							(currentCharacter between: $* and: $,)
								or: [ 
									currentCharacter = $/
										or: [ 
											(currentCharacter between: $< and: $@)
												or: [ currentCharacter = $\ or: [ currentCharacter = $| or: [ currentCharacter = $~ ] ] ] ] ] ] ])
				ifTrue: [ ^ self recordAndReportMatch: #(26) ].
			^ self reportLastMatch ].
	currentCharacter = $>
		ifTrue: [ 
			self recordMatch: #(7 26 32).
			self step.
			(currentCharacter = $!
				or: [ 
					(currentCharacter between: $% and: $&)
						or: [ 
							(currentCharacter between: $* and: $,)
								or: [ 
									currentCharacter = $/
										or: [ 
											(currentCharacter between: $< and: $@)
												or: [ currentCharacter = $\ or: [ currentCharacter = $| or: [ currentCharacter = $~ ] ] ] ] ] ] ])
				ifTrue: [ ^ self recordAndReportMatch: #(26) ].
			^ self reportLastMatch ].
	currentCharacter = $<
		ifTrue: [ 
			self recordMatch: #(6 26 32).
			self step.
			(currentCharacter = $!
				or: [ 
					(currentCharacter between: $% and: $&)
						or: [ 
							(currentCharacter between: $* and: $,)
								or: [ 
									currentCharacter = $/
										or: [ 
											(currentCharacter between: $< and: $@)
												or: [ currentCharacter = $\ or: [ currentCharacter = $| or: [ currentCharacter = $~ ] ] ] ] ] ] ])
				ifTrue: [ ^ self recordAndReportMatch: #(26) ].
			^ self reportLastMatch ].
	currentCharacter = $}
		ifTrue: [ ^ self recordAndReportMatch: #(8 32) ].
	currentCharacter = ${
		ifTrue: [ ^ self recordAndReportMatch: #(3 32) ].
	(currentCharacter <= Character backspace
		or: [ 
			currentCharacter = Character pageUp
				or: [ 
					(currentCharacter between: (Character value: 14) and: Character arrowDown)
						or: [ 
							currentCharacter = $`
								or: [ 
									(currentCharacter between: $ and: $©)
										or: [ 
											(currentCharacter between: $« and: $´)
												or: [ 
													(currentCharacter between: $¶ and: $¹)
														or: [ (currentCharacter between: $» and: $¿) or: [ currentCharacter = $× or: [ currentCharacter = $÷ ] ] ] ] ] ] ] ] ])
		ifTrue: [ ^ self recordAndReportMatch: #(32) ].
	currentCharacter = $$
		ifTrue: [ 
			self recordMatch: #(32).
			self step.
			currentCharacter <= $ÿ
				ifTrue: [ ^ self recordAndReportMatch: #(30) ].
			^ self reportLastMatch ].
	^ self reportLastMatch