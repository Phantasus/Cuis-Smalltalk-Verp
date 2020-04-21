'From Cuis 5.0 [latest update: #4112] on 21 April 2020 at 8:11:53 pm'!
'Description An implementation of an URI parser using OMeta2. Implements an actual parser as required by the URI-Kernel.

Author: Josef Philip Bernhart <cuis-packages@phantasus.at>
License: MIT'!
!provides: 'OMeta2UriParser' 1 5!
SystemOrganization addCategory: #'OMeta2UriParser-Tests'!
SystemOrganization addCategory: #OMeta2UriParser!


!classDefinition: #OMeta2Rfc3986ParserTest category: #'OMeta2UriParser-Tests'!
TestCase subclass: #OMeta2Rfc3986ParserTest
	instanceVariableNames: 'usedClass'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'OMeta2UriParser-Tests'!
!classDefinition: 'OMeta2Rfc3986ParserTest class' category: #'OMeta2UriParser-Tests'!
OMeta2Rfc3986ParserTest class
	instanceVariableNames: ''!

!classDefinition: #OMeta2Rfc3986Parser category: #OMeta2UriParser!
OMeta2 subclass: #OMeta2Rfc3986Parser
	instanceVariableNames: 'components'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'OMeta2UriParser'!
!classDefinition: 'OMeta2Rfc3986Parser class' category: #OMeta2UriParser!
OMeta2Rfc3986Parser class
	instanceVariableNames: ''!

!classDefinition: #OMeta2Rfc3986UriHandler category: #OMeta2UriParser!
Object subclass: #OMeta2Rfc3986UriHandler
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'OMeta2UriParser'!
!classDefinition: 'OMeta2Rfc3986UriHandler class' category: #OMeta2UriParser!
OMeta2Rfc3986UriHandler class
	instanceVariableNames: ''!


