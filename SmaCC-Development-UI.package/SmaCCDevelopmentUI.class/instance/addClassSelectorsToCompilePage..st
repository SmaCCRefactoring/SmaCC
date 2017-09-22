initialize-release
addClassSelectorsToCompilePage: aCompilePage
	"The scanner class hasn't got the same meaning as before, since the definition is for both scanner and parser at the same time. Left it for now, since it allows the reuse of a scanner class later on."

	| paLine packageButton scannerClassButton parserClassButton |
	paLine := AlignmentMorph newRow
		color: Color transparent;
		vResizing: #shrinkWrap.
	paLine addMorphBack: 'Package:' asMorph.
	paLine addMorphBack: self buildPackageMorph.
	paLine addMorphBack: '    Scanner:' asMorph.
	paLine addMorphBack: self buildScannerClassMorph.
	paLine addMorphBack: '    Parser:' asMorph.
	paLine addMorphBack: self buildParserClassMorph.
	aCompilePage addMorph: paLine