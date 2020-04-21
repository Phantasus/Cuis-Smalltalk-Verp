'From Cuis 5.0 [latest update: #4112] on 21 April 2020 at 8:11:46 pm'!
'Description Tests for the OMeta2 implementation of an UriParser

Author: Josef Philip Bernhart <cuis-packages@phantasus.at>
License: MIT'!
!provides: 'OMeta2UriParser-Tests' 1 0!
SystemOrganization addCategory: #'OMeta2UriParser-Tests'!


!classDefinition: #OMeta2Rfc3986ParserTest category: #'OMeta2UriParser-Tests'!
TestCase subclass: #OMeta2Rfc3986ParserTest
	instanceVariableNames: 'usedClass'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'OMeta2UriParser-Tests'!
!classDefinition: 'OMeta2Rfc3986ParserTest class' category: #'OMeta2UriParser-Tests'!
OMeta2Rfc3986ParserTest class
	instanceVariableNames: ''!


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
