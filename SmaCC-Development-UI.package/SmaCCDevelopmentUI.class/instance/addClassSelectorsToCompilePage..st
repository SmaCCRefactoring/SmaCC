initialize-release
addClassSelectorsToCompilePage: aCompilePage
	"The scanner class hasn't got the same meaning as before, since the definition is for both scanner and parser at the same time. Left it for now, since it allows the reuse of a scanner class later on."

	| scLine psLine |
	scLine := AlignmentMorph newRow
		color: Color transparent;
		vResizing: #shrinkWrap.
	psLine := AlignmentMorph newRow
		color: Color transparent;
		vResizing: #shrinkWrap.
	scLine addMorphBack: ('Scanner class:' asMorph hResizing: #spaceFill).
	psLine addMorphBack: ('Parser class:' asMorph hResizing: #spaceFill).
	findScannerClassButton := PluggableButtonMorph on: self getState: nil action: #findScannerClass.
	findScannerClassButton label: ' ... '.
	findParserClassButton := PluggableButtonMorph on: self getState: nil action: #findParserClass.
	findParserClassButton label: ' ... '.
	scLine
		addMorphBack:
			(scannerClassMorph := TextMorph new
				newContents: '';
				extent: 300 @ 70).
	scannerClassMorph on: #keyStroke send: #updateWindowLabel to: self.
	scannerClassMorph addDependent: self.
	psLine
		addMorphBack:
			(parserClassMorph := TextMorph new
				newContents: '';
				extent: 300 @ 70).
	parserClassMorph on: #keyStroke send: #updateWindowLabel to: self.
	parserClassMorph addDependent: self.
	scLine
		addMorphBack: findScannerClassButton;
		addMorphBack: AlignmentMorph newVariableTransparentSpacer.
	psLine
		addMorphBack: findParserClassButton;
		addMorphBack: AlignmentMorph newVariableTransparentSpacer.
	aCompilePage
		addMorph: psLine;
		addMorph: scLine