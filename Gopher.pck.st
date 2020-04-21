'From Cuis 5.0 [latest update: #4112] on 21 April 2020 at 8:57:36 pm'!
'Description Contains utilities for dealing with the gopher protocol.


License: MIT License
Porter: Josef Philip Bernhart <cuis-packages@phantasus.at>
Original Author: Christian Kellermann <ckeen@pestilenz.org>'!
!provides: 'Gopher' 1 15!
!requires: 'Cuis-Base' 50 4112 nil!
!requires: 'Network-Kernel' 1 5 nil!
!requires: 'URI-Kernel' 1 14 nil!
SystemOrganization addCategory: #Gopher!
SystemOrganization addCategory: #'Gopher-Tests'!


!classDefinition: #GopherLink category: #Gopher!
TextAction subclass: #GopherLink
	instanceVariableNames: 'linkTarget'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Gopher'!
!classDefinition: 'GopherLink class' category: #Gopher!
GopherLink class
	instanceVariableNames: ''!

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

!classDefinition: #GopherItem category: #Gopher!
Object subclass: #GopherItem
	instanceVariableNames: 'description port item host selector controller'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Gopher'!
!classDefinition: 'GopherItem class' category: #Gopher!
GopherItem class
	instanceVariableNames: ''!

!classDefinition: #GopherGifItem category: #Gopher!
GopherItem subclass: #GopherGifItem
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Gopher'!
!classDefinition: 'GopherGifItem class' category: #Gopher!
GopherGifItem class
	instanceVariableNames: ''!

!classDefinition: #GopherImageItem category: #Gopher!
GopherItem subclass: #GopherImageItem
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Gopher'!
!classDefinition: 'GopherImageItem class' category: #Gopher!
GopherImageItem class
	instanceVariableNames: ''!

!classDefinition: #GopherInfoItem category: #Gopher!
GopherItem subclass: #GopherInfoItem
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Gopher'!
!classDefinition: 'GopherInfoItem class' category: #Gopher!
GopherInfoItem class
	instanceVariableNames: ''!

!classDefinition: #GopherMenuItem category: #Gopher!
GopherItem subclass: #GopherMenuItem
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Gopher'!
!classDefinition: 'GopherMenuItem class' category: #Gopher!
GopherMenuItem class
	instanceVariableNames: ''!

!classDefinition: #GopherTextFileItem category: #Gopher!
GopherItem subclass: #GopherTextFileItem
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Gopher'!
!classDefinition: 'GopherTextFileItem class' category: #Gopher!
GopherTextFileItem class
	instanceVariableNames: ''!

!classDefinition: #GopherPage category: #Gopher!
Object subclass: #GopherPage
	instanceVariableNames: 'host port gopherSelector type rawData recordEnding reloadCallback reloading'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Gopher'!
!classDefinition: 'GopherPage class' category: #Gopher!
GopherPage class
	instanceVariableNames: 'controller'!

!classDefinition: #GopherRegistry category: #Gopher!
Object subclass: #GopherRegistry
	instanceVariableNames: 'page book'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Gopher'!
!classDefinition: 'GopherRegistry class' category: #Gopher!
GopherRegistry class
	instanceVariableNames: ''!

!classDefinition: #GopherUri category: #Gopher!
GenericUri subclass: #GopherUri
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Gopher'!
!classDefinition: 'GopherUri class' category: #Gopher!
GopherUri class
	instanceVariableNames: ''!


!GopherLink commentStamp: '<historical>' prior: 0!
Represents a gopher link in a text / page used for text highlighting within a TextModel and/or Morph.!

!GopherItem commentStamp: '<historical>' prior: 0!
A general gopher item found on a gopher server listing. Subclasses implement specific types!

!GopherGifItem commentStamp: '<historical>' prior: 0!
This gopher item represents a GIF image!

!GopherImageItem commentStamp: '<historical>' prior: 0!
This gopher item represents an image!

!GopherInfoItem commentStamp: '<historical>' prior: 0!
This gopher item represents an information message. It's not specified in the official Gopher RFC 1436. But is a well-known record type used for describing things or returning ASCII-Art based images.!

