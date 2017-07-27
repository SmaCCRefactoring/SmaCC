actions
parseInDebug
	| link class |
	class := self parserClass superclass.
	link := MetaLink new
		metaObject: Halt;
		selector: #now;
		control: #before.
	(class >> #performParsingLoop) ast link: link.
	[ self parse ]
		ensure: [ link uninstall ]