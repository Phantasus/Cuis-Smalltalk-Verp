'From Cuis 5.0 [latest update: #4112] on 21 April 2020 at 7:39:18 pm'!
'Description Author: Josef Philip Bernhart <cuis-packages@phantasus.at>
License: MIT License'!
!provides: 'URI-Kernel' 1 15!
SystemOrganization addCategory: #'URI-Kernel'!
SystemOrganization addCategory: #'URI-Kernel-Tests'!


!classDefinition: #FileUriTests category: #'URI-Kernel-Tests'!
TestCase subclass: #FileUriTests
	instanceVariableNames: 'usedClass'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'URI-Kernel-Tests'!
!classDefinition: 'FileUriTests class' category: #'URI-Kernel-Tests'!
FileUriTests class
	instanceVariableNames: ''!

!classDefinition: #GenericUriTests category: #'URI-Kernel-Tests'!
TestCase subclass: #GenericUriTests
	instanceVariableNames: 'usedClass'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'URI-Kernel-Tests'!
!classDefinition: 'GenericUriTests class' category: #'URI-Kernel-Tests'!
GenericUriTests class
	instanceVariableNames: ''!

!classDefinition: #Rfc3986PercentEncoderTest category: #'URI-Kernel-Tests'!
TestCase subclass: #Rfc3986PercentEncoderTest
	instanceVariableNames: 'usedClass'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'URI-Kernel-Tests'!
!classDefinition: 'Rfc3986PercentEncoderTest class' category: #'URI-Kernel-Tests'!
Rfc3986PercentEncoderTest class
	instanceVariableNames: ''!

!classDefinition: #Rfc3986SegmentRemoverTest category: #'URI-Kernel-Tests'!
TestCase subclass: #Rfc3986SegmentRemoverTest
	instanceVariableNames: 'usedClass'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'URI-Kernel-Tests'!
!classDefinition: 'Rfc3986SegmentRemoverTest class' category: #'URI-Kernel-Tests'!
Rfc3986SegmentRemoverTest class
	instanceVariableNames: ''!

!classDefinition: #GenericUri category: #'URI-Kernel'!
Object subclass: #GenericUri
	instanceVariableNames: 'implementation'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'URI-Kernel'!
!classDefinition: 'GenericUri class' category: #'URI-Kernel'!
GenericUri class
	instanceVariableNames: ''!

!classDefinition: #FileUri category: #'URI-Kernel'!
GenericUri subclass: #FileUri
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'URI-Kernel'!
!classDefinition: 'FileUri class' category: #'URI-Kernel'!
FileUri class
	instanceVariableNames: ''!

!classDefinition: #Rfc3986GenericUri category: #'URI-Kernel'!
Object subclass: #Rfc3986GenericUri
	instanceVariableNames: 'uriScheme uriUserinfo uriAuthority uriPath uriHost uriPort uriFragment uriQuery'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'URI-Kernel'!
!classDefinition: 'Rfc3986GenericUri class' category: #'URI-Kernel'!
Rfc3986GenericUri class
	instanceVariableNames: ''!

!classDefinition: #Rfc3986PercentEncoder category: #'URI-Kernel'!
Object subclass: #Rfc3986PercentEncoder
	instanceVariableNames: 'utf8Bytes'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'URI-Kernel'!
!classDefinition: 'Rfc3986PercentEncoder class' category: #'URI-Kernel'!
Rfc3986PercentEncoder class
	instanceVariableNames: ''!

!classDefinition: #Rfc3986SegmentRemover category: #'URI-Kernel'!
Object subclass: #Rfc3986SegmentRemover
	instanceVariableNames: 'inputBuffer outputBuffer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'URI-Kernel'!
!classDefinition: 'Rfc3986SegmentRemover class' category: #'URI-Kernel'!
Rfc3986SegmentRemover class
	instanceVariableNames: ''!

!classDefinition: #Rfc3986UriBuilder category: #'URI-Kernel'!
Object subclass: #Rfc3986UriBuilder
	instanceVariableNames: 'referenceUri baseUri'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'URI-Kernel'!
!classDefinition: 'Rfc3986UriBuilder class' category: #'URI-Kernel'!
Rfc3986UriBuilder class
	instanceVariableNames: ''!

!classDefinition: #UnknownUri category: #'URI-Kernel'!
Object subclass: #UnknownUri
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'URI-Kernel'!
!classDefinition: 'UnknownUri class' category: #'URI-Kernel'!
UnknownUri class
	instanceVariableNames: ''!

!classDefinition: #UriRegistry category: #'URI-Kernel'!
Object subclass: #UriRegistry
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'URI-Kernel'!
!classDefinition: 'UriRegistry class' category: #'URI-Kernel'!
UriRegistry class
	instanceVariableNames: ''!


!GenericUri commentStamp: '<historical>' prior: 0!
Represents a uri which wasn't parsed into specific specialized known representations.!