!GopherMenuItem commentStamp: '<historical>' prior: 0!
This record type describes a gopher menu item, which just tells the client where to go further down in a gopher tree.!

!GopherTextFileItem commentStamp: '<historical>' prior: 0!
This gopher item represents a binary file!

!GopherPage commentStamp: '<historical>' prior: 0!
Represents a model of a page in gopher. A page is the result returned by a gopher server and contains a collection of individual items, which each represents different types of interlinking or annotating the gopher page.!

!GopherRegistry commentStamp: '<historical>' prior: 0!
Represents a registry for storing URI actions!

!GopherUri commentStamp: '<historical>' prior: 0!
Represents a specialized uri for gopher. The used RFC was RFC 4266.!

!GopherItem methodsFor: 'printing' stamp: 'jpb 1/17/2020 18:45:47'!
printOn: aStream
	aStream 
		nextPutAll: '[ ';
		nextPut: $?;
		nextPutAll: ' ] ';
		nextPutAll: (self description);
		newLine.! !

!GopherInfoItem methodsFor: 'printing' stamp: 'jpb 1/17/2020 18:46:55'!
printOn: aStream
	aStream 
		nextPutAll: (self description);
		cr.! !

!GopherMenuItem methodsFor: 'printing' stamp: 'jpb 1/19/2020 14:26:13'!
printOn: aStream
	aStream nextPutAll: '-> ';
		nextPutAll: (self description);
		newLine.! !

!GopherTextFileItem methodsFor: 'printing' stamp: 'jpb 1/6/2020 09:47:51'!
printOn: aStream
	aStream 
		nextPutAll: '[ f ] ';
		nextPutAll: (self description);
		cr;
		endEntry.! !

!GopherLink methodsFor: 'as yet unclassified' stamp: 'jpb 1/21/2020 19:50:32'!
actOnClickFor: model
	linkTarget ifNil: [ ^ self ].
	linkTarget numArgs = 0 ifTrue: [ linkTarget value ].

	^true! !

!GopherLink methodsFor: 'as yet unclassified' stamp: 'jpb 1/17/2020 22:49:10'!
target: anObjectOrBlock
	linkTarget _ anObjectOrBlock! !

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

!GopherItem methodsFor: 'converting' stamp: 'jpb 1/19/2020 20:16:41'!
asText
	| result link|
	link _ GopherLink new.
	link target: [ self controller loadItem: self ].
	
	result _ self description asText.
	result addAttribute: link.
	result _ result append: String newLineString.
	
	^result! !

!GopherItem methodsFor: 'accessing' stamp: 'jpb 1/17/2020 18:45:07'!
controller
	^ controller! !

!GopherItem methodsFor: 'accessing' stamp: 'jpb 1/17/2020 18:54:12'!
controller: aGopherBrowser
	controller _ aGopherBrowser! !

!GopherItem methodsFor: 'accessing' stamp: 'jpb 1/19/2020 14:21:37'!
description
	^ description ifNil: ['']! !

!GopherItem methodsFor: 'accessing' stamp: 'jpb 1/17/2020 18:54:24'!
description: aString
	description _ aString! !

!GopherItem methodsFor: 'accessing' stamp: 'jpb 1/17/2020 18:45:22'!
host
	^ host! !

!GopherItem methodsFor: 'accessing' stamp: 'jpb 1/17/2020 18:54:29'!
host: aString
	host _ aString! !

!GopherItem methodsFor: 'accessing' stamp: 'jpb 1/17/2020 18:45:30'!
item
	^ item! !

!GopherItem methodsFor: 'accessing' stamp: 'jpb 1/17/2020 18:53:45'!
item: anItem
	item _ anItem! !

!GopherItem methodsFor: 'accessing' stamp: 'jpb 1/17/2020 18:45:36'!
port
	^ port! !

!GopherItem methodsFor: 'accessing' stamp: 'jpb 1/17/2020 18:53:51'!
port: aNumber
	port _ aNumber ! !

!GopherItem methodsFor: 'accessing' stamp: 'jpb 1/17/2020 18:46:01'!
selector
	^ selector! !

