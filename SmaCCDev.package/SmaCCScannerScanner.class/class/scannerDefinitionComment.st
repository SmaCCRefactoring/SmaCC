generated-comments
scannerDefinitionComment

	"<backslashcharacter>	:	\\ [^cx] | \\ c [A-Z] | \\ x [0-9A-Fa-f]{1,4} ;
<characterblock>	: \[ ([^\]\\] | <backslashcharacter> )+ \] ;
<whitespace>	:	[\ \t\v\r\n]+ ;
<tokenname>	:	\< [a-zA-Z_] \w* \> ;
<comment>	:	(\# [^\r\n]*) | (\/\* [^\*]* \*+ ([^\/\*] [^\*]* \*+)* \/) ;
<repeat>	:	\{ [0-9]* \, [0-9]* \} ;
<symbol> : [a-zA-Z_] \w* ;
<character>	:	[^\ \t\v\\\r\n\{\(\[\.] ; 
<anycharacter>	: \. ;"