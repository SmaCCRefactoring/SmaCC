initialize-release
addClassSelectorsToCompilePage: aCompilePage 
	| aScannerLabel aParserLabel |
	aScannerLabel := 'Scanner class:' asMorph position: 10 @ 10.
	aParserLabel := 'Parser class:' asMorph position: 10 @ 30.
	findScannerClassButton := PluggableButtonMorph
				on: self
				getState: nil
				action: #findScannerClass.
	findScannerClassButton label: ' ... ';
		 position: 410 @ 6.
	findParserClassButton := PluggableButtonMorph
				on: self
				getState: nil
				action: #findParserClass.
	findParserClassButton label: ' ... ';
		 position: 410 @ 26.
	scannerClassMorph := TextMorph new 
		newContents: '';
		extent: 300 @ 70;
		position: 100 @ 8.
	scannerClassMorph
		on: #keyStroke
		send: #updateWindowLabel
		to: self.
	scannerClassMorph addDependent: self.
	parserClassMorph := TextMorph new
		newContents: '';
		extent: 300 @ 70;
		position: 100 @ 28.
	parserClassMorph
		on: #keyStroke
		send: #updateWindowLabel
		to: self.
	parserClassMorph addDependent: self.
	{aScannerLabel. aParserLabel. scannerClassMorph. parserClassMorph. findScannerClassButton. findParserClassButton}
		do: [:e | aCompilePage addMorph: e]