!FileUri commentStamp: '<historical>' prior: 0!
Represents an implementation of file URIs as defined in RFC 8089 ( https://tools.ietf.org/html/rfc8089 ).!

!Rfc3986PercentEncoder commentStamp: '<historical>' prior: 0!
Encodes a string or bytearray of characters to a percent encoded string. It's valid to use for the userinfo, path segments and hostname of a RFC 3986 URI.!

!Rfc3986SegmentRemover commentStamp: '<historical>' prior: 0!
Removes variations of .. and . segments from an input path in the way described in the RFC 3986 in the remove_dot_segment algorithm description!

!Rfc3986UriBuilder commentStamp: '<historical>' prior: 0!
Builds merged URIs according to the relative URI reference resolution algorithm defined in the RFC!

!UriRegistry commentStamp: '<historical>' prior: 0!
Represents a registry for uri schemes for specialized URIs!

!GenericUri methodsFor: 'as yet unclassified' stamp: 'jpb 1/6/2020 14:33:42'!
printOn: stream
	implementation printOn: stream! !

!Rfc3986GenericUri methodsFor: 'as yet unclassified' stamp: 'jpb 1/11/2020 18:05:39'!
printOn: stream
	uriScheme size > 0
		ifTrue: [ stream nextPutAll: uriScheme , ':' ].
		
	uriAuthority size > 0
		ifTrue: [ stream nextPutAll:  '//' , uriAuthority ].
	
	stream nextPutAll: uriPath.
	
	uriQuery size > 0
		ifTrue: [ stream nextPutAll: '?' , uriQuery ].
		
	uriFragment size > 0
		ifTrue: [ stream nextPutAll: '#' , uriFragment ].
! !

!FileUriTests methodsFor: 'as yet unclassified' stamp: 'jpb 1/19/2020 17:24:16'!
setUp
	usedClass _ FileUri ! !

!FileUriTests methodsFor: 'as yet unclassified' stamp: 'jpb 1/19/2020 17:26:02'!
testParsingRfcExample1
	| uri |
	uri _ usedClass fromString: 'file:///path/to/file'.
	
	self assert: 'file' equals: (uri at: 'scheme').
	self assert: '/path/to/file' equals: (uri at: 'path').
	! !

!FileUriTests methodsFor: 'as yet unclassified' stamp: 'jpb 1/19/2020 17:26:30'!
testParsingRfcExample2
	| uri |
	uri _ usedClass fromString: 'file:/path/to/file'.
	
	self assert: 'file' equals: (uri at: 'scheme').
	self assert: '/path/to/file' equals: (uri at: 'path').
	! !

!FileUriTests methodsFor: 'as yet unclassified' stamp: 'jpb 1/19/2020 17:27:25'!
testParsingRfcExample3
	| uri |
	uri _ usedClass fromString: 'file://host.example.com/path/to/file'.
	
	self assert: 'file' equals: (uri at: 'scheme').
	self assert: '/path/to/file' equals: (uri at: 'path').
	self assert: 'host.example.com' equals: (uri at: 'host').
	self assert: 'host.example.com' equals: (uri at: 'authority').
	! !

!GenericUriTests methodsFor: 'as yet unclassified' stamp: 'jpb 1/5/2020 19:02:35'!
setUp
	usedClass _ GenericUri! !

!GenericUriTests methodsFor: 'as yet unclassified' stamp: 'jpb 1/6/2020 16:53:01'!
testAbnormalRelativeUriResolution
	"Tests the abnormal resolution of relative URIs as defined in the RFC in https://tools.ietf.org/html/rfc3986#section-5.4.2"
	| base |
	base _ usedClass fromString: 'http://a/b/c/d;p?q'.
	
	self assert: 'http://a/g' equals: (base join: '../../../g') asString.
	self assert: 'http://a/g' equals: (base join: '../../../../g') asString.
	self assert: 'http://a/g' equals: (base join: '/./g') asString.
	self assert: 'http://a/g' equals: (base join: '/../g') asString.
	
	self assert: 'http://a/b/c/g.' equals: (base join: 'g.') asString.
	self assert: 'http://a/b/c/.g' equals: (base join: '.g') asString.
	self assert: 'http://a/b/c/g..' equals: (base join: 'g..') asString.
	self assert: 'http://a/b/c/..g' equals: (base join: '..g') asString.
	
	self assert: 'http://a/b/g' equals: (base join: './../g') asString.
	self assert: 'http://a/b/c/g/' equals: (base join: './g/.') asString.
	self assert: 'http://a/b/c/g/h' equals: (base join: 'g/./h') asString.
	self assert: 'http://a/b/c/h' equals: (base join: 'g/../h') asString.
	
	self assert: 'http://a/b/c/g;x=1/y' equals: (base join: 'g;x=1/./y') asString.
	self assert: 'http://a/b/c/y' equals: (base join: 'g;x=1/../y') asString.
	
	self assert: 'http://a/b/c/g?y/./x' equals: (base join: 'g?y/./x') asString.
	self assert: 'http://a/b/c/g?y/../x' equals: (base join: 'g?y/../x') asString.
	self assert: 'http://a/b/c/g#s/./x' equals: (base join: 'g#s/./x') asString.
	self assert: 'http://a/b/c/g#s/../x' equals: (base join: 'g#s/../x') asString.! !

!GenericUriTests methodsFor: 'as yet unclassified' stamp: 'jpb 1/6/2020 16:22:01'!
testJoiningWithBase
	| base |
	base _ usedClass fromString: 'http://a/b/c/d;p?q'.
	! !

!GenericUriTests methodsFor: 'as yet unclassified' stamp: 'jpb 1/11/2020 22:43:52'!
testNormalRelativeUriResolution
	"Tests the normal resolution of relative URIs as defined in https://tools.ietf.org/html/rfc3986#section-5.4.1"
	| base |
	base _ usedClass fromString: 'http://a/b/c/d;p?q'.
	
	self assert: 'g:h' equals: (base join: 'g:h') asString.
	self assert: 'http://a/b/c/g' equals: (base join: 'g') asString.
	self assert: 'http://a/b/c/g' equals: (base join: './g') asString.
	self assert: 'http://a/b/c/g/' equals: (base join: 'g/') asString.
	
	self assert: 'http://g' equals: (base join: '//g') asString.
	self assert: 'http://a/b/c/d;p?y' equals: (base join: '?y') asString.
	self assert: 'http://a/b/c/g?y' equals: (base join: 'g?y') asString.
	self assert: 'http://a/b/c/d;p?q#s' equals: (base join: '#s') asString.
	
	self assert: 'http://a/b/c/g#s' equals: (base join: 'g#s') asString.
	self assert: 'http://a/b/c/g?y#s' equals: (base join: 'g?y#s') asString.
	self assert: 'http://a/b/c/;x' equals: (base join: ';x') asString.
	self assert: 'http://a/b/c/g;x' equals: (base join: 'g;x') asString.
	
	self assert: 'http://a/b/c/g;x?y#s' equals: (base join: 'g;x?y#s') asString.
	self assert: 'http://a/b/c/d;p?q' equals: (base join: '') asString.
	self assert: 'http://a/b/c/' equals: (base join: '.') asString.
	self assert: 'http://a/b/c/' equals: (base join: './') asString.
		
	self assert: 'http://a/b/' equals: (base join: '..') asString.
	self assert: 'http://a/b/' equals: (base join: '../') asString.
	self assert: 'http://a/b/g' equals: (base join: '../g') asString.
	
	self assert: 'http://a/' equals: (base join: '../..') asString.
	self assert: 'http://a/' equals: (base join: '../../') asString.
	self assert: 'http://a/g' equals: (base join: '../../g') asString.
	! !

!GenericUriTests methodsFor: 'as yet unclassified' stamp: 'jpb 1/19/2020 15:03:41'!
testParsingFromString
	| uri |
	uri _ usedClass fromString: 'https://john.doe@www.example.com:123/forum/questions/?tag=networking&order=newest#top'.
	
	self assert: 'https' equals: (uri at: 'scheme').
	self assert: 'john.doe' equals: (uri at: 'userinfo').
	self assert: 'www.example.com' equals: (uri at: 'host').
	self assert: 'john.doe@www.example.com:123' equals: (uri at: 'authority').
	self assert: 123 equals: (uri at: 'port').
	self assert: '/forum/questions/' equals: (uri at: 'path').
	self assert: 'tag=networking&order=newest' equals: (uri at: 'query').
	self assert: 'top' equals: (uri at: 'fragment').
	
	self assert: 'https://john.doe@www.example.com:123/forum/questions/?tag=networking&order=newest#top' equals: uri asString! !

!GenericUriTests methodsFor: 'as yet unclassified' stamp: 'jpb 1/19/2020 15:03:34'!
testParsingFromString2
	| uri |
	uri _ usedClass fromString: 'news:comp.infosystems.www.servers.unix'.
	
	self assert: 'news' equals: (uri at: 'scheme').
	self assert: '' equals: (uri at: 'userinfo').
	self assert: '' equals: (uri at: 'host').
	self assert: '' equals: (uri at: 'authority').
	self assert: nil equals: (uri at: 'port').
	self assert: 'comp.infosystems.www.servers.unix' equals: (uri at: 'path').
	self assert: '' equals: (uri at: 'query').
	self assert: '' equals: (uri at: 'fragment').
	
	self assert: 'news:comp.infosystems.www.servers.unix' equals: uri asString! !

!GenericUriTests methodsFor: 'as yet unclassified' stamp: 'jpb 1/19/2020 15:03:29'!
testParsingFromString3
	| uri |
	uri _ usedClass fromString: 'tel:+1-816-555-1212'.
	
	self assert: 'tel' equals: (uri at: 'scheme').
	self assert: '' equals: (uri at: 'userinfo').
	self assert: '' equals: (uri at: 'host').
	self assert: '' equals: (uri at: 'authority').
	self assert: nil equals: (uri at: 'port').
	self assert: '+1-816-555-1212' equals: (uri at: 'path').
	self assert: '' equals: (uri at: 'query').
	self assert: '' equals: (uri at: 'fragment').
	
	self assert: 'tel:+1-816-555-1212' equals: uri asString! !

!GenericUriTests methodsFor: 'as yet unclassified' stamp: 'jpb 1/19/2020 15:02:33'!
testParsingFromString4
	| uri |
	uri _ usedClass fromString: 'telnet://192.0.2.16:80/'.
	
	self assert: 'telnet' equals: (uri at: 'scheme').
	self assert: '' equals: (uri at: 'userinfo').
	self assert: '192.0.2.16' equals: (uri at: 'host').
	self assert: '192.0.2.16:80' equals: (uri at: 'authority').
	self assert: 80 equals: (uri at: 'port').
	self assert: '/' equals: (uri at: 'path').
	self assert: '' equals: (uri at: 'query').
	self assert: '' equals: (uri at: 'fragment').
	
	self assert: 'telnet://192.0.2.16:80/' equals: uri asString! !

!GenericUriTests methodsFor: 'as yet unclassified' stamp: 'jpb 1/19/2020 15:02:55'!
testParsingFromString5
	| uri |
	uri _ usedClass fromString: 'ldap://[2001:db8::7]/c=GB?objectClass?one'.
	
	self assert: 'ldap' equals: (uri at: 'scheme').
	self assert: '' equals: (uri at: 'userinfo').
	self assert: '[2001:db8::7]' equals: (uri at: 'host').
	self assert: '[2001:db8::7]' equals: (uri at: 'authority').
	self assert: nil equals: (uri at: 'port').
	self assert: '/c=GB' equals: (uri at: 'path').
	self assert: 'objectClass?one' equals: (uri at: 'query').
	self assert: '' equals: (uri at: 'fragment').
	
	self assert: 'ldap://[2001:db8::7]/c=GB?objectClass?one' equals: uri asString! !

!GenericUriTests methodsFor: 'as yet unclassified' stamp: 'jpb 1/19/2020 15:03:01'!
testParsingFromString6
	| uri |
	uri _ usedClass fromString: 'mailto:John.Doe@example.com'.
	
	self assert: 'mailto' equals: (uri at: 'scheme').
	self assert: '' equals: (uri at: 'userinfo').
	self assert: '' equals: (uri at: 'host').
	self assert: '' equals: (uri at: 'authority').
	self assert: nil equals: (uri at: 'port').
	self assert: 'John.Doe@example.com' equals: (uri at: 'path').
	self assert: '' equals: (uri at: 'query').
	self assert: '' equals: (uri at: 'fragment').
	
	self assert: 'mailto:John.Doe@example.com' equals: uri asString! !

!GenericUriTests methodsFor: 'as yet unclassified' stamp: 'jpb 1/19/2020 15:03:05'!
testParsingFromString7
	| uri |
	uri _ usedClass fromString: 'http://a/b/c/d;p?q'.
	
	self assert: 'http' equals: (uri at: 'scheme').
	self assert: '' equals: (uri at: 'userinfo').
	self assert: 'a' equals: (uri at: 'host').
	self assert: 'a' equals: (uri at: 'authority').
	self assert: nil equals: (uri at: 'port').
	self assert: '/b/c/d;p' equals: (uri at: 'path').
	self assert: 'q' equals: (uri at: 'query').
	self assert: '' equals: (uri at: 'fragment').
	
	self assert: uri isAbsolute.
	
	self assert: 'http://a/b/c/d;p?q' equals: uri asString! !

!GenericUriTests methodsFor: 'as yet unclassified' stamp: 'jpb 1/19/2020 15:03:11'!
testParsingFromString8
	| uri |
	uri _ usedClass fromString: '../../../g'.
	
	self assert: '' equals: (uri at: 'scheme').
	self assert: '' equals: (uri at: 'userinfo').
	self assert: '' equals: (uri at: 'host').
	self assert: '' equals: (uri at: 'authority').
	self assert: nil equals: (uri at: 'port').
	self assert: '../../../g' equals: (uri at: 'path').
	self assert: '' equals: (uri at: 'query').
	self assert: '' equals: (uri at: 'fragment').
	
	self assert: uri isRelative.
	
	self assert: '../../../g' equals: uri asString! !

!GenericUriTests methodsFor: 'as yet unclassified' stamp: 'jpb 1/6/2020 16:49:23'!
testStrictParserRelativeUrlResolution
	"Tests the strict parsing of the generic uri as the intention is NOT support old broken parsing issues with older specifications"
	| base |
	base _ usedClass fromString: 'http://a/b/c/d;p?q'.
	
	self assert: 'http:g' equals: (base join: 'http:g') asString.
! !

!Rfc3986PercentEncoderTest methodsFor: 'as yet unclassified' stamp: 'jpb 1/12/2020 16:37:24'!
setUp
	usedClass _ Rfc3986PercentEncoder ! !

!Rfc3986PercentEncoderTest methodsFor: 'as yet unclassified' stamp: 'jpb 1/12/2020 17:16:53'!
testEncodingStrings
	| encoder |
	encoder _ usedClass with: 'öb-a~da_A.Z'.
	
	self assert: '%C3%B6b-a~da_A.Z' equals: encoder value.! !

!Rfc3986PercentEncoderTest methodsFor: 'as yet unclassified' stamp: 'jpb 1/12/2020 17:18:09'!
testEncodingStringsWithNCRs
	| encoder |
	encoder _ usedClass with: 'öb-a~da_A.Z&#356;'.
	
	self assert: '%C3%B6b-a~da_A.Z%C5%A4' equals: encoder value.! !

!Rfc3986SegmentRemoverTest methodsFor: 'as yet unclassified' stamp: 'jpb 1/9/2020 21:45:24'!
setUp
	usedClass _ Rfc3986SegmentRemover ! !

!Rfc3986SegmentRemoverTest methodsFor: 'as yet unclassified' stamp: 'jpb 1/9/2020 23:15:53'!
testAlgorithm
	| remover |
	remover _ usedClass on: '/a/b/c/./../../g'.
	
	self assert: '' equals: remover outputBuffer.
	self assert: '/a/b/c/./../../g' equals: remover inputBuffer.
	
	remover next.
	self assert: '/a' equals: remover outputBuffer.
	self assert: '/b/c/./../../g' equals: remover inputBuffer.
	
	remover next.
	self assert: '/a/b' equals: remover outputBuffer.
	self assert: '/c/./../../g' equals: remover inputBuffer.
	
	remover next.
	self assert: '/a/b/c' equals: remover outputBuffer.
	self assert: '/./../../g' equals: remover inputBuffer.
	
	remover next.
	self assert: '/a/b/c' equals: remover outputBuffer.
	self assert: '/../../g' equals: remover inputBuffer.
	
	remover next.
	self assert: '/a/b' equals: remover outputBuffer.
	self assert: '/../g' equals: remover inputBuffer.
	
	remover next.
	self assert: '/a' equals: remover outputBuffer.
	self assert: '/g' equals: remover inputBuffer.
	
	remover next.
	self assert: '/a/g' equals: remover outputBuffer.
	self assert: '' equals: remover inputBuffer.! !

!Rfc3986SegmentRemoverTest methodsFor: 'as yet unclassified' stamp: 'jpb 1/9/2020 23:19:58'!
testAlgorithm2
	| remover |
	remover _ usedClass on: 'mid/content=5/../6'.
	
	self assert: '' equals: remover outputBuffer.
	self assert: 'mid/content=5/../6' equals: remover inputBuffer.
	
	remover next.
	self assert: 'mid' equals: remover outputBuffer.
	self assert: '/content=5/../6' equals: remover inputBuffer.
	
	remover next.
	self assert: 'mid/content=5' equals: remover outputBuffer.
	self assert: '/../6' equals: remover inputBuffer.
	
	remover next.
	self assert: 'mid' equals: remover outputBuffer.
	self assert: '/6' equals: remover inputBuffer.
	
	remover next.
	self assert: 'mid/6' equals: remover outputBuffer.
	self assert: '' equals: remover inputBuffer.! !

!GenericUri methodsFor: 'as yet unclassified' stamp: 'jpb 1/9/2020 19:59:29'!
asString
	^implementation asString! !

!GenericUri methodsFor: 'as yet unclassified' stamp: 'jpb 1/19/2020 15:41:20'!
at: componentName
	^self at: componentName asString ifAbsent: [ ^ nil ].! !

!GenericUri methodsFor: 'as yet unclassified' stamp: 'jpb 1/19/2020 15:40:44'!
at: componentName ifAbsent: absentValue
	^implementation at: componentName asString ifAbsent: absentValue! !

!GenericUri methodsFor: 'as yet unclassified' stamp: 'jpb 1/9/2020 20:17:17'!
at: name put: value
	^implementation at: name put: value! !

!GenericUri methodsFor: 'as yet unclassified' stamp: 'jpb 1/9/2020 20:16:09'!
initialize
	implementation _ Rfc3986GenericUri new.! !

!GenericUri methodsFor: 'as yet unclassified' stamp: 'jpb 1/5/2020 19:30:25'!
initializeWith: actualImplementation
	implementation _ actualImplementation ! !

!GenericUri methodsFor: 'as yet unclassified' stamp: 'jpb 1/9/2020 19:42:54'!
isAbsolute
	^implementation isAbsolute! !

!GenericUri methodsFor: 'as yet unclassified' stamp: 'jpb 1/9/2020 20:52:56'!
isRelative
	^self isAbsolute not! !

!GenericUri methodsFor: 'as yet unclassified' stamp: 'jpb 1/9/2020 21:01:02'!
join: uriOrString
	"Joins with the given uri representation to produce a new absolute URI"
	| partnerUri builder |
	partnerUri _ uriOrString asUri.
	builder _ Rfc3986UriBuilder new.
	
	self isAbsolute
		ifTrue: [ builder referenceUri: partnerUri base: self. ^builder build ]
		ifFalse: [ self error: 'Not an absolute URI' ]! !

!GenericUri methodsFor: 'as yet unclassified' stamp: 'jpb 1/19/2020 16:07:15'!
openWith: uriOpener
	"Opens this uri with the given uri opener. Any object which implements some of the interfaces in here can be used for opening an URI"
	
	uriOpener openUri: self.! !

!GenericUri class methodsFor: 'as yet unclassified' stamp: 'jpb 1/19/2020 15:14:47'!
fromString: uriString
	"Returns an uri from the given string"
	| uri |
	
	uri _ Rfc3986GenericUri new.
	self uriParser parseUri: uriString into: uri.
	
	^self with: uri! !

!GenericUri class methodsFor: 'as yet unclassified' stamp: 'jpb 1/9/2020 19:48:27'!
uriParser
	^OMeta2Rfc3986Parser! !

!GenericUri class methodsFor: 'as yet unclassified' stamp: 'jpb 1/5/2020 19:36:25'!
with: uriImplementation
	| uri |
	uri _ self basicNew.
	uri initializeWith: uriImplementation.
	^uri! !

!FileUri methodsFor: 'as yet unclassified' stamp: 'jpb 1/23/2020 19:58:45'!
basename
	"Returns the directory part of the file"
	| pathSegments |
	pathSegments _ (self at: 'path' ifAbsent: '') findTokens: '/'.
	
	^ pathSegments last! !

!FileUri methodsFor: 'as yet unclassified' stamp: 'jpb 1/23/2020 06:13:17'!
dirname
	"Returns the directory part of the file"
	| pathSegments |
	pathSegments _ (self at: 'path' ifAbsent: '') findTokens: '/'.
	
	^'/' , ( '/' join: pathSegments allButLast).! !

!Rfc3986GenericUri methodsFor: 'as yet unclassified' stamp: 'jpb 1/9/2020 19:47:22'!
asString
	| uriStream |
	uriStream _ WriteStream on: ''.
	self printOn: uriStream.

	^uriStream contents! !

!Rfc3986GenericUri methodsFor: 'as yet unclassified' stamp: 'jpb 1/19/2020 15:49:25'!
at: componentName ifAbsent: absentValue
	| name |
	name _ componentName asString.
	
	'authority' = name ifTrue: [ ^uriAuthority ].
	'scheme' = name ifTrue: [ ^uriScheme ].
	'path' = name ifTrue: [ ^uriPath ].
	'host' = name ifTrue: [ ^uriHost ].
	'userinfo' = name ifTrue: [ ^uriUserinfo ].
	'fragment' = name ifTrue: [ ^uriFragment ].
	'port' = name ifTrue: [ ^uriPort asInteger ifNil: [ absentValue value ] ].
	'query' = name ifTrue: [ ^uriQuery ].! !

!Rfc3986GenericUri methodsFor: 'as yet unclassified' stamp: 'jpb 1/19/2020 15:42:33'!
at: componentName put: value
	| name |
	name _ componentName.
	
	'scheme' = name ifTrue: [ uriScheme _ value ].
	'authority' = name ifTrue: [ uriAuthority _ value ].
	'host' = name ifTrue: [ uriHost _ value ].
	'port' = name ifTrue: [ uriPort _ value ].
	'userinfo' = name ifTrue: [ uriUserinfo _ value ].
	'fragment' = name ifTrue: [ uriFragment _ value ].
	'query' = name ifTrue: [ uriQuery _ value ].
	'path' = name ifTrue: [ uriPath _ value ].
	
	^value! !

!Rfc3986GenericUri methodsFor: 'as yet unclassified' stamp: 'jpb 1/6/2020 15:16:17'!
initialize
	uriScheme _ ''.
	uriAuthority _ ''.
	uriUserinfo _ ''.
	uriPath _ ''.
	uriHost _ ''.
	uriPort _ ''.
	uriFragment _ ''.
	uriQuery _ ''.! !

!Rfc3986GenericUri methodsFor: 'as yet unclassified' stamp: 'jpb 1/6/2020 14:38:50'!
is: attributeName
	(attributeName = #hierarchical) ifTrue: [ ^self isHierarchical ].
	(attributeName = #absolute) ifTrue: [ ^self isAbsolute ].
	
	^false! !

!Rfc3986GenericUri methodsFor: 'as yet unclassified' stamp: 'jpb 1/9/2020 20:01:35'!
isAbsolute
	^OMeta2Rfc3986Parser matchAbsoluteUri: self asString! !

!Rfc3986GenericUri methodsFor: 'as yet unclassified' stamp: 'jpb 1/6/2020 15:12:13'!
isHierarchical
	"Returns true if the uri is not a hierarchical uri. This is the case when the authority part is missing"
	
	^(uriAuthority size > 0) & (uriPath size > 0)! !

!Rfc3986PercentEncoder methodsFor: 'as yet unclassified' stamp: 'jpb 1/12/2020 16:50:07'!
bytes: internalByteArray
	"Sets the UTF-8 encoded bytes byte array used for converting to percent string"
	utf8Bytes _ internalByteArray! !

!Rfc3986PercentEncoder methodsFor: 'as yet unclassified' stamp: 'jpb 1/12/2020 16:58:57'!
encodeByte: byte
	"Encodes the given numerical byte value into a string or percent encoded byte representation"
	(byte <= 16r5A) & (byte >= 16r41)
		ifTrue: [ ^byte asCharacter asString ].

	(byte <= 16r7A) & (byte >= 16r61)
		ifTrue: [ ^byte asCharacter asString ].
		
	(byte <= 16r30) & (byte >= 16r39)
		ifTrue: [ ^byte asCharacter asString ].
	
	(#(45 46 95 126) includes: byte)
		ifTrue: [ ^byte asCharacter asString ].
		
	^ '%' , (byte printStringBase: 16 length: 2 padded: true)! !

!Rfc3986PercentEncoder methodsFor: 'as yet unclassified' stamp: 'jpb 1/12/2020 16:59:12'!
value
	| substrings |
	substrings _ utf8Bytes collect: [:byte | self encodeByte: byte ].

	^'' join: substrings ! !

!Rfc3986PercentEncoder class methodsFor: 'as yet unclassified' stamp: 'jpb 1/12/2020 17:13:24'!
with: rawComponent
	| bytes encoder | 
	
	bytes _ rawComponent asUtf8: true.
	encoder _ self new.
	
	encoder bytes: bytes asArray.
	
	^encoder
	! !

!Rfc3986SegmentRemover methodsFor: 'as yet unclassified' stamp: 'jpb 1/9/2020 21:26:58'!
initialize
	inputBuffer _ ''.
	outputBuffer _ ''.! !

!Rfc3986SegmentRemover methodsFor: 'as yet unclassified' stamp: 'jpb 1/9/2020 21:54:11'!
inputBuffer
	^inputBuffer copy! !

!Rfc3986SegmentRemover methodsFor: 'as yet unclassified' stamp: 'jpb 1/9/2020 21:32:18'!
inputBuffer: newBuffer
	inputBuffer _ newBuffer asString! !

!Rfc3986SegmentRemover methodsFor: 'as yet unclassified' stamp: 'jpb 1/11/2020 19:41:02'!
moveNextSegment
	"Moves the next path segment in the input buffer to the end of the output buffer"
	| segment firstChar endOffset |
	
	firstChar _ inputBuffer at: 1.
	endOffset _ firstChar = $/
		ifTrue: [ (inputBuffer indexOf: $/ startingAt: 2) - 1 ]
		ifFalse: [ (inputBuffer indexOf: $/) - 1 ].
		
	endOffset < 1 ifTrue: [ endOffset _ inputBuffer size ].
	
	segment _ inputBuffer copyFrom: 1 to: endOffset.
	outputBuffer _ outputBuffer append: segment.
	inputBuffer _ inputBuffer copyReplaceFrom: 1 to: endOffset with: ''.! !

!Rfc3986SegmentRemover methodsFor: 'as yet unclassified' stamp: 'jpb 1/11/2020 23:03:40'!
next
	"Makes a next step"
	| |
	(self segmentWith: '../') ifTrue: [ inputBuffer _ inputBuffer withoutPrefix: '../'. ^self ].
	(self segmentWith: './') ifTrue: [ inputBuffer _ inputBuffer withoutPrefix: './'. ^self ].
	(self segmentWith: '/./') ifTrue: [ inputBuffer _ '/' , (inputBuffer withoutPrefix: '/./'). ^self ].
	
	(self segmentWith: '/../') ifTrue: [
		inputBuffer _ '/' , (inputBuffer withoutPrefix: '/../').
		outputBuffer _ self removeLastSegment.
		^self.
	].
	(self segmentWith: '/..') ifTrue: [
		inputBuffer _ '/' , (inputBuffer withoutPrefix: '/..').
		outputBuffer _ self removeLastSegment.
		^self.
	].
	(self segmentWith: '/.') ifTrue: [ inputBuffer _ '/' , (inputBuffer withoutPrefix: '/.'). ^self ].

	(inputBuffer = '.') ifTrue: [ inputBuffer _ ''. ^self ].
	(inputBuffer = '..') ifTrue: [ inputBuffer _ ''. ^self ].

	self moveNextSegment.! !

!Rfc3986SegmentRemover methodsFor: 'as yet unclassified' stamp: 'jpb 1/9/2020 21:54:27'!
outputBuffer
	^outputBuffer copy! !

!Rfc3986SegmentRemover methodsFor: 'as yet unclassified' stamp: 'jpb 1/11/2020 22:45:33'!
removeLastSegment
	| endOffset |
	endOffset _ outputBuffer findLast: [:char | char = $/ ].
	endOffset = 1 ifTrue: [^ '' ].
	
	endOffset _ endOffset <= 1
		ifTrue: [ 1 ]
		ifFalse: [ endOffset - 1 ].
	
	outputBuffer isEmpty
		ifTrue: [ ^ '' ]
		ifFalse: [ ^outputBuffer copyFrom: 1 to: endOffset ]! !

!Rfc3986SegmentRemover methodsFor: 'as yet unclassified' stamp: 'jpb 1/11/2020 23:06:15'!
segmentWith: pathSegment
	"Returns true if the given path segment is the next in the input buffer"
	| begins |
	begins _ inputBuffer beginsWith: pathSegment.
	begins ifFalse: [ ^false ].
	
	inputBuffer size = pathSegment size ifTrue: [ ^true ].
	(pathSegment at: pathSegment size) = $/ ifTrue: [ ^true ].

	^(inputBuffer at: pathSegment size + 1) = $/
! !

!Rfc3986SegmentRemover methodsFor: 'as yet unclassified' stamp: 'jpb 1/9/2020 21:28:49'!
value
	[ inputBuffer isEmpty ] whileFalse: [
		self next
	].

	^outputBuffer! !

!Rfc3986SegmentRemover class methodsFor: 'as yet unclassified' stamp: 'jpb 1/9/2020 21:35:20'!
on: freshPath
	| instance |
	instance _ self new.
	instance inputBuffer: freshPath.
	
	^instance! !

!Rfc3986UriBuilder methodsFor: 'as yet unclassified' stamp: 'jpb 1/9/2020 21:24:15'!
build
	"Constructs a new target uri based on the given base and reference"
	| targetUri  |
	targetUri _ self makeSchemeUri.
	targetUri at: 'fragment' put: (referenceUri at: 'fragment').
	
	^targetUri! !

!Rfc3986UriBuilder methodsFor: 'as yet unclassified' stamp: 'jpb 1/9/2020 20:17:42'!
makeAuthorityUri
	| uri newAuthority |
	
	newAuthority _ referenceUri at: 'authority'.
	uri _ (newAuthority size > 0)
		ifTrue: [ | targetUri |
			targetUri _ self newUri.
			targetUri at: 'authority' put: (referenceUri at: 'authority').
			targetUri at: 'path' put: (self removeDotSegmentsOn: (referenceUri at: 'path')).
			targetUri at: 'query' put: (referenceUri at: 'query').
			targetUri
		]
		ifFalse: [ |targetUri|
			targetUri _ self makePathUri.
			targetUri at: 'authority' put: (baseUri at: 'authority').
			targetUri		
		].
		
	uri at: 'scheme' put: (baseUri at: 'scheme').
	
	^uri.! !

!Rfc3986UriBuilder methodsFor: 'as yet unclassified' stamp: 'jpb 1/8/2020 18:14:42'!
makePathUri
	| newPath uri targetUri |
	newPath _ referenceUri at: 'path'.
	targetUri _ self newUri.
	
	uri _ (newPath size = 0)
		ifTrue: [
			targetUri at: 'path' put: (baseUri at: 'path').
			targetUri at: 'query' put: (self makeQuery).
			targetUri
		]
		ifFalse: [
			(((referenceUri at: 'path') at: 1) = $/)
				ifTrue: [ targetUri at: 'path' put: (self removeDotSegmentsOn: (referenceUri at: 'path')) ]
				ifFalse: [
					targetUri at: 'path' put: self mergeUriPaths.
					targetUri at: 'path' put: (self removeDotSegmentsOn: (targetUri at: 'path')).
				].
			targetUri at: 'query' put: (referenceUri at: 'query').
			targetUri.	
		].
	
	uri at: 'authority' put: (baseUri at: 'authority').
	^uri! !

!Rfc3986UriBuilder methodsFor: 'as yet unclassified' stamp: 'jpb 1/8/2020 18:16:24'!
makeQuery
	| newQuery |
	newQuery _ referenceUri at: 'query'.
	
	^(newQuery size > 0)
		ifTrue: [ newQuery ]
		ifFalse: [ baseUri at: 'query' ]! !

!Rfc3986UriBuilder methodsFor: 'as yet unclassified' stamp: 'jpb 1/8/2020 17:49:08'!
makeSchemeUri
	| newScheme |
	
	newScheme _ referenceUri at: 'scheme'.
	
	^(newScheme size > 0)
		ifTrue: [ |targetUri|
			targetUri _ self newUri.
			targetUri at: 'scheme' put: newScheme.
			targetUri at: 'authority' put: (referenceUri at: 'authority').
			targetUri at: 'query' put: (referenceUri at: 'query').
			targetUri at: 'path' put: (self removeDotSegmentsOn: (referenceUri at: 'path')).
			targetUri
				
		]
		ifFalse: [ self makeAuthorityUri ]! !

!Rfc3986UriBuilder methodsFor: 'as yet unclassified' stamp: 'jpb 1/11/2020 18:45:52'!
mergeUriPaths
	"Returns a merged path between the baseUri and the referenceURI as defined in the RFC"
	| baseAuthority basePath referencePath |
	
	baseAuthority _ baseUri at: 'authority'.
	basePath _ baseUri at: 'path'.
	referencePath _ referenceUri at: 'path'.
	
	^(baseAuthority size > 0) & (basePath size = 0)
		ifTrue: [ '/' , referencePath ]
		ifFalse: [
			(basePath includes: $/)
				ifTrue: [ | baseSegments referenceSegments newSegments |
					baseSegments _ (basePath findTokens: '/') allButLast.
					referenceSegments _ referencePath findTokens: '/'.
					newSegments _ baseSegments , referenceSegments.
					
					(referencePath endsWith: '/')
						ifTrue: [ '/' , ('/' join: newSegments) , '/' ]
						ifFalse: [  '/' , ('/' join: newSegments) ]
				]
				ifFalse: [ referencePath ]
		]! !

!Rfc3986UriBuilder methodsFor: 'as yet unclassified' stamp: 'jpb 1/8/2020 17:47:11'!
newUri
	^self uriBuilder new! !

!Rfc3986UriBuilder methodsFor: 'as yet unclassified' stamp: 'jpb 1/8/2020 17:36:54'!
referenceUri: newReferenceUri base: newBaseUri
	referenceUri _ newReferenceUri.
	baseUri _ newBaseUri! !

!Rfc3986UriBuilder methodsFor: 'as yet unclassified' stamp: 'jpb 1/9/2020 21:31:16'!
removeDotSegmentsOn: freshPath
	"Removes '..' segments in a path as defined in the RFC at https://tools.ietf.org/html/rfc3986#section-5.2.4"
	| remover |
	remover _ Rfc3986SegmentRemover new.
	remover inputBuffer: freshPath asString.
	
	^remover value! !

!Rfc3986UriBuilder methodsFor: 'as yet unclassified' stamp: 'jpb 1/8/2020 17:45:00'!
uriBuilder
	^GenericUri ! !

!String methodsFor: '*URI-Kernel' stamp: 'jpb 1/7/2020 21:07:09'!
asUri
	"Returns the string converted to a specific URI object"
	^GenericUri fromString: self! !

!FileListWindow class methodsFor: '*URI-Kernel' stamp: 'jpb 1/23/2020 20:14:02'!
openUri: foundUri
	
	| window fileModel fileName fileIdx files |
	
	fileModel _ FileList new directory: foundUri dirname asDirectoryEntry.
	fileName _ foundUri basename.
	files _ fileModel fileList.
	fileIdx _ 0.
	
	(1 to: files size) do: [:idx |  
		| item | 
		item _ fileModel fileNameFromFormattedItem: (files at: idx).
		item = fileName ifTrue: [fileIdx _ idx]
	].

	window _ FileListWindow open: fileModel label: nil.
	window model when: #updateButtonRow send: #updateButtonRow to: window.
	
	fileModel fileListIndex: fileIdx.

	^ window! !
