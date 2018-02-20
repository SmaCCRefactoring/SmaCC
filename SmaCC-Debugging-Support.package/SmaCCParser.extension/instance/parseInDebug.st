*smacc-debugging-support
parseInDebug
	"Creates a process around self parse, step into that process three times (to be inside SmaCCParser>>#parse) and open the SmaCC debugger directly on it. Not sure the defer is necessary there, I do not do everything the normal debugger does when triggered."

	| context process debugSession |
	process := [ self parse ] newProcess
		priority: Processor userBackgroundPriority;
		yourself.
	context := process suspendedContext.
	debugSession := SmaCCParserDebugger
		spanNewSessionLabeled: 'Parser debugging'
		forContext: context
		fromProcess: process.
	3 timesRepeat: [ debugSession stepInto ].
	UIManager default
		defer: [ (SmaCCParserDebugger on: debugSession) openWithFullView ]