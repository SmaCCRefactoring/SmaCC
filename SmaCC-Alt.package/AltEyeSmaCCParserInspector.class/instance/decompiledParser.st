accessing
decompiledParser
	"Returns a decompiled version of self. For now, keep it simple."

	^ (SmaCCRParseTable for: self object) decode