*smacc-alt
altDebuggerExtensions: anAltDebugger
	"Actions for a parser."

	| aButton |
	aButton := PluggableButtonMorph
		on: (AltSmaCCStepToNextReduce on: anAltDebugger)
		getState: nil
		action: #execute.
	aButton
		hResizing: #spaceFill;
		vResizing: #shrinkWrap;
		label: 'Step to next reduce'.
	^ Array with: aButton