generated-comments
scannerDefinitionComment

	"<H>: [a-fA-F0-9]	;
<IS>: [uUlL]	;
<D>: [0-9]	;
<E>: [Ee][\+\-]?<D>+	;
<FS>: [fFlL]	;
<ELLIPSIS> : \.\.\. ;
<comment>: \/ \*	;
<LETTER> : [a-zA-Z_] ;
<DIGIT> : [0-9] ;
<IDENTIFIER>: <LETTER> (<LETTER>|<DIGIT>)*	;
<CONSTANT>: (0[xX]<H>+<IS>?) | 
				(<D>+<IS>?) | 
				(<D>+<E><FS>?) | 
				<D>*\.<D>+<E>?<FS>? | 
				(L? \' ( (\\ .) | ([^\\\""]) )+ \')	;

<STRING_LITERAL>: L? \"" ( (\\ .) | ([^\\\""]) )* \""	;

<LEFT_BLOCK>: \[ | (\< \:)	;
<RIGHT_BLOCK>: \] | (\: \>)	;
<LEFT_BRACE>: \{ | (\< \%)	;
<RIGHT_BRACE>: \} | (\% \>)	;

<whitespace>: \s+	;"