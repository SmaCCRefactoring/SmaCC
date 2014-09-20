generated
scan53
	self step.
	currentCharacter = $0
		ifTrue: [ 
			self step.
			currentCharacter = $x
				ifTrue: [ 
					self step.
					currentCharacter isHexDigit
						ifTrue: [ 
							[ 
							self recordMatch: #(249).
							self step.
							currentCharacter isHexDigit ] whileTrue ] ].
			^ self reportLastMatch ].
	currentCharacter = $a
		ifTrue: [ ^ self scan54 ].
	currentCharacter = $d
		ifTrue: [ 
			self step.
			currentCharacter = $i
				ifTrue: [ 
					self step.
					currentCharacter = $v
						ifTrue: [ ^ self recordAndReportMatch: #(109) ] ].
			^ self reportLastMatch ].
	currentCharacter = $e
		ifTrue: [ ^ self scan55 ].
	currentCharacter = $g
		ifTrue: [ 
			self step.
			currentCharacter = $e
				ifTrue: [ ^ self recordAndReportMatch: #(238) ].
			currentCharacter = $t
				ifTrue: [ ^ self recordAndReportMatch: #(236) ].
			^ self reportLastMatch ].
	currentCharacter = $h
		ifTrue: [ ^ self scan56 ].
	currentCharacter = $i
		ifTrue: [ ^ self scan57 ].
	currentCharacter = $l
		ifTrue: [ 
			self step.
			currentCharacter = $e
				ifTrue: [ ^ self recordAndReportMatch: #(233) ].
			currentCharacter = $t
				ifTrue: [ ^ self recordAndReportMatch: #(234) ].
			^ self reportLastMatch ].
	currentCharacter = $p
		ifTrue: [ ^ self scan58 ].
	currentCharacter = $r
		ifTrue: [ 
			self step.
			currentCharacter = $e
				ifTrue: [ 
					self step.
					currentCharacter = $m
						ifTrue: [ ^ self recordAndReportMatch: #(101) ].
					currentCharacter = $t
						ifTrue: [ ^ self recordAndReportMatch: #(145) ] ].
			^ self reportLastMatch ].
	currentCharacter = $s
		ifTrue: [ ^ self scan59 ].
	currentCharacter = $t
		ifTrue: [ 
			self step.
			currentCharacter = $o
				ifTrue: [ 
					self step.
					currentCharacter = $r
						ifTrue: [ 
							self step.
							currentCharacter = $e
								ifTrue: [ ^ self recordAndReportMatch: #(203) ] ] ].
			^ self reportLastMatch ].
	currentCharacter = $u
		ifTrue: [ 
			self step.
			currentCharacter = $b
				ifTrue: [ ^ self recordAndReportMatch: #(116) ].
			^ self reportLastMatch ].
	currentCharacter = $w
		ifTrue: [ 
			self step.
			currentCharacter = $i
				ifTrue: [ 
					self step.
					currentCharacter = $t
						ifTrue: [ 
							self step.
							currentCharacter = $c
								ifTrue: [ 
									self step.
									currentCharacter = $h
										ifTrue: [ ^ self recordAndReportMatch: #(57) ] ] ] ] ].
	^ self reportLastMatch