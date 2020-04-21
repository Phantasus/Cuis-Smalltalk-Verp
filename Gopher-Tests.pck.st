'From Cuis 5.0 [latest update: #4112] on 21 April 2020 at 8:41:21 pm'!
'Description Contains tests for the Gopher package.


License: MIT License
Porter: Josef Philip Bernhart <cuis-packages@phantasus.at>'!
!provides: 'Gopher-Tests' 1 0!
SystemOrganization addCategory: #'Gopher-Tests'!


!classDefinition: #GifItemTest category: #'Gopher-Tests'!
TestCase subclass: #GifItemTest
	instanceVariableNames: 'usedClass'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Gopher-Tests'!
!classDefinition: 'GifItemTest class' category: #'Gopher-Tests'!
GifItemTest class
	instanceVariableNames: ''!

!classDefinition: #GopherItemTest category: #'Gopher-Tests'!
TestCase subclass: #GopherItemTest
	instanceVariableNames: 'usedClass'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Gopher-Tests'!
!classDefinition: 'GopherItemTest class' category: #'Gopher-Tests'!
GopherItemTest class
	instanceVariableNames: ''!

!classDefinition: #GopherUriTest category: #'Gopher-Tests'!
TestCase subclass: #GopherUriTest
	instanceVariableNames: 'usedClass'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Gopher-Tests'!
!classDefinition: 'GopherUriTest class' category: #'Gopher-Tests'!
GopherUriTest class
	instanceVariableNames: ''!

!classDefinition: #ImageItemTest category: #'Gopher-Tests'!
TestCase subclass: #ImageItemTest
	instanceVariableNames: 'usedClass'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Gopher-Tests'!
!classDefinition: 'ImageItemTest class' category: #'Gopher-Tests'!
ImageItemTest class
	instanceVariableNames: ''!

!classDefinition: #InfoItemTest category: #'Gopher-Tests'!
TestCase subclass: #InfoItemTest
	instanceVariableNames: 'usedClass'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Gopher-Tests'!
!classDefinition: 'InfoItemTest class' category: #'Gopher-Tests'!
InfoItemTest class
	instanceVariableNames: ''!

!classDefinition: #MenuItemTest category: #'Gopher-Tests'!
TestCase subclass: #MenuItemTest
	instanceVariableNames: 'usedClass'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Gopher-Tests'!
!classDefinition: 'MenuItemTest class' category: #'Gopher-Tests'!
MenuItemTest class
	instanceVariableNames: ''!

!classDefinition: #TextFileItemTest category: #'Gopher-Tests'!
TestCase subclass: #TextFileItemTest
	instanceVariableNames: 'usedClass'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Gopher-Tests'!
!classDefinition: 'TextFileItemTest class' category: #'Gopher-Tests'!
TextFileItemTest class
	instanceVariableNames: ''!


!GifItemTest methodsFor: 'as yet unclassified' stamp: 'jpb 1/19/2020 13:53:36'!
setUp
	usedClass _ GopherGifItem ! !

!GifItemTest methodsFor: 'as yet unclassified' stamp: 'jpb 1/19/2020 14:25:11'!
testPrinting
	| item stream |
	item _ usedClass new.
	stream _ WriteStream on: ''.
	item host: 'localhost'; port: 70; selector: 'Test'; description: 'Something'.
	
	item printOn: stream.
	
	self assert: '[ ? ] Something' , String newLineString
		 equals: stream contents asString.! !

!GifItemTest methodsFor: 'as yet unclassified' stamp: 'jpb 1/19/2020 14:25:33'!
testPrintingWhenDescriptionIsEmpty
	| item stream |
	item _ usedClass new.
	stream _ WriteStream on: ''.
	item host: 'localhost'; port: 70; selector: 'Test'.
	
	item printOn: stream.
	
	self assert: '[ ? ] ' , String newLineString
		 equals: stream contents.! !