!OMeta2Rfc3986Parser commentStamp: '<historical>' prior: 0!
Represents a parser for URIs like they were specified in RFC 3986 (https://tools.ietf.org/html/rfc3986).

The difference to any parser which relies on the old RFC 2396 URI Generic Syntax definition is that former special fields were merged into the path component or into the authority or other fields. So the old specification had more components which could be returned.

As this parser is for the generic syntax it's supposed to parse any known URI / URL.!

!OMeta2Rfc3986UriHandler commentStamp: '<historical>' prior: 0!
Specific uri handler for the generic URIs which uses this OMeta2 based RFC 3986 (generic uri syntax). When it registers it registers as the default handler used for unknown URI schemes or the empty URI scheme.!

!OMeta2Rfc3986ParserTest methodsFor: 'as yet unclassified' stamp: 'jpb 1/26/2020 16:17:38'!
findScheme: str
	^usedClass findScheme: str! !

!OMeta2Rfc3986ParserTest methodsFor: 'as yet unclassified' stamp: 'jpb 12/30/2019 12:13:53'!
match16BitWord: mask
	[ usedClass matchAll: mask with: #ip16BitWord ] on: OM2Fail do: [ ^false ].
	
	^true! !

!OMeta2Rfc3986ParserTest methodsFor: 'as yet unclassified' stamp: 'jpb 1/6/2020 17:13:28'!
matchAlpha: str
	[ usedClass matchAll: str with: #alpha ] on: OM2Fail do: [^false].
	
	^true! !

!OMeta2Rfc3986ParserTest methodsFor: 'as yet unclassified' stamp: 'jpb 12/30/2019 19:10:58'!
matchAuthority: str
	[ usedClass matchAll: str with: #authority ] on: OM2Fail do: [ ^false ].
	
	^true! !

!OMeta2Rfc3986ParserTest methodsFor: 'as yet unclassified' stamp: 'jpb 12/29/2019 16:59:16'!
matchHexdigit: collection
	^usedClass matchAll: collection with: #hexdigit! !

!OMeta2Rfc3986ParserTest methodsFor: 'as yet unclassified' stamp: 'jpb 12/30/2019 18:44:51'!
matchHost: str
	[ usedClass matchAll: str with: #host ] on: OM2Fail do: [^false].
	
	^true! !

!OMeta2Rfc3986ParserTest methodsFor: 'as yet unclassified' stamp: 'jpb 1/4/2020 16:18:08'!
matchIpV4Address: address
	[ usedClass matchAll: address with: #ipV4Address ] on: OM2Fail do: [ ^false ].
	
	^true! !

!OMeta2Rfc3986ParserTest methodsFor: 'as yet unclassified' stamp: 'jpb 12/30/2019 11:55:15'!
matchIpV6Address: address
	[ usedClass matchAll: address with: #ipV6Address ] on: OM2Fail do: [ ^false ].
	
	^true! !

!OMeta2Rfc3986ParserTest methodsFor: 'as yet unclassified' stamp: 'jpb 12/30/2019 12:12:40'!
matchLeastSignificant32Bit: value
	[ usedClass matchAll: value with: #leastSignificant32Bit ] on: OM2Fail do: [ ^false ].
	
	^true! !

!OMeta2Rfc3986ParserTest methodsFor: 'as yet unclassified' stamp: 'jpb 12/27/2019 18:43:10'!
matchUri: string
	^usedClass matchUri: string! !

!OMeta2Rfc3986ParserTest methodsFor: 'as yet unclassified' stamp: 'jpb 1/6/2020 17:17:38'!
matchUserinfo: str
	[ usedClass matchAll: str with: #userinfo ] on: OM2Fail do: [ ^false ].
	
	^true! !

!OMeta2Rfc3986ParserTest methodsFor: 'as yet unclassified' stamp: 'jpb 1/4/2020 18:24:05'!
parseUri: aString into: aDictionary 
	^usedClass parseUri: aString into: aDictionary! !

!OMeta2Rfc3986ParserTest methodsFor: 'as yet unclassified' stamp: 'jpb 1/5/2020 08:41:01'!
setUp
	usedClass _ OMeta2Rfc3986Parser.! !

!OMeta2Rfc3986ParserTest methodsFor: 'as yet unclassified' stamp: 'jpb 1/6/2020 17:17:00'!
testAuthority
	self assert: (self matchAuthority: 'www.google.com').
	self assert: (self matchAuthority: 'tools.ietf.org:21').
	self assert: (self matchAuthority: 'ftp.is.co.za:178').
	
	self assert: (self matchAuthority: 'postgres:somuchsecure123@github.com').
	self assert: (self matchAuthority: 'John.Doe@example.com').
	
	self assert: (self matchAuthority: 'postgres:foobar@127.0.0.1').
	self assert: (self matchAuthority: 'dummy:special@[6ab:2f::]').
	
	self assert: (self matchAuthority: '192.0.2.16:80').! !

!OMeta2Rfc3986ParserTest methodsFor: 'as yet unclassified' stamp: 'jpb 1/4/2020 17:10:14'!
testExtractingFieldsWithRfcExamples
	| rfcUris |
	rfcUris _ #(
		'ftp://ftp.is.co.za/rfc/rfc1808.txt'
		'http://www.ietf.org/rfc/rfc2396.txt'
		'ldap://[2001:db8::7]/c=GB?objectClass?one'
		'mailto:John.Doe@example.com'
		'news:comp.infosystems.www.servers.unix'
		'tel:+1-816-555-1212'
		'telnet://192.0.2.16:80/'
		'urn:oasis:names:specification:docbook:dtd:xml:4.1.2'
	).
	
	rfcUris do: [:string | 
		self assert: (self matchUri: string).
	].! !

!OMeta2Rfc3986ParserTest methodsFor: 'as yet unclassified' stamp: 'jpb 12/29/2019 16:58:50'!
testHexdigit
	self assert: '0' equals: (self matchHexdigit: '0').
	self assert: '1' equals: (self matchHexdigit: '1').
	self assert: '2' equals: (self matchHexdigit: '2').
	self assert: '3' equals: (self matchHexdigit: '3').
	self assert: '4' equals: (self matchHexdigit: '4').
	self assert: '5' equals: (self matchHexdigit: '5').
	self assert: '6' equals: (self matchHexdigit: '6').
	self assert: '7' equals: (self matchHexdigit: '7').
	self assert: '8' equals: (self matchHexdigit: '8').
	self assert: '9' equals: (self matchHexdigit: '9').
	
	self assert: 'a' equals: (self matchHexdigit: 'A').
	self assert: 'a' equals: (self matchHexdigit: 'a').
	self assert: 'b' equals: (self matchHexdigit: 'B').
	self assert: 'b' equals: (self matchHexdigit: 'b').
	self assert: 'c' equals: (self matchHexdigit: 'C').
	self assert: 'c' equals: (self matchHexdigit: 'c').
	self assert: 'd' equals: (self matchHexdigit: 'd').
	self assert: 'd' equals: (self matchHexdigit: 'D').
	self assert: 'e' equals: (self matchHexdigit: 'e').
	self assert: 'e' equals: (self matchHexdigit: 'E').
	self assert: 'f' equals: (self matchHexdigit: 'F').
	self assert: 'f' equals: (self matchHexdigit: 'f').
	! !

!OMeta2Rfc3986ParserTest methodsFor: 'as yet unclassified' stamp: 'jpb 12/30/2019 18:51:07'!
testHost
	self assert: (self matchHost: 'www.google.com').
	self assert: (self matchHost: 'tools.ietf.org').
	self assert: (self matchHost: 'ftp.is.co.za').
	
	self assert: (self matchHost: '127.0.0.1').
	self assert: (self matchHost: '[6ab:2f::]').
	
	! !

!OMeta2Rfc3986ParserTest methodsFor: 'as yet unclassified' stamp: 'jpb 12/29/2019 22:33:26'!
testIp16BitWord
	self assert: (self match16BitWord: 'f').
	self assert: (self match16BitWord: 'fa').
	self assert: (self match16BitWord: 'fab').
	self assert: (self match16BitWord: 'fabc').! !

!OMeta2Rfc3986ParserTest methodsFor: 'as yet unclassified' stamp: 'jpb 1/4/2020 16:18:40'!
testIpV4AddressBlockAdresses
	| validIpV4 |
	validIpV4 _ #(
		'0.0.0.0'
		'10.0.0.0'
		'100.64.0.0'
		'169.254.0.0'
		'172.16.0.0'
		'192.0.0.0'
		'192.0.2.0'
		'192.88.99.0'
		'192.168.0.0'
		'198.18.0.0'
		'198.51.100.0'
		'203.0.113.0'
		'224.0.0.0'
		'240.0.0.0'
		'198.18.0.0'
		'255.255.255.255'
	).
	
	validIpV4 do: [:address|
		self assert: (self matchIpV4Address: address).	
	].! !

!OMeta2Rfc3986ParserTest methodsFor: 'as yet unclassified' stamp: 'jpb 12/30/2019 12:02:12'!
testIpV6AddressBlocks
	| validIpV6 |
	validIpV6 _ #(
		'::'
		'::1'
		'::ffff:0:0'
		'::ffff:0:0:0'
		'64:ff9b::'
		'100::'
		'2001::'
		'2001:20::'
		'2001:db8::'
		'2002::'
		'fc00::'
		'fe80::'
		'ff00::'
	).
	
	validIpV6 do: [:address|
		self assert: (self matchIpV6Address: address).	
	].! !

!OMeta2Rfc3986ParserTest methodsFor: 'as yet unclassified' stamp: 'jpb 12/30/2019 12:02:25'!
testIpV6AddressBlocksLastAddresses
	| validIpV6 |
	validIpV6 _ #(
		'ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff'
		'::'
		'::1'
		'::ffff:255.255.255.255'
		'64:ff9b::255.255.255.255'
		'100::ffff:ffff:ffff:ffff'
		'2001::ffff:ffff:ffff:ffff:ffff:ffff'
		'2001:2f:ffff:ffff:ffff:ffff:ffff:ffff'
		'2001:db8:ffff:ffff:ffff:ffff:ffff:ffff'
		'2002:ffff:ffff:ffff:ffff:ffff:ffff:ffff'
		'2002:ffff:ffff:ffff:ffff:ffff:ffff:ffff'
		'fdff:ffff:ffff:ffff:ffff:ffff:ffff:ffff'
		'febf:ffff:ffff:ffff:ffff:ffff:ffff:ffff'
	).
	
	validIpV6 do: [:address|
		self assert: (self matchIpV6Address: address)
	].! !

!OMeta2Rfc3986ParserTest methodsFor: 'as yet unclassified' stamp: 'jpb 12/30/2019 12:12:52'!
testLeastSignificant32Bit
	self assert: (self matchLeastSignificant32Bit: '127.0.0.1').
	self assert: (self matchLeastSignificant32Bit: 'cafe:babe').! !

!OMeta2Rfc3986ParserTest methodsFor: 'as yet unclassified' stamp: 'jpb 1/4/2020 17:10:00'!
testMatchingRfcExamples
	| rfcUris |
	rfcUris _ #(
		'ftp://ftp.is.co.za/rfc/rfc1808.txt'
		'http://www.ietf.org/rfc/rfc2396.txt'
		'ldap://[2001:db8::7]/c=GB?objectClass?one'
		'mailto:John.Doe@example.com'
		'news:comp.infosystems.www.servers.unix'
		'tel:+1-816-555-1212'
		'telnet://192.0.2.16:80/'
		'urn:oasis:names:specification:docbook:dtd:xml:4.1.2'
	).
	
	rfcUris do: [:string | 
		self assert: (self matchUri: string).
	].! !

!OMeta2Rfc3986ParserTest methodsFor: 'as yet unclassified' stamp: 'jpb 1/5/2020 08:30:29'!
testParsingLongUriExample1
	| uri uriString expectedHost |
	uri _ Dictionary new.
	
	uriString _ 'http://%E3%81%BB%E3%82%93%E3%81%A8%E3%81%86%E3%81%AB%E3%81%AA%E3%81%8C%E3%81%84%E3%82%8F%E3%81%91%E3%81%AE%E3%82%8F%E3%81%8B%E3%82%89%E3%81%AA%E3%81%84%E3%81%A9%E3%82%81%E3%81%84%E3%82%93%E3%82%81%E3%81%84%E3%81%AE%E3%82%89%E3%81%B9%E3%82%8B%E3%81%BE%E3%81%A0%E3%81%AA%E3%81%8C%E3%81%8F%E3%81%97%E3%81%AA%E3%81%84%E3%81%A8%E3%81%9F%E3%82%8A%E3%81%AA%E3%81%84.%E3%81%BB%E3%82%93%E3%81%A8%E3%81%86%E3%81%AB%E3%81%AA%E3%81%8C%E3%81%84%E3%82%8F%E3%81%91%E3%81%AE%E3%82%8F%E3%81%8B%E3%82%89%E3%81%AA%E3%81%84%E3%81%A9%E3%82%81%E3%81%84%E3%82%93%E3%82%81%E3%81%84%E3%81%AE%E3%82%89%E3%81%B9%E3%82%8B%E3%81%BE%E3%81%A0%E3%81%AA%E3%81%8C%E3%81%8F%E3%81%97%E3%81%AA%E3%81%84%E3%81%A8%E3%81%9F%E3%82%8A%E3%81%AA%E3%81%84.%E3%81%BB%E3%82%93%E3%81%A8%E3%81%86%E3%81%AB%E3%81%AA%E3%81%8C%E3%81%84%E3%82%8F%E3%81%91%E3%81%AE%E3%82%8F%E3%81%8B%E3%82%89%E3%81%AA%E3%81%84%E3%81%A9%E3%82%81%E3%81%84%E3%82%93%E3%82%81%E3%81%84%E3%81%AE%E3%82%89%E3%81%B9%E3%82%8B%E3%81%BE%E3%81%A0%E3%81%AA%E3%81%8C%E3%81%8F%E3%81%97%E3%81%AA%E3%81%84%E3%81%A8%E3%81%9F%E3%82%8A%E3%81%AA%E3%81%84.w3.mag.keio.ac.jp/'.
	
	expectedHost _ '%E3%81%BB%E3%82%93%E3%81%A8%E3%81%86%E3%81%AB%E3%81%AA%E3%81%8C%E3%81%84%E3%82%8F%E3%81%91%E3%81%AE%E3%82%8F%E3%81%8B%E3%82%89%E3%81%AA%E3%81%84%E3%81%A9%E3%82%81%E3%81%84%E3%82%93%E3%82%81%E3%81%84%E3%81%AE%E3%82%89%E3%81%B9%E3%82%8B%E3%81%BE%E3%81%A0%E3%81%AA%E3%81%8C%E3%81%8F%E3%81%97%E3%81%AA%E3%81%84%E3%81%A8%E3%81%9F%E3%82%8A%E3%81%AA%E3%81%84.%E3%81%BB%E3%82%93%E3%81%A8%E3%81%86%E3%81%AB%E3%81%AA%E3%81%8C%E3%81%84%E3%82%8F%E3%81%91%E3%81%AE%E3%82%8F%E3%81%8B%E3%82%89%E3%81%AA%E3%81%84%E3%81%A9%E3%82%81%E3%81%84%E3%82%93%E3%82%81%E3%81%84%E3%81%AE%E3%82%89%E3%81%B9%E3%82%8B%E3%81%BE%E3%81%A0%E3%81%AA%E3%81%8C%E3%81%8F%E3%81%97%E3%81%AA%E3%81%84%E3%81%A8%E3%81%9F%E3%82%8A%E3%81%AA%E3%81%84.%E3%81%BB%E3%82%93%E3%81%A8%E3%81%86%E3%81%AB%E3%81%AA%E3%81%8C%E3%81%84%E3%82%8F%E3%81%91%E3%81%AE%E3%82%8F%E3%81%8B%E3%82%89%E3%81%AA%E3%81%84%E3%81%A9%E3%82%81%E3%81%84%E3%82%93%E3%82%81%E3%81%84%E3%81%AE%E3%82%89%E3%81%B9%E3%82%8B%E3%81%BE%E3%81%A0%E3%81%AA%E3%81%8C%E3%81%8F%E3%81%97%E3%81%AA%E3%81%84%E3%81%A8%E3%81%9F%E3%82%8A%E3%81%AA%E3%81%84.w3.mag.keio.ac.jp'.
	
	self assert: (self parseUri: uriString into: uri).
	self assert: 'http' equals: (uri at: 'scheme').
	self assert: expectedHost equals: (uri at: 'host').
	self assert: '/' equals: (uri at: 'path').
	self assert: expectedHost equals: (uri at: 'authority').! !

!OMeta2Rfc3986ParserTest methodsFor: 'as yet unclassified' stamp: 'jpb 1/4/2020 22:40:09'!
testParsingPostgresUriSchemeExample1
	| uri |
	uri _ Dictionary new.
	
	self assert: (self parseUri: 'postgresql://' into: uri).
	self assert: 'postgresql' equals: (uri at: 'scheme').
	self assert: '' equals: (uri at: 'path').! !

!OMeta2Rfc3986ParserTest methodsFor: 'as yet unclassified' stamp: 'jpb 1/4/2020 22:40:16'!
testParsingPostgresUriSchemeExample2
	| uri |
	uri _ Dictionary new.
	
	self assert: (self parseUri: 'postgresql://localhost' into: uri).
	self assert: 'postgresql' equals: (uri at: 'scheme').
	self assert: 'localhost' equals: (uri at: 'host').
	
	self assert: '' equals: (uri at: 'path').! !

!OMeta2Rfc3986ParserTest methodsFor: 'as yet unclassified' stamp: 'jpb 1/4/2020 22:40:21'!
testParsingPostgresUriSchemeExample3
	| uri |
	uri _ Dictionary new.
	
	self assert: (self parseUri: 'postgresql://localhost:5433' into: uri).
	self assert: 'postgresql' equals: (uri at: 'scheme').
	self assert: 'localhost' equals: (uri at: 'host').
	self assert: '5433' equals: (uri at: 'port').
	
	self assert: '' equals: (uri at: 'path').! !

!OMeta2Rfc3986ParserTest methodsFor: 'as yet unclassified' stamp: 'jpb 1/4/2020 22:40:26'!
testParsingPostgresUriSchemeExample4
	| uri |
	uri _ Dictionary new.
	
	self assert: (self parseUri: 'postgresql://localhost/mydb' into: uri).
	self assert: 'postgresql' equals: (uri at: 'scheme').
	self assert: 'localhost' equals: (uri at: 'host').
	self assert: '/mydb' equals: (uri at: 'path').! !

!OMeta2Rfc3986ParserTest methodsFor: 'as yet unclassified' stamp: 'jpb 1/4/2020 22:40:32'!
testParsingPostgresUriSchemeExample5
	| uri |
	uri _ Dictionary new.
	
	self assert: (self parseUri: 'postgresql://user@localhost' into: uri).
	self assert: 'postgresql' equals: (uri at: 'scheme').
	self assert: 'localhost' equals: (uri at: 'host').
	self assert: 'user' equals: (uri at: 'userinfo').! !

!OMeta2Rfc3986ParserTest methodsFor: 'as yet unclassified' stamp: 'jpb 1/4/2020 22:40:38'!
testParsingPostgresUriSchemeExample6
	| uri |
	uri _ Dictionary new.
	
	self assert: (self parseUri: 'postgresql://user:secret@localhost' into: uri).
	self assert: 'postgresql' equals: (uri at: 'scheme').
	self assert: 'localhost' equals: (uri at: 'host').
	self assert: 'user:secret' equals: (uri at: 'userinfo').! !

!OMeta2Rfc3986ParserTest methodsFor: 'as yet unclassified' stamp: 'jpb 1/4/2020 22:40:42'!
testParsingPostgresUriSchemeExample7
	| uri |
	uri _ Dictionary new.
	
	self assert: (self parseUri: 'postgresql://other@localhost/otherdb?connect_timeout=10&application_name=myapp' into: uri).
	self assert: 'postgresql' equals: (uri at: 'scheme').
	self assert: 'localhost' equals: (uri at: 'host').
	self assert: 'other' equals: (uri at: 'userinfo').
	self assert: '/otherdb' equals: (uri at: 'path').
	self assert: 'connect_timeout=10&application_name=myapp' equals: (uri at: 'query').! !

!OMeta2Rfc3986ParserTest methodsFor: 'as yet unclassified' stamp: 'jpb 12/31/2019 17:34:41'!
testParsingRfcAbnormalResolutionExamples
	| rfcUris |
	rfcUris _ #(
		'../../../g' '../../../../g' '/./g' '/../g' 'g.'
		'.g' 'g..' '..g' './../g' './g/.' 'g/./h' 'g/../h'
		'g;x=1/./y' 'g;x=1/../y' 'g?y/./x' 'g?y/../x'
		'g#s/./x' 'g#s/../x'
	).
	
	rfcUris do: [:string | 
		self assert: (self matchUri: string).
	].! !

!OMeta2Rfc3986ParserTest methodsFor: 'as yet unclassified' stamp: 'jpb 1/4/2020 21:31:10'!
testParsingRfcExample1
	| uri |
	
	uri _ Dictionary new.
	
	self assert: (self parseUri: 'ftp://ftp.is.co.za/rfc/rfc1808.txt' into: uri).
	
	self assert: 'ftp' equals: (uri at: 'scheme').
	self assert: 'ftp.is.co.za' equals: (uri at: 'authority').
	self assert: 'ftp.is.co.za' equals: (uri at: 'host').
	self assert: '/rfc/rfc1808.txt' equals: (uri at: 'path')
	! !

!OMeta2Rfc3986ParserTest methodsFor: 'as yet unclassified' stamp: 'jpb 1/4/2020 21:31:21'!
testParsingRfcExample2
	| uri |
	uri _ Dictionary new.
	
	self assert: (self parseUri: 'http://www.ietf.org/rfc/rfc2396.txt' into: uri).
	self assert: 'http' equals: (uri at: 'scheme').
	self assert: 'www.ietf.org' equals: (uri at: 'authority').
	self assert: 'www.ietf.org' equals: (uri at: 'host').
	self assert: '/rfc/rfc2396.txt' equals: (uri at: 'path').! !

!OMeta2Rfc3986ParserTest methodsFor: 'as yet unclassified' stamp: 'jpb 1/4/2020 21:31:36'!
testParsingRfcExample3
	| uri |
	uri _ Dictionary new.
	
	self assert: (self parseUri: 'ldap://[2001:db8::7]/c=GB?objectClass?one' into: uri).
	self assert: 'ldap' equals: (uri at: 'scheme').
	self assert: '[2001:db8::7]' equals: (uri at: 'authority').
	self assert: '[2001:db8::7]' equals: (uri at: 'host').
	self assert: '/c=GB' equals: (uri at: 'path').
	self assert: 'objectClass?one' equals: (uri at: 'query')! !

!OMeta2Rfc3986ParserTest methodsFor: 'as yet unclassified' stamp: 'jpb 1/4/2020 19:44:41'!
testParsingRfcExample4
	| uri |
	uri _ Dictionary new.
	
	self assert: (self parseUri: 'mailto:John.Doe@example.com' into: uri).
	self assert: 'mailto' equals: (uri at: 'scheme').
	self assert: 'John.Doe@example.com' equals: (uri at: 'path').! !

!OMeta2Rfc3986ParserTest methodsFor: 'as yet unclassified' stamp: 'jpb 1/4/2020 21:21:46'!
testParsingRfcExample5
	| uri |
	uri _ Dictionary new.
	
	self assert: (self parseUri: 'news:comp.infosystems.www.servers.unix' into: uri).
	self assert: 'news' equals: (uri at: 'scheme').
	self assert: 'comp.infosystems.www.servers.unix' equals: (uri at: 'path').! !

!OMeta2Rfc3986ParserTest methodsFor: 'as yet unclassified' stamp: 'jpb 1/4/2020 21:23:43'!
testParsingRfcExample6
	| uri |
	uri _ Dictionary new.
	
	self assert: (self parseUri: 'tel:+1-816-555-1212' into: uri).
	self assert: 'tel' equals: (uri at: 'scheme').
	self assert: '+1-816-555-1212' equals: (uri at: 'path').! !

!OMeta2Rfc3986ParserTest methodsFor: 'as yet unclassified' stamp: 'jpb 1/6/2020 17:28:43'!
testParsingRfcExample7
	| uri |
	uri _ Dictionary new.
	
	self assert: (self parseUri: 'telnet://192.0.2.16:80/' into: uri).
	self assert: 'telnet' equals: (uri at: 'scheme').
	self assert: '192.0.2.16:80' equals: (uri at: 'authority').
	self assert: '192.0.2.16' equals: (uri at: 'host').
	self assert: '80' equals: (uri at: 'port').
	self assert: '/' equals: (uri at: 'path').
	self assert: 'absent' equals: (uri at: 'userinfo' ifAbsent: 'absent').! !

!OMeta2Rfc3986ParserTest methodsFor: 'as yet unclassified' stamp: 'jpb 1/4/2020 21:30:48'!
testParsingRfcExample8
	| uri |
	uri _ Dictionary new.
	
	self assert: (self parseUri: 'urn:oasis:names:specification:docbook:dtd:xml:4.1.2' into: uri).
	self assert: 'urn' equals: (uri at: 'scheme').
	self assert: 'oasis:names:specification:docbook:dtd:xml:4.1.2' equals: (uri at: 'path').! !

!OMeta2Rfc3986ParserTest methodsFor: 'as yet unclassified' stamp: 'jpb 12/31/2019 17:42:50'!
testParsingRfcNormalResolutionExamples
	| rfcUris |
	rfcUris _ #(
		'http://a/b/c/d;p?q' 'g:h' 'g' './g'
		'g/' '/g' '//g' '?y' 'g?y' '#s'
		'g#s' 'g?y#s' ';x' 'g;x' 'g;x?y#s'
		'' '.' './' '..' '../' '../g' '../..' '../../' '../../g'
	).
	
	rfcUris do: [:string | 
		self assert: (self matchUri: string).
	].! !

!OMeta2Rfc3986ParserTest methodsFor: 'as yet unclassified' stamp: 'jpb 1/5/2020 18:33:52'!
testParsingWikipediaFileUriExample1
	| uri |
	uri _ Dictionary new.
	self assert: (self parseUri: 'file://hostname/path/to/the%20file.txt' into: uri).
	
	self assert: 'file' equals: (uri at: 'scheme').
	self assert: 'hostname' equals: (uri at: 'host').
	self assert: '/path/to/the%20file.txt' equals: (uri at: 'path').! !

!OMeta2Rfc3986ParserTest methodsFor: 'as yet unclassified' stamp: 'jpb 1/5/2020 18:34:51'!
testParsingWikipediaFileUriExample2
	| uri |
	uri _ Dictionary new.
	self assert: (self parseUri: 'file:///c:/path/to/the%20file.txt' into: uri).
	
	self assert: 'file' equals: (uri at: 'scheme').
	self assert: '' equals: (uri at: 'host').
	self assert: '/c:/path/to/the%20file.txt' equals: (uri at: 'path').! !

!OMeta2Rfc3986ParserTest methodsFor: 'as yet unclassified' stamp: 'jpb 1/26/2020 16:29:07'!
testScheme
	self assert: 'ftp' equals: (self findScheme: 'ftp').
	self assert: 'http' equals: (self findScheme: 'http').
	self assert: 'https' equals: (self findScheme: 'https').
	self assert: 'mailto' equals: (self findScheme: 'mailto').
	self assert: 'gopher' equals: (self findScheme: 'gopher').
	
	self assert: 'file' equals: (self findScheme: 'file:foo.example.com').
	self assert: '' equals: (self findScheme: '').
	self assert: '' equals: (self findScheme: ':').
	self assert: '' equals: (self findScheme: nil).! !

!OMeta2Rfc3986ParserTest methodsFor: 'as yet unclassified' stamp: 'jpb 1/4/2020 17:00:00'!
testWellKnownIpV4Hosts
	| validIpV4 |
	validIpV4 _ #(
		'127.0.0.1'
		'0.0.0.0'
		'8.8.8.8'
		'255.255.255.255'
	).
	
	validIpV4 do: [:address|
		self assert: (self matchIpV4Address: address)	
	].! !

!OMeta2Rfc3986Parser methodsFor: 'as yet unclassified' stamp: 'jpb 1/9/2020 19:45:46'!
absoluteUri =
	scheme:foundScheme ":" -> [ self componentAt: 'scheme' put: foundScheme ]
	 hierarchicalPart
	("?" <query>:foundQuery )? -> [ self componentAt: 'query' put: foundQuery ]! !

!OMeta2Rfc3986Parser methodsFor: 'as yet unclassified' stamp: 'jpb 1/6/2020 17:53:46'!
authority =
	(<userinfo "@">:foundUserinfo)? -> [ self componentAt: 'userinfo' put: foundUserinfo ]
	<host>:foundHost -> [ self componentAt: 'host' put: foundHost ]
	 (":" <portNumber>:foundPort)? -> [ self componentAt: 'port' put: foundPort ]! !

!OMeta2Rfc3986Parser methodsFor: 'as yet unclassified' stamp: 'jpb 1/6/2020 17:48:23'!
componentAt: name put: content
	content isNil ifTrue: [ ^self ].
	
	'userinfo' = name ifTrue: [ components at: name put: (content withoutSuffix: '@'). ^self ].
	
	components at: name put: content.! !

!OMeta2Rfc3986Parser methodsFor: 'as yet unclassified' stamp: 'jpb 12/31/2019 17:25:02'!
decimalOctet =
	"1" limitedDigit(0. 9) limitedDigit(0. 9) |
	"2" limitedDigit(0. 5) limitedDigit(0. 5) | 
	limitedDigit(0. 9) limitedDigit(0. 9) |
	limitedDigit(0. 9)! !

!OMeta2Rfc3986Parser methodsFor: 'as yet unclassified' stamp: 'jpb 1/4/2020 18:20:14'!
fragment =
	(pchar | "/" | "?")*! !

!OMeta2Rfc3986Parser methodsFor: 'as yet unclassified' stamp: 'jpb 7/5/2019 15:50:01'!
genericDelimiters =
	 ":" | "/" | "?" | "#" | "[" | "]" | "@"
! !

!OMeta2Rfc3986Parser methodsFor: 'as yet unclassified' stamp: 'jpb 12/31/2019 16:17:00'!
hexdigit =
	<digit | ("A" | "B" | "C" | "D" |  "E" | "F") |
		 ("a" | "b" | "c" | "d" | "e" | "f" )>:hexchar -> [ hexchar asLowercase ]! !

!OMeta2Rfc3986Parser methodsFor: 'as yet unclassified' stamp: 'jpb 1/4/2020 19:46:52'!
hierarchicalPart  =
	"//" <authority>:foundAuthority -> [ self componentAt: 'authority' put: foundAuthority ]
	<pathAbsoluteEmpty>:foundPath -> [ self componentAt: 'path' put: foundPath ] |
	<pathAbsolute>:foundPath -> [ self componentAt: 'path' put: foundPath ] |
	 <pathRootless>:foundPath -> [ self componentAt: 'path' put: foundPath ] |
	 pathEmpty! !

!OMeta2Rfc3986Parser methodsFor: 'as yet unclassified' stamp: 'jpb 1/4/2020 18:14:31'!
host = 
	ipLiteral | ipV4Address | registeredName! !

!OMeta2Rfc3986Parser methodsFor: 'as yet unclassified' stamp: 'jpb 1/4/2020 18:13:58'!
initialize
	super initialize.
	
	components _ Dictionary new.! !

!OMeta2Rfc3986Parser methodsFor: 'as yet unclassified' stamp: 'jpb 12/30/2019 12:07:44'!
ip16BitWord =
	hexdigit hexdigit? hexdigit? hexdigit?! !

!OMeta2Rfc3986Parser methodsFor: 'as yet unclassified' stamp: 'jpb 12/30/2019 18:48:35'!
ipLiteral =
	"[" ( ipV6Address | ipVFutureAddress ) "]"! !

!OMeta2Rfc3986Parser methodsFor: 'as yet unclassified' stamp: 'jpb 12/28/2019 17:28:16'!
ipV4Address =
	decimalOctet "." decimalOctet "." decimalOctet "." decimalOctet! !

!OMeta2Rfc3986Parser methodsFor: 'as yet unclassified' stamp: 'jpb 12/29/2019 17:36:19'!
ipV6Address =
	ipV6AddressExactlySixGroup |
	ipV6AddressExactlyFiveGroup |
	ipV6AddressExactlyFourGroup |
	ipV6AddressExactlyThreeGroup |
	ipV6AddressExactlyTwoGroup |
	ipV6AddressExactlyOneGroup |
	ipV6AddressOptionalFourGroup |
	ipV6AddressOptionalFiveGroup |
	ipV6AddressOptionalSixGroup! !

!OMeta2Rfc3986Parser methodsFor: 'as yet unclassified' stamp: 'jpb 12/31/2019 16:17:24'!
ipV6AddressExactlyFiveGroup =
	"::" ip16BitWord ":"  ip16BitWord ":"  ip16BitWord ":"  ip16BitWord ":"  ip16BitWord ":" leastSignificant32Bit! !

!OMeta2Rfc3986Parser methodsFor: 'as yet unclassified' stamp: 'jpb 12/30/2019 11:38:11'!
ipV6AddressExactlyFourGroup =
	ip16BitWord?  "::" ip16BitWord ":" ip16BitWord ":" ip16BitWord ":" ip16BitWord ":" leastSignificant32Bit! !

!OMeta2Rfc3986Parser methodsFor: 'as yet unclassified' stamp: 'jpb 12/30/2019 14:28:16'!
ipV6AddressExactlyOneGroup =
	(ip16BitWord ":" ~":")? (ip16BitWord ":" ~":")? (ip16BitWord ":" ~":")? ip16BitWord?
	 "::" ip16BitWord ":"  leastSignificant32Bit! !

!OMeta2Rfc3986Parser methodsFor: 'as yet unclassified' stamp: 'jpb 12/30/2019 11:43:08'!
ipV6AddressExactlySixGroup =
	ip16BitWord ":" ip16BitWord ":" ip16BitWord ":" ip16BitWord ":" ip16BitWord ":" ip16BitWord ":" leastSignificant32Bit! !

!OMeta2Rfc3986Parser methodsFor: 'as yet unclassified' stamp: 'jpb 12/30/2019 14:27:42'!
ipV6AddressExactlyThreeGroup =
	(ip16BitWord ":" ~":")? ip16BitWord? "::" ip16BitWord ":" ip16BitWord ":" ip16BitWord ":" leastSignificant32Bit! !

!OMeta2Rfc3986Parser methodsFor: 'as yet unclassified' stamp: 'jpb 12/30/2019 14:27:29'!
ipV6AddressExactlyTwoGroup =
	(ip16BitWord ":" ~":")? (ip16BitWord ":" ~":")? ip16BitWord? "::" ip16BitWord ":" ip16BitWord ":" leastSignificant32Bit! !

!OMeta2Rfc3986Parser methodsFor: 'as yet unclassified' stamp: 'jpb 12/30/2019 14:27:07'!
ipV6AddressOptionalFiveGroup =
	(ip16BitWord ":" ~":")? (ip16BitWord ":" ~":")? (ip16BitWord ":" ~":")? (ip16BitWord ":" ~":")? (ip16BitWord ":" ~":")?  ip16BitWord? "::" ip16BitWord! !

!OMeta2Rfc3986Parser methodsFor: 'as yet unclassified' stamp: 'jpb 12/30/2019 14:26:39'!
ipV6AddressOptionalFourGroup =
	(ip16BitWord ":" ~":")? (ip16BitWord ":" ~":")? (ip16BitWord ":" ~":")? (ip16BitWord ":" ~":")?  ip16BitWord? "::" leastSignificant32Bit! !

!OMeta2Rfc3986Parser methodsFor: 'as yet unclassified' stamp: 'jpb 12/30/2019 14:26:06'!
ipV6AddressOptionalSixGroup =
	(ip16BitWord ":" ~":")? (ip16BitWord ":" ~":")? (ip16BitWord ":" ~":")?
	(ip16BitWord ":" ~":")? (ip16BitWord ":" ~":")? (ip16BitWord ":" ~":")?  ip16BitWord? "::"! !

!OMeta2Rfc3986Parser methodsFor: 'as yet unclassified' stamp: 'jpb 7/5/2019 16:02:48'!
ipVFutureAddress =
	"v" hexdigit  hexdigit* "." (unreserved | subComponentDelimiters | ":") (unreserved | subComponentDelimiters | ":")*! !

!OMeta2Rfc3986Parser methodsFor: 'as yet unclassified' stamp: 'jpb 12/30/2019 11:48:14'!
leastSignificant32Bit =
	( ip16BitWord ":" ip16BitWord ) | ipV4Address! !

!OMeta2Rfc3986Parser methodsFor: 'as yet unclassified' stamp: 'jpb 12/31/2019 17:23:06'!
limitedDigit :min :max =
	digit:found ?[ (min to: max) includes: found digitValue ]! !

!OMeta2Rfc3986Parser methodsFor: 'as yet unclassified' stamp: 'jpb 12/30/2019 19:49:16'!
path =
	pathAbsoluteEmpty |
	pathAbsolute |
	pathWithoutScheme |
	pathRootless |
	pathEmpty

! !

!OMeta2Rfc3986Parser methodsFor: 'as yet unclassified' stamp: 'jpb 12/30/2019 19:17:41'!
pathAbsolute =
	"/" (pathSegmentNonZero ("/" pathSegment)* )?! !

!OMeta2Rfc3986Parser methodsFor: 'as yet unclassified' stamp: 'jpb 12/30/2019 19:15:44'!
pathAbsoluteEmpty =
	("/" pathSegment)*! !

!OMeta2Rfc3986Parser methodsFor: 'as yet unclassified' stamp: 'jpb 12/30/2019 19:26:04'!
pathEmpty =
	~pchar! !

!OMeta2Rfc3986Parser methodsFor: 'as yet unclassified' stamp: 'jpb 12/30/2019 19:20:26'!
pathRootless =
	pathSegmentNonZero ("/" pathSegment)*! !

!OMeta2Rfc3986Parser methodsFor: 'as yet unclassified' stamp: 'jpb 12/30/2019 19:16:03'!
pathSegment =
	pchar*! !

!OMeta2Rfc3986Parser methodsFor: 'as yet unclassified' stamp: 'jpb 12/30/2019 19:18:03'!
pathSegmentNonZero =
	pchar+! !

!OMeta2Rfc3986Parser methodsFor: 'as yet unclassified' stamp: 'jpb 12/30/2019 19:23:55'!
pathSegmentNonZeroWithoutColons =
	(unreserved | percentEncoded | subComponentDelimiters | "@")+! !

!OMeta2Rfc3986Parser methodsFor: 'as yet unclassified' stamp: 'jpb 12/30/2019 19:24:47'!
pathWithoutScheme =
	pathSegmentNonZeroWithoutColons ("/" pathSegment)*! !

!OMeta2Rfc3986Parser methodsFor: 'as yet unclassified' stamp: 'jpb 12/30/2019 20:50:46'!
pchar =
	unreserved | percentEncoded | subComponentDelimiters | ":" | "@"! !

!OMeta2Rfc3986Parser methodsFor: 'as yet unclassified' stamp: 'jpb 12/30/2019 19:07:12'!
percentEncoded =
	"%" hexdigit hexdigit
! !

!OMeta2Rfc3986Parser methodsFor: 'as yet unclassified' stamp: 'jpb 12/30/2019 19:13:57'!
portNumber =
	digit*! !

!OMeta2Rfc3986Parser methodsFor: 'as yet unclassified' stamp: 'jpb 12/30/2019 18:53:38'!
query =
	(pchar | "/" | "?")*	
! !

!OMeta2Rfc3986Parser methodsFor: 'as yet unclassified' stamp: 'jpb 12/30/2019 18:47:28'!
registeredName =
	(unreserved | percentEncoded | subComponentDelimiters)*! !

!OMeta2Rfc3986Parser methodsFor: 'as yet unclassified' stamp: 'jpb 1/9/2020 20:59:47'!
relativePart =
	("//" <authority>:foundAuthority <pathAbsoluteEmpty>:foundPath)
		-> [ self componentAt: 'authority' put: foundAuthority ]
		-> [ self componentAt: 'path' put: foundPath ] 
	 | 
	<pathAbsolute>:foundPath -> [ self componentAt: 'path' put: foundPath ] |
	<pathWithoutScheme>:foundPath -> [ self componentAt: 'path' put: foundPath ] | 
	<pathEmpty>:foundPath -> [ self componentAt: 'path' put: foundPath ]! !

!OMeta2Rfc3986Parser methodsFor: 'as yet unclassified' stamp: 'jpb 1/9/2020 20:55:52'!
relativeReference =
	relativePart
	("?" <query>:foundQuery)? -> [ self componentAt: 'query' put: foundQuery ]
	("#" <fragment>:foundFragment )? -> [ self componentAt: 'fragment' put: foundFragment ]! !

!OMeta2Rfc3986Parser methodsFor: 'as yet unclassified' stamp: 'jpb 7/5/2019 15:49:18'!
reserved =
	genericDelimetrs | subComponentDelimiters! !

!OMeta2Rfc3986Parser methodsFor: 'as yet unclassified' stamp: 'jpb 1/4/2020 18:19:02'!
scheme =
	<letter (letter | digit | "+" | "-" | ".")*>! !

!OMeta2Rfc3986Parser methodsFor: 'as yet unclassified' stamp: 'jpb 1/4/2020 18:37:02'!
storeComponentsInto: store
 	components associationsDo: [:assoc| store at: assoc key put: assoc value ].
	
	^store! !

!OMeta2Rfc3986Parser methodsFor: 'as yet unclassified' stamp: 'jpb 7/5/2019 15:50:50'!
subComponentDelimiters =
	"!!" | "$" | "&" | "'" | "(" | ")" |  "*" | "+" | "," | ";" | "="! !

!OMeta2Rfc3986Parser methodsFor: 'as yet unclassified' stamp: 'jpb 1/6/2020 17:42:43'!
unreserved =
	letter | digit | "-" | "." | "_" | "~"

! !

!OMeta2Rfc3986Parser methodsFor: 'as yet unclassified' stamp: 'jpb 1/4/2020 19:43:39'!
uri =
	scheme:foundScheme ":" -> [ self componentAt: 'scheme' put: foundScheme ]
	 hierarchicalPart
	("?" <query>:foundQuery )? -> [ self componentAt: 'query' put: foundQuery ]
	 ("#" <fragment>:foundFragment)? -> [ self componentAt: 'fragment' put: foundFragment ]! !

!OMeta2Rfc3986Parser methodsFor: 'as yet unclassified' stamp: 'jpb 1/9/2020 20:04:31'!
uriReference =
	uri | relativeReference -> [ self ]! !

!OMeta2Rfc3986Parser methodsFor: 'as yet unclassified' stamp: 'jpb 1/6/2020 17:30:03'!
userinfo =
	(unreserved | percentEncoded | subComponentDelimiters | ":")*! !

!OMeta2Rfc3986Parser class methodsFor: 'parsing' stamp: 'jpb 1/26/2020 16:27:53'!
findScheme: inputString
	"Returns the scheme if any found"
	| schemeCandidate delimiterIdx |
	
	inputString ifNil: [^''].
	inputString ifEmpty: [^''].
	
	delimiterIdx _ inputString findString: ':'.
	schemeCandidate _ delimiterIdx > 0
		ifTrue: [ inputString copyFrom: 1 to: delimiterIdx - 1 ]
		ifFalse: [ inputString ].
	
	[ ^self matchAll: schemeCandidate with: #scheme ] on: OM2Fail do: [ ^'' ].
	! !

!OMeta2Rfc3986Parser class methodsFor: 'parsing' stamp: 'jpb 1/9/2020 19:46:17'!
matchAbsoluteUri: collectionOrString
	"Returns true if the given string looks like an uri"

	[ self matchAll: collectionOrString with: #absoluteUri ] on: OM2Fail do: [ ^false ].
	
	^true! !

!OMeta2Rfc3986Parser class methodsFor: 'parsing' stamp: 'jpb 1/5/2020 18:10:06'!
matchUri: collectionOrString
	"Returns true if the given string looks like an uri"

	[ self matchAll: collectionOrString with: #uriReference ] on: OM2Fail do: [ ^false ].
	
	^true! !

!OMeta2Rfc3986Parser class methodsFor: 'parsing' stamp: 'jpb 1/6/2020 17:10:17'!
parseUri: uriString into: uriStore
	"Parses the given uri string into components which are then stored into the given uri store"
	| parser |
	
	uriStore at: 'original' put: uriString.
	[ parser _ self matchAll: uriString with: #uriReference ] on: OM2Fail do: [ ^false ].
	
	parser storeComponentsInto: uriStore.
	
	^true! !

!OMeta2Rfc3986UriHandler methodsFor: 'as yet unclassified' stamp: 'jpb 1/26/2020 17:46:14'!
findScheme: aString 
	^OMeta2Rfc3986Parser findScheme: aString! !

!OMeta2Rfc3986UriHandler methodsFor: 'as yet unclassified' stamp: 'jpb 1/26/2020 17:32:48'!
openUri: uri
	"Do nothing "! !

!OMeta2Rfc3986UriHandler methodsFor: 'as yet unclassified' stamp: 'jpb 1/26/2020 18:11:10'!
parseUri: uriString into: uriContainer
	OMeta2Rfc3986Parser parseUri: uriString into: uriContainer.
	
	^uriContainer! !

!OMeta2Rfc3986UriHandler methodsFor: 'as yet unclassified' stamp: 'jpb 1/26/2020 19:10:51'!
parseUri: uriString with: uriRegistry
	| uri |
	uri _ Rfc3986GenericUri new.
	self parseUri: uriString into: uri.
		
	^Uri with: uri! !

!OMeta2Rfc3986UriHandler methodsFor: 'as yet unclassified' stamp: 'jpb 1/26/2020 17:29:08'!
registerOn: uriRegistry
	"Registers on the given uri registry"
	uriRegistry at: '' put: self.! !
