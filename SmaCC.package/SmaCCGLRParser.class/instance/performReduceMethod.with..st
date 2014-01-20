private
performReduceMethod: aSymbol with: items
	^(states size = 1 or: [parseAll])
		ifTrue:
			[1 to: items size do: [:i | items at: i put: ((items at: i) performOnSmaCCParser: self)].
			super performReduceMethod: aSymbol with: items]
		ifFalse: [SmaCCDeferredReduceAction selector: aSymbol arguments: items]