 
W/Users/ratheesh/Documents/Work/Apis/EdBuddyApi/src/edbuddy.dal/DbQueries/CommandText.cs
	namespace 	
edbuddy
 
. 
dal 
. 
	DbQueries 
{ 
public 

class 
CommandText 
: 
ICommandText +
{ 
public		 
string		 
GetAppClientAuth		 &
=>		' )
$str		* 9
;		9 :
public

 
string

 
AuthenticateUser

 &
=>

' )
$str

* <
;

< =
public 
string 
GetUserData !
=>" $
$str% 2
;2 3
} 
} í
X/Users/ratheesh/Documents/Work/Apis/EdBuddyApi/src/edbuddy.dal/DbQueries/ICommandText.cs
	namespace 	
edbuddy
 
. 
dal 
. 
	DbQueries 
{ 
public 

	interface 
ICommandText !
{ 
string		 
GetAppClientAuth		 
{		  !
get		" %
;		% &
}		' (
string

 
AuthenticateUser

 
{

  !
get

" %
;

% &
}

' (
string 
GetUserData 
{ 
get  
;  !
}" #
} 
} ˙%
b/Users/ratheesh/Documents/Work/Apis/EdBuddyApi/src/edbuddy.dal/Repositories/AppClientRepository.cs
	namespace 	
edbuddy
 