!GopherItem methodsFor: 'accessing' stamp: 'jpb 1/17/2020 18:54:03'!
selector: aString
	selector _ aString! !

!GopherItem class methodsFor: 'as yet unclassified' stamp: 'jpb 1/17/2020 20:50:36'!
findRecordFieldsOn: recordString
	"Reads from the given string the record fields"

	| fieldEnding |
	fieldEnding _ String tab.
	
	^recordString findTokens: fieldEnding.! !

!GopherItem class methodsFor: 'as yet unclassified' stamp: 'jpb 1/19/2020 13:00:27'!
fromString: aString
	"Returns an instance built from the given string which describes a gopher record from a gopher page"

	| fields item foundBuilder |
	fields _ self findRecordFieldsOn: aString.
	item _ (fields at: 1) first.
	foundBuilder _ self newClassFor: item.
	
	^foundBuilder	
		description: (fields at: 1) allButFirst;
		selector: (fields at: 2);
		host: (fields at: 3 ifAbsentPut: '');
		port: (fields at: 4 ifAbsentPut: 0).! !

!GopherItem class methodsFor: 'as yet unclassified' stamp: 'jpb 1/20/2020 21:23:02'!
newClassFor: anItem
	"Returns a new gopher item implementation based on the given item record type"
	| foundClass candidates |
	
	candidates _ self subclasses select: [ :class | class supportsGopherItem: anItem ].
	foundClass _ candidates at: 1 ifAbsent: nil.
	
	^foundClass isNil
		ifTrue: [ self new ]
		ifFalse: [ foundClass new ]! !

!GopherItem class methodsFor: 'as yet unclassified' stamp: 'jpb 1/17/2020 22:23:05'!
supportsGopherItem: anItem
	"Returns true if this class supports the given gopher item type. It's intended to allow an extension mechanism based on subclassing."
	^false! !

!GopherGifItem methodsFor: 'initialization' stamp: 'ck 9/18/2018 11:38'!
initialize
	super initialize.
	self item: $g! !

!GopherGifItem class methodsFor: 'as yet unclassified' stamp: 'jpb 1/17/2020 22:18:21'!
supportsGopherItem: anItem
	^$g = anItem! !

!GopherImageItem methodsFor: 'initialization' stamp: 'ck 9/18/2018 11:36'!
initialize
	super initialize.
	self item: $I! !

!GopherImageItem class methodsFor: 'as yet unclassified' stamp: 'jpb 1/17/2020 22:18:42'!
supportsGopherItem: anItem
	^$I = anItem! !

!GopherInfoItem methodsFor: 'converting' stamp: 'jpb 1/17/2020 22:24:51'!
asText
	^ Text fromString: self description , String newLineString.! !

!GopherInfoItem methodsFor: 'initialization' stamp: 'ck 9/14/2018 15:48'!
initialize
	super initialize.
	self item: $i! !

!GopherInfoItem class methodsFor: 'as yet unclassified' stamp: 'jpb 1/17/2020 22:19:02'!
supportsGopherItem: anItem
	^$i = anItem! !

!GopherMenuItem methodsFor: 'initialization' stamp: 'ck 9/14/2018 15:49'!
initialize
	super initialize.
	self item: $1! !

!GopherMenuItem class methodsFor: 'as yet unclassified' stamp: 'jpb 1/17/2020 22:19:19'!
supportsGopherItem: anItem
	^$1 = anItem! !

!GopherTextFileItem methodsFor: 'initialization' stamp: 'ck 9/14/2018 15:48'!
initialize
	super initialize.
	self item: $0! !

!GopherTextFileItem class methodsFor: 'as yet unclassified' stamp: 'jpb 1/17/2020 22:17:51'!
supportsGopherItem: anItem
	^$0 = anItem! !

!GopherPage methodsFor: 'as yet unclassified' stamp: 'jpb 1/17/2020 19:15:25'!
handleReloadError: reloadError
	"Handles the reloading error which happened when reloading the gopher page"

	Transcript show: reloadError asString;  newLine.
	
	reloadError resume! !