!GifItemTest methodsFor: 'as yet unclassified' stamp: 'jpb 1/18/2020 19:28:42'!
testRecordType
	self assert: (usedClass supportsGopherItem: $g)! !

!GopherItemTest methodsFor: 'as yet unclassified' stamp: 'jpb 1/18/2020 19:32:59'!
setUp
	usedClass _ GopherItem ! !

!GopherItemTest methodsFor: 'as yet unclassified' stamp: 'jpb 1/18/2020 19:40:03'!
testRecordType
	self assert: (usedClass supportsGopherItem: $0) not.
	self assert: (usedClass supportsGopherItem: $1) not.
	self assert: (usedClass supportsGopherItem: $2) not.
	self assert: (usedClass supportsGopherItem: $3) not.
	self assert: (usedClass supportsGopherItem: $4) not.
	self assert: (usedClass supportsGopherItem: $5) not.
	self assert: (usedClass supportsGopherItem: $6) not.
	self assert: (usedClass supportsGopherItem: $7) not.
	self assert: (usedClass supportsGopherItem: $8) not.
	self assert: (usedClass supportsGopherItem: $9) not.
	self assert: (usedClass supportsGopherItem: $+) not.
	self assert: (usedClass supportsGopherItem: $g) not.
	self assert: (usedClass supportsGopherItem: $I) not.
	self assert: (usedClass supportsGopherItem: $T) not.! !

!GopherUriTest methodsFor: 'as yet unclassified' stamp: 'jpb 1/19/2020 14:42:13'!
setUp
	usedClass _ GopherUri! !

!GopherUriTest methodsFor: 'as yet unclassified' stamp: 'jpb 1/19/2020 15:55:55'!
testParsingGopherUriWithSelector
	| uri |
	
	uri _ usedClass fromString: 'gopher://gopher.floodgap.com/0/gopher/tech/gopherplus.txt'.
	
	self assert: 'gopher' equals: (uri at: 'scheme').
	self assert: 'gopher.floodgap.com' equals: (uri at: 'host').
	self assert: 70 equals: (uri at: 'port').
	self assert: $0 equals: (uri at: 'type').
	
	self assert: '/gopher/tech/gopherplus.txt' equals: (uri at: 'selector').
	self assert: '/0/gopher/tech/gopherplus.txt' equals: (uri at: 'path').
	! !

!ImageItemTest methodsFor: 'as yet unclassified' stamp: 'jpb 1/19/2020 13:53:50'!
setUp
	usedClass _ GopherImageItem ! !

!ImageItemTest methodsFor: 'as yet unclassified' stamp: 'jpb 1/18/2020 19:30:23'!
testRecordType
	self assert: (usedClass supportsGopherItem: $I)! !

!InfoItemTest methodsFor: 'as yet unclassified' stamp: 'jpb 1/19/2020 13:54:01'!
setUp
	usedClass _ GopherInfoItem ! !

!InfoItemTest methodsFor: 'as yet unclassified' stamp: 'jpb 1/18/2020 19:31:51'!
testRecordType
	self assert: (usedClass supportsGopherItem: $i)! !

!MenuItemTest methodsFor: 'as yet unclassified' stamp: 'jpb 1/19/2020 13:54:11'!
setUp
	usedClass _ GopherMenuItem! !

!MenuItemTest methodsFor: 'as yet unclassified' stamp: 'jpb 1/18/2020 19:24:48'!
testRecordType
	self assert: (usedClass supportsGopherItem: $1).! !

!TextFileItemTest methodsFor: 'as yet unclassified' stamp: 'jpb 1/19/2020 13:54:21'!
setUp
	usedClass _ GopherTextFileItem ! !

!TextFileItemTest methodsFor: 'as yet unclassified' stamp: 'jpb 1/18/2020 19:27:28'!
testRecordType
	self assert: (usedClass supportsGopherItem: $0)! !
