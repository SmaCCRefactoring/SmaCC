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
	paLine addMorphBack: self buildPackageMorph.
	scLine addMorphBack: self buildScannerClassMorph.
	psLine addMorphBack: self buildParserClassMorph.
	paLine addMorphBack: AlignmentMorph newVariableTransparentSpacer.
	scLine addMorphBack: AlignmentMorph newVariableTransparentSpacer.
	psLine addMorphBack: AlignmentMorph newVariableTransparentSpacer.
	aCompilePage
		addMorph: psLine;
		addMorph: scLine;
		addMorph: paLine