!GopherPage methodsFor: 'as yet unclassified' stamp: 'jpb 1/19/2020 16:24:27'!
loadItem: aGopherItem
	"Instructs the page to load the given item"
	
	host _ aGopherItem host.
	port _ aGopherItem port asInteger.
	gopherSelector _ aGopherItem selector.
	type _ aGopherItem item.
	
	self reload.! !

!GopherPage methodsFor: 'as yet unclassified' stamp: 'jpb 1/17/2020 20:26:55'!
newStreamWith: freshSocket
	"Creates a stream for fetching gopher page with the given source socket"
	| newStream |
	newStream _ SocketStream on: freshSocket.
	newStream binary.
	
	^newStream! !

!GopherPage methodsFor: 'as yet unclassified' stamp: 'jpb 1/19/2020 20:16:58'!
notifyReloadCallback
	"Calls the model with now reloaded page. This is called after the page was loaded or re-loaded"
	
	reloadCallback isNil
		ifFalse: [ reloadCallback value: self ].! !

!GopherPage methodsFor: 'as yet unclassified' stamp: 'jpb 1/19/2020 20:11:03'!
readPageFrom: stream
	"Reads the page from the given stream and stores it into the object"
	
	[
		stream nextPutAll: self pageSelector , String crlfString; flush.
		rawData _ stream upToEnd.
		
		self notifyReloadCallback.
	] 
	ensure: [ stream close ].! !

!GopherPage methodsFor: 'as yet unclassified' stamp: 'jpb 1/19/2020 20:10:42'!
reload
	self reloadFrom: Socket new.! !

!GopherPage methodsFor: 'as yet unclassified' stamp: 'jpb 1/19/2020 20:10:56'!
reloadFrom: socket
	"Reloads the page from the given socket"

	[
		| stream |
		
		socket connectToHostNamed: self host port: self port.
		stream _ self newStreamWith: socket.
	
		[ self readPageFrom: stream ]
		on: ConnectionTimedOut
		do: [:ex | self handleReloadError: ex ]
	] fork! !

!GopherPage methodsFor: 'initialization' stamp: 'jpb 1/19/2020 20:04:56'!
initialize
	"Set instance vars to defaults"

	host _ 'localhost'.
	port _ 70.
	rawData _ OrderedCollection new.
	reloading _ false.
	
	recordEnding _ String crlfString.
	
	^self.! !

!GopherPage methodsFor: 'initialization' stamp: 'jpb 1/19/2020 16:22:23'!
reloadCallback: reloadAction
	reloadCallback _ reloadAction.! !

!GopherPage methodsFor: 'accessing' stamp: 'ck 9/15/2018 16:31'!
controller
	^ self! !

!GopherPage methodsFor: 'accessing' stamp: 'jpb 1/17/2020 19:49:15'!
host
	^ host! !

!GopherPage methodsFor: 'accessing' stamp: 'jpb 1/17/2020 18:50:22'!
host: aString
	host _ aString.! !

!GopherPage methodsFor: 'accessing' stamp: 'jpb 1/17/2020 18:51:06'!
pageSelector
	^ gopherSelector ! !

!GopherPage methodsFor: 'accessing' stamp: 'jpb 1/17/2020 18:51:12'!
pageSelector: aString
	gopherSelector _ aString! !

!GopherPage methodsFor: 'accessing' stamp: 'jpb 1/17/2020 18:51:15'!
pageType
	^ type! !

!GopherPage methodsFor: 'accessing' stamp: 'jpb 1/17/2020 18:51:20'!
pageType: aSymbol
	type _ aSymbol.! !

!GopherPage methodsFor: 'accessing' stamp: 'jpb 1/17/2020 18:51:32'!
port
	^ port! !

!GopherPage methodsFor: 'accessing' stamp: 'jpb 1/17/2020 18:51:36'!
port: aNumber
	port _ aNumber.! !

