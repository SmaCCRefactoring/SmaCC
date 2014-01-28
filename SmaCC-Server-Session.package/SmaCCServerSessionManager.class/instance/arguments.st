public
arguments
	| arguments |
	arguments := OrderedCollection new.
	2
		to: self argc
		do:
			[:i | 
			| arg |
			arg := self argv at: i.
			('/-' includes: arg first) ifFalse: [arguments add: arg]].
	^arguments