generated-comments
scannerDefinitionComment

	"<name>	:	(<isLetter> | \_) (<isLetter> | [\d\_]) *;
<number>:	\d	;
<negativeNumber>	:	\- <number>	;
<string>	:	\'  [^\']* \' (\' [^\']* \')*	;
<keyword>	:	<name> \:	;
<multikeyword>	:	<name> \: (<name> \: )+	;
<binarySymbol>	:	[\~\-\!\@\%\&\*\+\=\\\|\?\/\>\<\,] [\~\!\@\%\&\*\+\=\\\|\?\/\>\<\,]?	;
<whitespace>	:	<isSeparator>+	;
<comment>	:	\"" [^\""]* \""	;
<dottedName>	:	<name> (\. <name>)+	;
<character>	:	\$ .	;
<variableAssignment> : <name> \: \=	;

<anyChar> : . ; # For VW literal arrays that handle #(;) -> #(#';')"