!GopherPage methodsFor: 'converting' stamp: 'jpb 1/17/2020 20:43:01'!
asFileItem
	| tokens fields result |
	tokens _ self contentString findTokens: recordEnding.
	fields _ tokens allButLast.
	
	result _ Text new.
	fields do: [ :s | result append: ((GopherItem fromString: s) controller: self controller; asText)].
	^ result.! !

!GopherPage methodsFor: 'converting' stamp: 'jpb 1/17/2020 22:08:27'!
asMenu
	| tokens fields |
	tokens _ self contentString findTokens: recordEnding.
	fields _ tokens allButLast.
	
	^fields
		inject: Text new
	 	into: [ :acc :field | acc append: (self newItemFrom: field) asText ].! !

!GopherPage methodsFor: 'converting' stamp: 'jpb 1/17/2020 20:40:17'!
asMorph
	| morph |
	((self pageType == $I) or: (self pageType == $g))
	 	ifTrue: [|form|
			form _ Form fromBinaryStream: (RWBinaryOrTextStream on: rawData from: 1 to: rawData size) binary.
			morph _ ImageMorph new image: form ]
		ifFalse: [
			morph _ PluggableTextModel new.
			morph text: self asText.
			morph textMorph font: self find ].
		
	^morph.! !

!GopherPage methodsFor: 'converting' stamp: 'jpb 1/17/2020 20:42:33'!
asText
	self pageType == $1
		ifTrue: [^ self asMenu].
		
	^self contentString asText.! !

!GopherPage methodsFor: 'converting' stamp: 'jpb 1/17/2020 20:42:18'!
contentString
	"Returns the content as UTF-8 converted string which was fetched from some server"
	^String fromUtf8: rawData.! !

!GopherPage methodsFor: 'converting' stamp: 'jpb 1/17/2020 22:03:57'!
newItemFrom: field
	| item |
	
	item _ GopherItem fromString: field.
	item controller: self controller.
	
	^item! !

!GopherPage class methodsFor: 'as yet unclassified' stamp: 'jpb 1/17/2020 18:58:39'!
getPage: aSelectorString as: aType for: aModel fromHost: aString port: aNumber
	"Initialise a GopherPage"

	^ (GopherPage new)
		host: aString;
		port: aNumber;
		pageType: aType;
		model: aModel;
		pageSelector: aSelectorString;
		reload;
		yourself.! !

!GopherPage class methodsFor: 'as yet unclassified' stamp: 'jpb 1/17/2020 18:58:45'!
getPage: aSelectorString as: aType model: aModel selector: aSelector fromHost: aString port: aNumber
	"Initialise a GopherPage"

	^ (GopherPage new)
		host: aString;
		port: aNumber;
		pageType: aType;
		model: aModel;
		selector: aSelector;
		pageSelector: aSelectorString;
		reload;
		yourself.! !

!GopherRegistry class methodsFor: 'as yet unclassified' stamp: 'jpb 1/20/2020 21:30:58'!
openUri: gopherUri
	"Opens the given gopher URI"
	| page |

	page _ GopherPage new.
	page
		pageSelector: (gopherUri at: 'selector');
           pageType: (gopherUri at: 'type');
           host: (gopherUri at: 'host');
           port: (gopherUri at: 'port');
		reloadCallback: [ :reloadedPage | reloadedPage asText edit ].

	page reload.! !

!GopherUri methodsFor: 'as yet unclassified' stamp: 'jpb 1/19/2020 15:53:24'!
at: componentName
	| queryName |	
	queryName _ componentName asString.
	
	"Returning default values when nothing was set"
	'port' = queryName ifTrue: [ ^ super at: 'port' ifAbsent: 70 ].
	
	'selector' = queryName ifTrue: [
		| foundPath |
		foundPath _  super at: 'path'.
		foundPath size > 2
			ifTrue: [ ^foundPath copyFrom: 3 to: foundPath size ]
			ifFalse: [ ^'' ] ].

	'type' = queryName ifTrue: [
		| foundPath |
		foundPath _  super at: 'path'.
		foundPath size <= 1 ifTrue: [ ^ $1 ].
		foundPath size > 1 ifTrue: [ ^foundPath at: 2 ] ].
	
	^super at: queryName.! !
