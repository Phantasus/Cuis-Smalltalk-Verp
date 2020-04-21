'From Cuis 5.0 [latest update: #3959] on 23 January 2020 at 6:15:19 am'!
'Description '!
!provides: 'URI-Kernel-Tests' 1 8!
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
