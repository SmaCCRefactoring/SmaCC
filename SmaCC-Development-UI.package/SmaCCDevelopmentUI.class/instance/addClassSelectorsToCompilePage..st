initialize-release
addClassSelectorsToCompilePage: aCompilePage
	"The scanner class hasn't got the same meaning as before, since the definition is for both scanner and parser at the same time. Left it for now, since it allows the reuse of a scanner class later on."

	| scLine psLine paLine packageButton scannerClassButton parserClassButton |
	paLine := AlignmentMorph newRow
		color: Color transparent;
		vResizing: #shrinkWrap.
	scLine := AlignmentMorph newRow
		color: Color transparent;
		vResizing: #shrinkWrap.
	psLine := AlignmentMorph newRow
		color: Color transparent;
		vResizing: #shrinkWrap.
	paLine addMorphBack: ('Package:' asMorph hResizing: #spaceFill).
	scLine addMorphBack: ('Scanner class:' asMorph hResizing: #spaceFill).
	psLine addMorphBack: ('Parser class:' asMorph hResizing: #spaceFill).
	packageButton := PluggableButtonMorph on: self getState: nil action: #findPackage.
	packageButton label: ' ... '.
	scannerClassButton := PluggableButtonMorph on: self getState: nil action: #findScannerClass.
	scannerClassButton label: ' ... '.
	parserClassButton := PluggableButtonMorph on: self getState: nil action: #findParserClass.
	parserClassButton label: ' ... '.
	paLine
		addMorphBack:
			(packageMorph := TextMorph new
				newContents: 'SmaCC-Tutorial';
				extent: 300 @ 70).
	packageMorph addDependent: self.
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
	paLine
		addMorphBack: packageButton;
		addMorphBack: AlignmentMorph newVariableTransparentSpacer.

	scLine
		addMorphBack: scannerClassButton;
		addMorphBack: AlignmentMorph newVariableTransparentSpacer.
	psLine
		addMorphBack: parserClassButton;
		addMorphBack: AlignmentMorph newVariableTransparentSpacer.
	aCompilePage
		addMorph: psLine;
		addMorph: scLine;
		addMorph: paLine