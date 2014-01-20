generated-comments
scannerDefinitionComment

	"<name> : [a-zA-Z_] \w* ;
<whitespace>	:	\s+ ;
<tokenname>	:	\< <name> \> ;
<symbolname>	:	<name>	 ;
<keyword>	:	(\"" [^\""]* \"") + ;
<comment>	:	(\# [^\r\n]*) | (\/\* [^\*]* \*+ ([^\/\*] [^\*]* \*+)* \/) ;
<code>:	\{ [^\}]+ \} ;
<variablename> :	\' <name> \' ;
<production> : \: (\: \=)? ;"