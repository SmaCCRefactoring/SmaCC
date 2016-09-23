private
scanForString: aString
	^ aString
		allSatisfy: [ :each | 
			self step.
			currentCharacter == each ]