. 
dal 
. 
Repositories "
{ 
public 

class 
AppClientRepository $
:% &
BaseRepository' 5
,5 6 
IAppClientRepository7 K
{ 
private 
readonly 
ICommandText %
_commandText& 2
;2 3
private 
readonly 
IConfiguration '
_configuration( 6
;6 7
public 
AppClientRepository "
(" #
ICommandText# /
commandText0 ;
,; <
IConfiguration= K
configurationL Y
)Y Z
:[ \
base] a
(a b
configurationb o
)o p
{ 	
_commandText 
= 
commandText &
;& '
_configuration 
= 
configuration *
;* +
} 	
public$$ 
async$$ 
Task$$ 
<$$ 
ApiResponse$$ %
<$$% &
IEnumerable$$& 1
<$$1 2
ClientAuthResponse$$2 D
>$$D E
>$$E F
>$$F G
AuthenitcateClient$$H Z
($$Z [

ClientAuth$$[ e

clientAuth$$f p
)$$p q
{%% 	
ApiResponse&& 
<&& 
IEnumerable&& #
<&&# $
ClientAuthResponse&&$ 6
>&&6 7
>&&7 8

dbResponse&&9 C
=&&D E
new&&F I
ApiResponse&&J U
<&&U V
IEnumerable&&V a
<&&a b
ClientAuthResponse&&b t
>&&t u
>&&u v
(&&v w
)&&w x
;&&x y
DynamicParameters'' 

parameters'' (
='') *
new''+ .
DynamicParameters''/ @
(''@ A
)''A B
;''B C

parameters(( 
.(( 
Add(( 
((( 
$str(( &
,((& '

clientAuth((( 2
.((2 3
	ClientKey((3 <
)((< =
;((= >

parameters)) 
.)) 
Add)) 
()) 
$str)) )
,))) *

clientAuth))+ 5
.))5 6
ClientSecret))6 B
)))B C
;))C D

parameters** 
.** 
Add** 
(** 
$str** #
,**# $
dbType**% +
:**+ ,
DbType**- 3
.**3 4
Int32**4 9
,**9 :
	direction**; D
:**D E
ParameterDirection**F X
.**X Y
Output**Y _
)**_ `
;**` a

parameters++ 
.++ 
Add++ 
(++ 
$str++ $
,++$ %
dbType++& ,
:++, -
DbType++. 4
.++4 5
String++5 ;
,++; <
	direction++= F
:++F G
ParameterDirection++H Z
.++Z [
Output++[ a
,++a b
size++c g
:++g h
$num++i m
)++m n
;++n o
await,, 
WithConnection,,  
(,,  !
async,,! &
conn,,' +
=>,,, .
{-- 
var.. 
query.. 
=.. 
await.. $
conn..% )
...) *

QueryAsync..* 4
<..4 5
ClientAuthResponse..5 G
>..G H
(..H I
_commandText..I U
...U V
GetAppClientAuth..V f
,..f g

parameters..h r
,..r s
commandType..t 
:	.. Ä
CommandType
..Å å
.
..å ç
StoredProcedure
..ç ú
)
..ú ù
;
..ù û

dbResponse00 
.00 
Code00 "
=00# $

parameters00% /
.00/ 0
Get000 3
<003 4
int004 7
>007 8
(008 9
$str009 A
)00A B
;00B C

dbResponse11 
.11 
Message11 %
=11& '

parameters11( 2
.112 3
Get113 6
<116 7
string117 =
>11= >
(11> ?
$str11? H
)11H I
;11I J

dbResponse22 
.22 
Data22 "
=22# $
query22% *
.22* +
ToList22+ 1
(221 2
)222 3
;223 4
}55 
)55 
;55 
return66 
await66 
Task66 
.66 

FromResult66 (
<66( )
ApiResponse66) 4
<664 5
IEnumerable665 @
<66@ A
ClientAuthResponse66A S
>66S T
>66T U
>66U V
(66V W

dbResponse66W a
)66a b
;66b c
}77 	
}88 
}99 á6
]/Users/ratheesh/Documents/Work/Apis/EdBuddyApi/src/edbuddy.dal/Repositories/BaseRepository.cs
	namespace 	
edbuddy
 
. 
dal 
. 
Repositories "
{		 
public

 
abstract

 
class

 
BaseRepository

 %
{ 
private 	
readonly
 
IConfiguration !
_configuration" 0
;0 1
private 	
readonly
 
string 
_ConnectionString +
;+ ,
	protected 
BaseRepository 
( 
IConfiguration )
configuration* 7
)7 8
{ 
_configuration 
= 
configuration !
;! "
_ConnectionString 
= 
_configuration $
.$ %
GetConnectionString% 8
(8 9
$str9 L
)L M
;M N
} 
	protected 
async 
Task 
< 
T 
> 
WithConnection (
<( )
T) *
>* +
(+ ,
Func, 0
<0 1
IDbConnection1 >
,> ?
Task@ D
<D E
TE F
>F G
>G H
getDataI P
)P Q
{ 
try 
{ 
using 
( 
var 

connection %
=& '
new( +
SqlConnection, 9
(9 :
_ConnectionString: K
)K L
)L M
{ 
await 


connection 
. 
	OpenAsync 
(  
)  !
;! "
return 
await 
getData 
( 

connection $
)$ %
;% &
} 
}   
catch!! 
(!!	 

TimeoutException!!
 
ex!! 
)!! 
{"" 
throw## 	
new##
 
	Exception## 
(## 
String## 
.## 
Format## %
(##% &
$str##& V
,##V W
GetType##X _
(##_ `
)##` a
.##a b
FullName##b j
)##j k
,##k l
ex##m o
)##o p
;##p q
}$$ 
catch%% 
(%%	 

SqlException%%
 
ex%% 
)%% 
{&& 
throw'' 	
new''
 
	Exception'' 
('' 
String'' 
.'' 
Format'' %
(''% &
$str''& h
,''h i
GetType''j q
(''q r
)''r s
.''s t
FullName''t |
)''| }
,''} ~
ex	'' Å
)
''Å Ç
;
''Ç É
}(( 
})) 
	protected,, 
async,, 
Task,, 
WithConnection,, %
(,,% &
Func,,& *
<,,* +
IDbConnection,,+ 8
,,,8 9
Task,,: >
>,,> ?
getData,,@ G
),,G H
{-- 
try.. 
{// 
using00 
(00 
var00 

connection00 
=00 
new00 !
SqlConnection00" /
(00/ 0
_ConnectionString000 A
)00A B
)00B C
{11 
await22 


connection22 
.22 
	OpenAsync22 
(22  
)22  !
;22! "
await33 
getData33 
(33 

connection33 
)33 
;33  
}44 
}66 
catch77 
(77	 

TimeoutException77
 
ex77 
)77 
{88 
throw99 	
new99
 
	Exception99 
(99 
String99 
.99 
Format99 %
(99% &
$str99& V
,99V W
GetType99X _
(99_ `
)99` a
.99a b
FullName99b j
)99j k
,99k l
ex99m o
)99o p
;99p q
}:: 
catch;; 
(;;	 

SqlException;;
 
ex;; 
);; 
{<< 
throw== 	
new==
 
	Exception== 
(== 
String== 
.== 
Format== %
(==% &
$str==& h
,==h i
GetType==j q
(==q r
)==r s
.==s t
FullName==t |
)==| }
,==} ~
ex	== Å
)
==Å Ç
;
==Ç É
}>> 
}?? 
	protectedBB 
asyncBB 
TaskBB 
<BB 
TResultBB 
>BB 
WithConnectionBB  .
<BB. /
TReadBB/ 4
,BB4 5
TResultBB6 =
>BB= >
(BB> ?
FuncBB? C
<BBC D
IDbConnectionBBD Q
,BBQ R
TaskBBS W
<BBW X
TReadBBX ]
>BB] ^
>BB^ _
getDataBB` g
,BBg h
FuncBBi m
<BBm n
TReadBBn s
,BBs t
TaskBBu y
<BBy z
TResult	BBz Å
>
BBÅ Ç
>
BBÇ É
process
BBÑ ã
)
BBã å
{CC 
tryDD 
{EE 
usingFF 	
(FF
 
varFF 

connectionFF 
=FF 
newFF 
SqlConnectionFF  -
(FF- .
_ConnectionStringFF. ?
)FF? @
)FF@ A
{GG 
awaitHH 


connectionHH 
.HH 
	OpenAsyncHH 
(HH  
)HH  !
;HH! "
varII 
dataII	 
=II 
awaitII 
getDataII 
(II 

connectionII (
)II( )
;II) *
returnJJ 
awaitJJ 
processJJ 
(JJ 
dataJJ 
)JJ 
;JJ  
}KK 
}MM 
catchNN 
(NN	 

TimeoutExceptionNN
 
exNN 
)NN 
{OO 
throwPP 	
newPP
 
	ExceptionPP 
(PP 
StringPP 
.PP 
FormatPP %
(PP% &
$strPP& V
,PPV W
GetTypePPX _
(PP_ `
)PP` a
.PPa b
FullNamePPb j
)PPj k
,PPk l
exPPm o
)PPo p
;PPp q
}QQ 
catchRR 
(RR	 

SqlExceptionRR
 
exRR 
)RR 
{SS 
throwTT 	
newTT
 
	ExceptionTT 
(TT 
StringTT 
.TT 
FormatTT %
(TT% &
$strTT& h
,TTh i
GetTypeTTj q
(TTq r
)TTr s
.TTs t
FullNameTTt |
)TT| }
,TT} ~
ex	TT Å
)
TTÅ Ç
;
TTÇ É
}UU 
}VV 
}WW 
}YY ò
c/Users/ratheesh/Documents/Work/Apis/EdBuddyApi/src/edbuddy.dal/Repositories/IAppClientRepository.cs
	namespace 	
edbuddy
 
. 
dal 
. 
Repositories "
{		 
public

 	
	interface


  
IAppClientRepository

 (
{ 
Task 
< 
ApiResponse 
< 
IEnumerable #
<# $
ClientAuthResponse$ 6
>6 7
>7 8
>8 9
AuthenitcateClient: L
(L M

ClientAuthM W

clientAuthX b
)b c
;c d
} 
} Û
^/Users/ratheesh/Documents/Work/Apis/EdBuddyApi/src/edbuddy.dal/Repositories/IUserRepository.cs
	namespace 	
edbuddy
 
. 
dal 
. 
Repositories "
{		 
public

 	
	interface


 
IUserRepository

 #
{ 
Task 
< 
ApiResponse 
< 
IEnumerable #
<# $
LoginResponse$ 1
>1 2
>2 3
>3 4
AuthenitcateUser5 E
(E F
	UserLoginF O
loginP U
)U V
;V W
Task 
< 
ApiResponse 
< 
LoginResponse %
>% &
>& '
GetUserData( 3
(3 4
string4 :
userName; C
)C D
;D E
} 
} π>
]/Users/ratheesh/Documents/Work/Apis/EdBuddyApi/src/edbuddy.dal/Repositories/UserRepository.cs
	namespace 	
edbuddy
 
. 
dal 
. 
Repositories "
{ 
public 

class 
UserRepository 
:  !
BaseRepository" 0
,0 1
IUserRepository2 A
{ 
private 
readonly 
ICommandText %
_commandText& 2
;2 3
public 
UserRepository 
( 
IConfiguration ,
configuration- :
,: ;
ICommandText< H
commandTextI T
)T U
:V W
baseX \
(\ ]
configuration] j
)j k
{ 	
_commandText 
= 
commandText &
;& '
} 	
public 
async 
Task 
< 
ApiResponse %
<% &
IEnumerable& 1
<1 2
LoginResponse2 ?
>? @
>@ A
>A B
AuthenitcateUserC S
(S T
	UserLoginT ]
login^ c
)c d
{ 	
ApiResponse 
< 
IEnumerable #
<# $
LoginResponse$ 1
>1 2
>2 3

dbResponse4 >
=? @
newA D
ApiResponseE P
<P Q
IEnumerableQ \
<\ ]
LoginResponse] j
>j k
>k l
(l m
)m n
;n o
DynamicParameters 

parameters (
=) *
new+ .
DynamicParameters/ @
(@ A
)A B
;B C

parameters 
. 
Add 
( 
$str %
,% &
login' ,
., -
Username- 5
)5 6
;6 7

parameters 
. 
Add 
( 
$str %
,% &
login' ,
., -
Password- 5
)5 6
;6 7

parameters 
. 
Add 
( 
$str &
,& '
login( -
.- .
	IpAddress. 7
)7 8
;8 9

parameters!! 
.!! 
Add!! 
(!! 
$str!! #
,!!# $
dbType!!% +
:!!+ ,
DbType!!- 3
.!!3 4
Int32!!4 9
,!!9 :
	direction!!; D
:!!D E
ParameterDirection!!F X
.!!X Y
Output!!Y _
)!!_ `
;!!` a

parameters"" 
."" 
Add"" 
("" 
$str"" $
,""$ %
dbType""& ,
:"", -
DbType"". 4
.""4 5
String""5 ;
,""; <
	direction""= F
:""F G
ParameterDirection""H Z
.""Z [
Output""[ a
,""a b
size""c g
:""g h
$num""i m
)""m n
;""n o
await## 
WithConnection##  
(##  !
async##! &
conn##' +
=>##, .
{$$ 
var%% 
query%% 
=%% 
await%% $
conn%%% )
.%%) *

QueryAsync%%* 4
<%%4 5
LoginResponse%%5 B
>%%B C
(%%C D
_commandText%%D P
.%%P Q
AuthenticateUser%%Q a
,%%a b

parameters%%c m
,%%m n
commandType%%o z
:%%z {
CommandType	%%| á
.
%%á à
StoredProcedure
%%à ó
)
%%ó ò
;
%%ò ô

dbResponse'' 
.'' 
Code'' "
=''# $

parameters''% /
.''/ 0
Get''0 3
<''3 4
int''4 7
>''7 8
(''8 9
$str''9 A
)''A B
;''B C

dbResponse(( 
.(( 
Message(( %
=((& '

parameters((( 2
.((2 3
Get((3 6
<((6 7
string((7 =
>((= >
(((> ?
$str((? H
)((H I
;((I J

dbResponse)) 
.)) 
Data)) "
=))# $
query))% *
.))* +
ToList))+ 1
())1 2
)))2 3
;))3 4
},, 
),, 
;,, 
return-- 
await-- 
Task-- 
.-- 

FromResult-- (
<--( )
ApiResponse--) 4
<--4 5
IEnumerable--5 @
<--@ A
LoginResponse--A N
>--N O
>--O P
>--P Q
(--Q R

dbResponse--R \
)--\ ]
;--] ^
}.. 	
public00 
async00 
Task00 
<00 
ApiResponse00 %
<00% &
LoginResponse00& 3
>003 4
>004 5
GetUserData006 A
(00A B
string00B H
userName00I Q
)00Q R
{11 	
ApiResponse22 
<22 
LoginResponse22 %
>22% &

dbResponse22' 1
=222 3
new224 7
ApiResponse228 C
<22C D
LoginResponse22D Q
>22Q R
(22R S
)22S T
;22T U
DynamicParameters33 

parameters33 (
=33) *
new33+ .
DynamicParameters33/ @
(33@ A
)33A B
;33B C

parameters44 
.44 
Add44 
(44 
$str44 %
,44% &
userName44' /
)44/ 0
;440 1

parameters66 
.66 
Add66 
(66 
$str66 #
,66# $
dbType66% +
:66+ ,
DbType66- 3
.663 4
Int32664 9
,669 :
	direction66; D
:66D E
ParameterDirection66F X
.66X Y
Output66Y _
)66_ `
;66` a

parameters77 
.77 
Add77 
(77 
$str77 $
,77$ %
dbType77& ,
:77, -
DbType77. 4
.774 5
String775 ;
,77; <
	direction77= F
:77F G
ParameterDirection77H Z
.77Z [
Output77[ a
,77a b
size77c g
:77g h
$num77i m
)77m n
;77n o
await88 
WithConnection88  
(88  !
async88! &
conn88' +
=>88, .
{99 
var:: 
query:: 
=:: 
await:: $
conn::% )
.::) *

QueryAsync::* 4
<::4 5
LoginResponse::5 B
>::B C
(::C D
_commandText::D P
.::P Q
GetUserData::Q \
,::\ ]

parameters::^ h
,::h i
commandType::j u
:::u v
CommandType	::w Ç
.
::Ç É
StoredProcedure
::É í
)
::í ì
;
::ì î

dbResponse<< 
.<< 
Code<< "
=<<# $

parameters<<% /
.<</ 0
Get<<0 3
<<<3 4
int<<4 7
><<7 8
(<<8 9
$str<<9 A
)<<A B
;<<B C

dbResponse== 
.== 
Message== %
===& '

parameters==( 2
.==2 3
Get==3 6
<==6 7
string==7 =
>=== >
(==> ?
$str==? H
)==H I
;==I J

dbResponse>> 
.>> 
Data>> "
=>># $
query>>% *
.>>* +
FirstOrDefault>>+ 9
(>>9 :
)>>: ;
;>>; <
}AA 
)AA 
;AA 
returnBB 
awaitBB 
TaskBB 
.BB 

FromResultBB (
<BB( )
ApiResponseBB) 4
<BB4 5
LoginResponseBB5 B
>BBB C
>BBC D
(BBD E

dbResponseBBE O
)BBO P
;BBP Q
}CC 	
}DD 
}EE 