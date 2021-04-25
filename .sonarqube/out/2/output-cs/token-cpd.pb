˜
`/Users/ratheesh/Documents/Work/Apis/EdBuddyApi/src/edbuddy.api/Controllers/CategoryController.cs
	namespace 	
edbuddy
 
. 
api 
. 
Controllers !
{		 
[

 
Route

 

(


 
$str

 
)

 
]

 
[ 
ApiController 
] 
public 

class 
CategoryController #
:$ %
ControllerBase& 4
{ 
} 
} ÷ 
b/Users/ratheesh/Documents/Work/Apis/EdBuddyApi/src/edbuddy.api/Controllers/ClientAuthController.cs
	namespace 	
edbuddy
 
. 
api 
. 
Controllers !
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class  
ClientAuthController %
:& '
ControllerBase( 6
{ 
private 
readonly 
IConfiguration '
_config( /
;/ 0
private 
readonly  
IAppClientRepository - 
_appClientRepository. B
;B C
public  
ClientAuthController #
(# $
IConfiguration$ 2
config3 9
,9 : 
IAppClientRepository: N
appClientRepositoryO b
)b c
{ 	 
_appClientRepository  
=! "
appClientRepository# 6
;6 7
_config 
= 
config 
; 
} 	
[   	
AllowAnonymous  	 
]   
[!! 	
HttpPost!!	 
]!! 
public"" 
async"" 
Task"" 
<"" 
IActionResult"" '
>""' (
Post"") -
(""- .

ClientAuth"". 8

clientAuth""9 C
)""C D
{## 	
IActionResult$$ 
response$$ "
=$$# $
Unauthorized$$% 1
($$1 2
)$$2 3
;$$3 4
var%% 
validClient%% 
=%%  !
await%%$ ) 
_appClientRepository%%* >
.%%> ?
AuthenitcateClient%%? Q
(%%Q R

clientAuth%%R \
)%%\ ]
;%%] ^
if&& 
(&& 
validClient&& 
.&&  
Code&&  $
==&&% '
$num&&( )
)&&) *
{'' 
	JwtHelper(( 
	jwtHelper(( #
=(($ %
new((& )
	JwtHelper((* 3
(((3 4
_config((4 ;
)((; <
;((< =
var)) 
claims)) 
=)) 
new)) !
[))! "
]))" #
{** 
new++ 
Claim++ 
(++ #
JwtRegisteredClaimNames++ 1
.++1 2
Sub++2 5
,++5 6

clientAuth++7 A
.++A B
	ClientKey++B K
)++K L
,++L M
new,, 
Claim,, 
(,, 
$str,,  
,,,  !
Policies,," *
.,,* +
Client,,+ 1
),,1 2
,,,2 3
new-- 
Claim-- 
(-- 

ClaimTypes-- $
.--$ %
Name--% )
,--) *

clientAuth--+ 5
.--5 6
	ClientKey--6 ?
)--? @
,--@ A
new.. 
Claim.. 
(.. 
$str.. #
,..# $
DateTime..$ ,
..., -
Now..- 0
...0 1
Ticks..1 6
...6 7
ToString..7 ?
(..? @
)..@ A
)..A B
,..B C
new// 
Claim// 
(// 
$str// "
,//" #

clientAuth//# -
.//- .
	IpAddress//. 7
)//7 8
,//8 9
new00 
Claim00 
(00 #
JwtRegisteredClaimNames00 1
.001 2
Jti002 5
,005 6
Guid007 ;
.00; <
NewGuid00< C
(00C D
)00D E
.00E F
ToString00F N
(00N O
)00O P
)00P Q
,00Q R
}11 
;11 
var22 
tokenString22 
=22  !
	jwtHelper22" +
.22+ ,
GenerateJWTToken22, <
(22< =
claims22= C
)22C D
;22D E
response33 
=33 
Ok33 
(33 
new33 !
{44 
token55 
=55 
tokenString55 '
,55' (
}66 
)66 
;66 
}77 
return88 
response88 
;88 
}99 	
};; 
}<< –
_/Users/ratheesh/Documents/Work/Apis/EdBuddyApi/src/edbuddy.api/Controllers/ContestController.cs
	namespace 	
edbuddy
 
. 
api 
. 
Controllers !
{		 
[

 
Route

 

(


 
$str

 
)

 
]

 
[ 
ApiController 
] 
public 

class 
ContestController "
:# $
ControllerBase% 3
{ 
} 
} –
_/Users/ratheesh/Documents/Work/Apis/EdBuddyApi/src/edbuddy.api/Controllers/CoursesController.cs
	namespace 	
edbuddy
 
. 
api 
. 
Controllers !
{		 
[

 
Route

 

(


 
$str

 
)

 
]

 
[ 
ApiController 
] 
public 

class 
CoursesController "
:# $
ControllerBase% 3
{ 
} 
} 
\/Users/ratheesh/Documents/Work/Apis/EdBuddyApi/src/edbuddy.api/Controllers/KidsController.cs
	namespace 	
edbuddy
 
. 
api 
. 
Controllers !
{		 
[

 
Route

 

(


 
$str

 
)

 
]

 
[ 
ApiController 
] 
public 

class 
KidsController 
:  !
ControllerBase" 0
{ 
} 
} ›G
^/Users/ratheesh/Documents/Work/Apis/EdBuddyApi/src/edbuddy.api/Controllers/ParentController.cs
	namespace 	
edbuddy
 
. 
api 
. 
Controllers !
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class 
ParentController !
:" #
ControllerBase$ 2
{ 
private 
readonly 
IConfiguration '
_config( /
;/ 0
private 
readonly  
IHttpContextAccessor -
_http. 3
;3 4
private 
readonly 
IUserRepository (
_userRepository) 8
;8 9
private 
	JwtHelper 
	jwtHelper #
;# $
public 
ParentController 
(  
IConfiguration  .
config/ 5
,5 6 
IHttpContextAccessor7 K
httpL P
,P Q
IUserRepositoryR a
userRepositoryb p
)p q
{ 	
_config   
=   
config   
;   
_http!! 
=!! 
http!! 
;!! 
_userRepository"" 
="" 
userRepository"" ,
;"", -
	jwtHelper## 
=## 
new## 
	JwtHelper## %
(##% &
_config##& -
)##- .
;##. /
}$$ 	
[%% 	
	Authorize%%	 
(%% 
Policy%% 
=%% 
Policies%% $
.%%$ %
User%%% )
)%%) *
]%%* +
[&& 	
HttpGet&&	 
]&& 
public'' 
async'' 
Task'' 
<'' 
IActionResult'' '
>''' (
Get'') ,
('', -
)''- .
{(( 	
IActionResult)) 
response)) "
=))# $
Unauthorized))% 1
())1 2
)))2 3
;))3 4
var** 
identity** 
=** 
HttpContext** &
.**& '
User**' +
.**+ ,
Identity**, 4
as**5 7
ClaimsIdentity**8 F
;**F G
var++ 
user++ 
=++ 
await++ 
_userRepository++ ,
.++, -
GetUserData++- 8
(++8 9
identity++9 A
.++A B
	FindFirst++B K
(++K L

ClaimTypes++L V
.++V W
NameIdentifier++W e
)++e f
.++f g
Value++g l
)++l m
;++m n
if,, 
(,, 
user,, 
.,, 
Code,, 
==,, 
$num,, 
),, 
{-- 
if.. 
(.. 
user.. 
... 
Data.. 
!=.. 
null.. "
).." #
response// 
=// 
Ok// !
(//! "
new//" %
{//& '
user//( ,
=//- .
user/// 3
.//3 4
Data//4 8
}//9 :
)//: ;
;//; <
}00 
return11 
response11 
;11 
}22 	
[33 	
HttpPost33	 
(33 
$str33 
)33 
]33 
[44 	
	Authorize44	 
(44 
Policy44 
=44 
Policies44 $
.44$ %
Client44% +
)44+ ,
]44, -
public55 
async55 
Task55 
<55 
IActionResult55 '
>55' (
Post55) -
(55- .
[55. /
FromBody55/ 7
]557 8
	UserLogin559 B
login55C H
)55H I
{66 	
IActionResult77 
response77 "
=77# $
Unauthorized77% 1
(771 2
)772 3
;773 4
var88 
user88 
=88 
await88 
_userRepository88 ,
.88, -
AuthenitcateUser88- =
(88= >
login88> C
)88C D
;88D E
if99 
(99 
user99 
.99 
Code99 
==99 
$num99 
)99 
{:: 
if;; 
(;; 
user;; 
.;; 
Data;; 
!=;;  
null;;! %
);;% &
{<< 
	JwtHelper== 
	jwtHelper== '
===( )
new==* -
	JwtHelper==. 7
(==7 8
_config==8 ?
)==? @
;==@ A
var>> 
claims>> 
=>>  
new>>! $
[>>$ %
]>>% &
{?? 
new@@ 
Claim@@ !
(@@! "#
JwtRegisteredClaimNames@@" 9
.@@9 :
Sub@@: =
,@@= >
login@@? D
.@@D E
Username@@E M
)@@M N
,@@N O
newAA 
ClaimAA !
(AA! "
$strAA" (
,AA( )
PoliciesAA* 2
.AA2 3
UserAA3 7
)AA7 8
,AA8 9
newBB 
ClaimBB !
(BB! "
$strBB" ,
,BB, -
loginBB. 3
.BB3 4
UsernameBB4 <
)BB< =
,BB= >
newCC 
ClaimCC !
(CC! "
$strCC" +
,CC+ ,
DateTimeCC, 4
.CC4 5
NowCC5 8
.CC8 9
TicksCC9 >
.CC> ?
ToStringCC? G
(CCG H
)CCH I
)CCI J
,CCJ K
newDD 
ClaimDD !
(DD! "
$strDD" *
,DD* +
loginDD+ 0
.DD0 1
	IpAddressDD1 :
)DD: ;
,DD; <
newEE 
ClaimEE !
(EE! "#
JwtRegisteredClaimNamesEE" 9
.EE9 :
JtiEE: =
,EE= >
GuidEE? C
.EEC D
NewGuidEED K
(EEK L
)EEL M
.EEM N
ToStringEEN V
(EEV W
)EEW X
)EEX Y
,EEY Z
}FF 
;FF 
varHH 
tokenStringHH #
=HH$ %
	jwtHelperHH& /
.HH/ 0
GenerateJWTTokenHH0 @
(HH@ A
claimsHHA G
)HHG H
;HHH I
responseII 
=II 
OkII !
(II! "
newII" %
{JJ 
CodeKK 
=KK 
userKK !
.KK! "
CodeKK" &
,KK& '
MessageLL 
=LL  
userLL  $
.LL$ %
MessageLL% ,
,LL, -
DataMM 
=MM 
userMM #
.MM# $
DataMM$ (
,MM( )
TokenNN 
=NN 
tokenStringNN )
}OO 
)OO 
;OO 
}PP 
}RR 
returnSS 
responseSS 
;SS 
}TT 
[UU 	
HttpPostUU	 
(UU 
$strUU 
)UU 
]UU 
publicVV 
IActionResultVV 
RefreshVV $
(VV$ %
stringVV% +
tokenVV, 1
,VV1 2
stringVV3 9
refreshTokenVV: F
)VVF G
{WW 	
varXX 
	principalXX 
=XX 
	jwtHelperXX %
.XX% &(
GetPrincipalFromExpiredTokenXX& B
(XXB C
tokenXXC H
)XXH I
;XXI J
varYY 
usernameYY 
=YY 
	principalYY $
.YY$ %
IdentityYY% -
.YY- .
NameYY. 2
;YY2 3
varZZ 
savedRefreshTokenZZ !
=ZZ" #
	jwtHelperZZ$ -
.ZZ- . 
GenerateRefreshTokenZZ. B
(ZZB C
)ZZC D
;ZZD E
if[[ 
([[ 
savedRefreshToken[[ !
!=[[" $
refreshToken[[% 1
)[[1 2
throw\\ 
new\\ "
SecurityTokenException\\ 0
(\\0 1
$str\\1 H
)\\H I
;\\I J
var^^ 
newJwtToken^^ 
=^^ 
	jwtHelper^^ '
.^^' (
GenerateJWTToken^^( 8
(^^8 9
	principal^^9 B
.^^B C
Claims^^C I
)^^I J
;^^J K
var__ 
newRefreshToken__ 
=__  !
	jwtHelper__" +
.__+ , 
GenerateRefreshToken__, @
(__@ A
)__A B
;__B C
	jwtHelperaa 
.aa 
DeleteRefreshTokenaa (
(aa( )
usernameaa) 1
,aa1 2
refreshTokenaa3 ?
)aa? @
;aa@ A
	jwtHelperbb 
.bb 
SaveRefreshTokenbb &
(bb& '
usernamebb' /
,bb/ 0
newRefreshTokenbb1 @
)bb@ A
;bbA B
returndd 
newdd 
ObjectResultdd #
(dd# $
newdd$ '
{ee 
tokenff 
=ff 
newJwtTokenff #
,ff# $
refreshTokengg 
=gg 
newRefreshTokengg .
}hh 
)hh 
;hh 
}ii 	
}ll 
}mm ä
\/Users/ratheesh/Documents/Work/Apis/EdBuddyApi/src/edbuddy.api/Controllers/UserController.cs
	namespace

 	
edbuddy


 
.

 
api

 
.

 
Controllers

 !
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class 
UserController 
:  !
ControllerBase" 0
{ 
[ 	
HttpGet	 
] 
[ 	
Route	 
( 
$str 
) 
] 
[ 	
	Authorize	 
( 
Policy 
= 
Policies $
.$ %
User% )
)) *
]* +
public 
IActionResult 
GetUserData (
(( )
)) *
{ 	
return 
Ok 
( 
$str ;
); <
;< =
} 	
[ 	
HttpGet	 
] 
[ 	
Route	 
( 
$str 
) 
]  
[ 	
	Authorize	 
( 
Policy 
= 
Policies $
.$ %
Client% +
)+ ,
], -
public 
IActionResult 
GetClientData *
(* +
)+ ,
{ 	
return 
Ok 
( 
$str =
)= >
;> ?
} 	
} 
} €
g/Users/ratheesh/Documents/Work/Apis/EdBuddyApi/src/edbuddy.api/Controllers/WeatherForecastController.cs
	namespace 	
edbuddy
 
. 
api 
. 
Controllers !
{ 
[ 
ApiController 
] 
[ 
Route 

(
 
$str 
) 
] 
public 

class %
WeatherForecastController *
:+ ,
ControllerBase- ;
{ 
private 
static 
readonly 
string  &
[& '
]' (
	Summaries) 2
=3 4
new5 8
[8 9
]9 :
{ 	
$str 
, 
$str !
,! "
$str# +
,+ ,
$str- 3
,3 4
$str5 ;
,; <
$str= C
,C D
$strE L
,L M
$strN S
,S T
$strU a
,a b
$strc n
} 	
;	 

public %
WeatherForecastController (
(( )
)) *
{* +
}, -
public 
IActionResult 
Get  
(  !
)! "
{ 	
var 
rng 
= 
new 
Random  
(  !
)! "
;" #
return 
Ok 
( 

Enumerable 
. 
Range  
(  !
$num! "
," #
$num$ %
)% &
.& '
Select' -
(- .
index. 3
=>4 6
new7 :
WeatherForecast; J
{   
Date!! 
=!! 
DateTime!! 
.!!  
Now!!  #
.!!# $
AddDays!!$ +
(!!+ ,
index!!, 1
)!!1 2
,!!2 3
TemperatureC"" 
="" 
rng"" "
.""" #
Next""# '
(""' (
-""( )
$num"") +
,""+ ,
$num""- /
)""/ 0
,""0 1
Summary## 
=## 
	Summaries## #
[### $
rng##$ '
.##' (
Next##( ,
(##, -
	Summaries##- 6
.##6 7
Length##7 =
)##= >
]##> ?
}$$ 
)$$ 
.%% 
ToArray%% 
(%% 
)%% 
)%% 
;%% 
}&& 	
}(( 
})) ¨9
S/Users/ratheesh/Documents/Work/Apis/EdBuddyApi/src/edbuddy.api/Helpers/JwtHelper.cs
	namespace 	
edbuddy
 
. 
api 
. 
Helpers 
{ 
public 

class 
	JwtHelper 
{ 
private 
readonly 
IConfiguration '
_config( /
;/ 0
public 
	JwtHelper 
( 
IConfiguration '
config( .
). /
{ 	
_config 
= 
config 
; 
} 	
internal 
string 
GenerateJWTToken (
(( )
IEnumerable) 4
<4 5
Claim5 :
>: ;
claims< B
)B C
{ 	
var 
	jwtConfig 
= 
_config #
.# $

GetSection$ .
(. /
$str/ 4
)4 5
;5 6
var 
securityKey 
= 
new ! 
SymmetricSecurityKey" 6
(6 7
Encoding7 ?
.? @
UTF8@ D
.D E
GetBytesE M
(M N
	jwtConfigN W
[W X
$strX c
]c d
)d e
)e f
;f g
var 
credentials 
= 
new !
SigningCredentials" 4
(4 5
securityKey5 @
,@ A
SecurityAlgorithmsB T
.T U

HmacSha256U _
)_ `
;` a
var 
jwt 
= 
new 
JwtSecurityToken *
(* +
issuer 
: 
	jwtConfig !
[! "
$str" *
]* +
,+ ,
audience 
: 
	jwtConfig #
[# $
$str$ .
]. /
,/ 0
claims 
: 
claims 
, 
	notBefore   
:   
DateTime   #
.  # $
UtcNow  $ *
,  * +
expires!! 
:!! 
DateTime!! !
.!!! "
UtcNow!!" (
.!!( )

AddMinutes!!) 3
(!!3 4
$num!!4 5
)!!5 6
,!!6 7
signingCredentials"" "
:""" #
credentials""$ /
)## 
;## 
return%% 
new%% #
JwtSecurityTokenHandler%% .
(%%. /
)%%/ 0
.%%0 1

WriteToken%%1 ;
(%%; <
jwt%%< ?
)%%? @
;%%@ A
}&& 	
internal'' 
string''  
GenerateRefreshToken'' ,
('', -
)''- .
{(( 	
var)) 
randomNumber)) 
=)) 
new)) "
byte))# '
[))' (
$num))( *
]))* +
;))+ ,
using** 
(** 
var** 
rng** 
=** !
RandomNumberGenerator** 2
.**2 3
Create**3 9
(**9 :
)**: ;
)**; <
{++ 
rng,, 
.,, 
GetBytes,, 
(,, 
randomNumber,, )
),,) *
;,,* +
return-- 
Convert-- 
.-- 
ToBase64String-- -
(--- .
randomNumber--. :
)--: ;
;--; <
}.. 
}// 	
internal00 
ClaimsPrincipal00  (
GetPrincipalFromExpiredToken00! =
(00= >
string00> D
token00E J
)00J K
{11 	
var22 
	jwtConfig22 
=22 
_config22 #
.22# $

GetSection22$ .
(22. /
$str22/ 4
)224 5
;225 6
var33 
securityKey33 
=33 
new33 ! 
SymmetricSecurityKey33" 6
(336 7
Encoding337 ?
.33? @
UTF833@ D
.33D E
GetBytes33E M
(33M N
	jwtConfig33N W
[33W X
$str33X c
]33c d
)33d e
)33e f
;33f g
var44 
credentials44 
=44 
new44 !
SigningCredentials44" 4
(444 5
securityKey445 @
,44@ A
SecurityAlgorithms44B T
.44T U

HmacSha25644U _
)44_ `
;44` a
var66 %
tokenValidationParameters66 )
=66* +
new66, /%
TokenValidationParameters660 I
{77 
ValidateAudience88  
=88! "
true88# '
,88' (
ValidateIssuer99 
=99  
true99! %
,99% &
ValidIssuer:: 
=:: 
	jwtConfig::  )
[::) *
$str::* 2
]::2 3
,::3 4
ValidAudience;; 
=;; 
	jwtConfig;;  )
[;;) *
$str;;* 4
];;4 5
,;;5 6$
ValidateIssuerSigningKey<< (
=<<) *
true<<+ /
,<</ 0
IssuerSigningKey==  
===! "
new==# & 
SymmetricSecurityKey==' ;
(==; <
Encoding==< D
.==D E
UTF8==E I
.==I J
GetBytes==J R
(==R S
	jwtConfig==S \
[==\ ]
$str==] h
]==h i
)==i j
)==j k
,==k l
ValidateLifetime>>  
=>>! "
true>># '
}?? 
;?? 
varAA 
tokenHandlerAA 
=AA 
newAA "#
JwtSecurityTokenHandlerAA# :
(AA: ;
)AA; <
;AA< =
SecurityTokenBB 
securityTokenBB '
;BB' (
varCC 
	principalCC 
=CC 
tokenHandlerCC (
.CC( )
ValidateTokenCC) 6
(CC6 7
tokenCC7 <
,CC< =%
tokenValidationParametersCC> W
,CCW X
outCCY \
securityTokenCC] j
)CCj k
;CCk l
varDD 
jwtSecurityTokenDD  
=DD! "
securityTokenDD# 0
asDD1 3
JwtSecurityTokenDD4 D
;DDD E
ifEE 
(EE 
jwtSecurityTokenEE  
==EE! #
nullEE$ (
||EE) +
!EE, -
jwtSecurityTokenEE- =
.EE= >
HeaderEE> D
.EED E
AlgEEE H
.EEH I
EqualsEEI O
(EEO P
SecurityAlgorithmsEEP b
.EEb c

HmacSha256EEc m
,EEm n
StringComparisonEEo 
.	EE €(
InvariantCultureIgnoreCase
EE€ š
)
EEš ›
)
EE› œ
throwFF 
newFF "
SecurityTokenExceptionFF 0
(FF0 1
$strFF1 @
)FF@ A
;FFA B
returnHH 
	principalHH 
;HH 
}II 	
internalJJ 
voidJJ 
DeleteRefreshTokenJJ (
(JJ( )
stringJJ) /
usernameJJ0 8
,JJ8 9
stringJJ9 ?
tokenJJ@ E
)JJE F
{JJF G
}LL 	
internalMM 
voidMM 
SaveRefreshTokenMM &
(MM& '
stringMM' -
usernameMM. 6
,MM6 7
stringMM7 =
tokenMM> C
)MMC D
{MMD E
}OO 	
}PP 
}QQ ô
^/Users/ratheesh/Documents/Work/Apis/EdBuddyApi/src/edbuddy.api/Models/ConnectionStringModel.cs
	namespace 	
edbuddy
 
. 
api 
. 
Models 
{ 
public 

class !
ConnectionStringModel &
{		 
public

 
string

 
EdBuddyConnection

 '
{

( )
get

* -
;

- .
set

/ 2
;

2 3
}

4 5
} 
} ¹
Q/Users/ratheesh/Documents/Work/Apis/EdBuddyApi/src/edbuddy.api/Models/Policies.cs
	namespace 	
edbuddy
 
. 
api 
. 
Models 
{ 
public		 

class		 
Policies		 
{

 
public 
const 
string 
Client "
=# $
$str% -
;- .
public 
const 
string 
User  
=! "
$str# )
;) *
public 

static 
AuthorizationPolicy %
ClientPolicy& 2
(2 3
)3 4
{ 	
return 
new &
AuthorizationPolicyBuilder 1
(1 2
)2 3
.3 4$
RequireAuthenticatedUser4 L
(L M
)M N
.N O
RequireRoleO Z
(Z [
Client[ a
)a b
.b c
Buildc h
(h i
)i j
;j k
} 	
public 
static 
AuthorizationPolicy )

UserPolicy* 4
(4 5
)5 6
{ 	
return 
new &
AuthorizationPolicyBuilder 1
(1 2
)2 3
.3 4$
RequireAuthenticatedUser4 L
(L M
)M N
.N O
RequireRoleO Z
(Z [
User[ _
)_ `
.` a
Builda f
(f g
)g h
;h i
} 	
} 
} ë
O/Users/ratheesh/Documents/Work/Apis/EdBuddyApi/src/edbuddy.api/Models/tokens.cs
public 
class 
RefreshRequest 
{ 
public 

string 
AccessToken 
{ 
get  #
;# $
set% (
;( )
}* +
public 

string 
RefreshToken 
{  
get! $
;$ %
set& )
;) *
}+ ,
} ž
M/Users/ratheesh/Documents/Work/Apis/EdBuddyApi/src/edbuddy.api/Models/User.cs
	namespace 	
edbuddy
 
. 
api 
. 
Models 
{ 
public 

class 
User 
{		 
public

 
string

 
UserName

 
{

  
get

! $
;

$ %
set

& )
;

) *
}

+ ,
public 
string 
Password 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
UserRole 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
	IpAddress 
{  !
get" %
;% &
set' *
;* +
}, -
} 
} ¾

I/Users/ratheesh/Documents/Work/Apis/EdBuddyApi/src/edbuddy.api/Program.cs
	namespace

 	
edbuddy


 
.

 
api

 
{ 
public 

class 
Program 
{ 
public 
static 
void 
Main 
(  
string  &
[& '
]' (
args) -
)- .
{ 	
CreateHostBuilder 
( 
args "
)" #
.# $
Build$ )
() *
)* +
.+ ,
Run, /
(/ 0
)0 1
;1 2
} 	
public 
static 
IHostBuilder "
CreateHostBuilder# 4
(4 5
string5 ;
[; <
]< =
args> B
)B C
=>D F
Host 
.  
CreateDefaultBuilder %
(% &
args& *
)* +
. $
ConfigureWebHostDefaults )
() *

webBuilder* 4
=>5 7
{ 

webBuilder 
. 

UseStartup )
<) *
Startup* 1
>1 2
(2 3
)3 4
;4 5
} 
) 
; 
} 
} ô;
I/Users/ratheesh/Documents/Work/Apis/EdBuddyApi/src/edbuddy.api/Startup.cs
	namespace 	
edbuddy
 
. 
api 
{ 
public 

class 
Startup 
{ 
public 
Startup 
( 
IConfiguration %
configuration& 3
)3 4
{ 	
Configuration 
= 
configuration )
;) *
} 	
public!! 
IConfiguration!! 
Configuration!! +
{!!, -
get!!. 1
;!!1 2
}!!3 4
public$$ 
void$$ 
ConfigureServices$$ %
($$% &
IServiceCollection$$& 8
services$$9 A
)$$A B
{%% 	
services&& 
.&& 
AddTransient&& !
<&&! "
ICommandText&&" .
,&&. /
CommandText&&0 ;
>&&; <
(&&< =
)&&= >
;&&> ?
services'' 
.'' 
AddTransient'' !
<''! " 
IAppClientRepository''" 6
,''6 7
AppClientRepository''8 K
>''K L
(''L M
)''M N
;''N O
services(( 
.(( 
AddTransient(( !
<((! "
IUserRepository((" 1
,((1 2
UserRepository((3 A
>((A B
(((B C
)((C D
;((D E
services)) 
.)) 
AddTransient)) !
<))! " 
IHttpContextAccessor))" 6
,))6 7
HttpContextAccessor))8 K
>))K L
())L M
)))M N
;))N O
var++ 
	jwtConfig++ 
=++ 
Configuration++ )
.++) *

GetSection++* 4
(++4 5
$str++5 :
)++: ;
;++; <
services,, 
.,, 
AddControllers,, #
(,,# $
),,$ %
;,,% &
services.. 
... 
AddAuthentication.. &
(..& '
JwtBearerDefaults..' 8
...8 9 
AuthenticationScheme..9 M
)..M N
.// 
AddJwtBearer// 
(// 
options// !
=>//" $
{00 
options11 
.11  
RequireHttpsMetadata11 ,
=11- .
false11/ 4
;114 5
options22 
.22 
	SaveToken22 !
=22" #
true22$ (
;22( )
options33 
.33 %
TokenValidationParameters33 -
=33. /
new330 3%
TokenValidationParameters334 M
{44 
ValidateIssuer55 
=55  
true55! %
,55% &
ValidateAudience66  
=66! "
true66# '
,66' (
ValidateLifetime77  
=77! "
true77# '
,77' ($
ValidateIssuerSigningKey88 (
=88) *
true88+ /
,88/ 0
ValidIssuer99 
=99 
	jwtConfig99 '
[99' (
$str99( 0
]990 1
,991 2
ValidAudience:: 
=:: 
	jwtConfig::  )
[::) *
$str::* 4
]::4 5
,::5 6
IssuerSigningKey;;  
=;;! "
new;;# & 
SymmetricSecurityKey;;' ;
(;;; <
Encoding;;< D
.;;D E
UTF8;;E I
.;;I J
GetBytes;;J R
(;;R S
	jwtConfig;;S \
[;;\ ]
$str;;] h
];;h i
);;i j
);;j k
,;;k l
	ClockSkew<< 
=<< 
TimeSpan<< $
.<<$ %
Zero<<% )
}== 
;== 
}>> 
)>> 
;>> 
services?? 
.?? 
	Configure?? 
<?? !
ConnectionStringModel?? 4
>??4 5
(??5 6
Configuration??6 C
.??C D

GetSection??D N
(??N O
$str??O b
)??b c
)??c d
;??d e
services@@ 
.@@ 
AddApiVersioning@@ %
(@@% &
o@@& '
=>@@( *
{AA 
oBB 
.BB 
ReportApiVersionsBB #
=BB$ %
trueBB& *
;BB* +
oCC 
.CC /
#AssumeDefaultVersionWhenUnspecifiedCC 5
=CC6 7
trueCC8 <
;CC< =
oDD 
.DD 
DefaultApiVersionDD #
=DD$ %
newDD& )

ApiVersionDD* 4
(DD4 5
$numDD5 6
,DD6 7
$numDD8 9
)DD9 :
;DD: ;
oEE 
.EE 
ApiVersionReaderEE "
=EE# $
newEE% ("
HeaderApiVersionReaderEE) ?
(EE? @
$strEE@ O
)EEO P
;EEP Q
}FF 
)FF 
;FF 
servicesGG 
.GG 
AddSwaggerGenGG "
(GG" #
cGG# $
=>GG% '
{HH 
cII 
.II 

SwaggerDocII 
(II 
$strII !
,II! "
newII# &
OpenApiInfoII' 2
{II3 4
TitleII5 :
=II; <
$strII= N
,IIN O
VersionIIP W
=IIX Y
$strIIZ ^
}II_ `
)II` a
;IIa b
}JJ 
)JJ 
;JJ 
servicesLL 
.LL 
AddAuthorizationLL %
(LL% &
configLL& ,
=>LL- /
{MM 
configNN 
.NN 
	AddPolicyNN  
(NN  !
PoliciesNN! )
.NN) *
ClientNN* 0
,NN0 1
PoliciesNN2 :
.NN: ;
ClientPolicyNN; G
(NNG H
)NNH I
)NNI J
;NNJ K
configOO 
.OO 
	AddPolicyOO  
(OO  !
PoliciesOO! )
.OO) *
UserOO* .
,OO. /
PoliciesOO0 8
.OO8 9

UserPolicyOO9 C
(OOC D
)OOD E
)OOE F
;OOF G
}PP 
)PP 
;PP 
}RR 	
publicUU 
voidUU 
	ConfigureUU 
(UU 
IApplicationBuilderUU 1
appUU2 5
,UU5 6
IWebHostEnvironmentUU7 J
envUUK N
)UUN O
{VV 	
ifWW 
(WW 
envWW 
.WW 
IsDevelopmentWW !
(WW! "
)WW" #
)WW# $
{XX 
appYY 
.YY %
UseDeveloperExceptionPageYY -
(YY- .
)YY. /
;YY/ 0
}ZZ 
app\\ 
.\\ 
UseHttpsRedirection\\ #
(\\# $
)\\$ %
;\\% &
app^^ 
.^^ 

UseRouting^^ 
(^^ 
)^^ 
;^^ 
app__ 
.__ 
UseAuthentication__ !
(__! "
)__" #
;__# $
app`` 
.`` 
UseAuthorization``  
(``  !
)``! "
;``" #
appbb 
.bb 
UseEndpointsbb 
(bb 
	endpointsbb &
=>bb' )
{cc 
	endpointsdd 
.dd 
MapControllersdd (
(dd( )
)dd) *
;dd* +
}ee 
)ee 
;ee 
appff 
.ff 

UseSwaggerff 
(ff 
)ff 
;ff 
appgg 
.gg 
UseSwaggerUIgg 
(gg 
cgg 
=>gg !
{hh 
cii 
.ii 
SwaggerEndpointii !
(ii! "
$strii" <
,ii< =
$strii> N
)iiN O
;iiO P
}jj 
)jj 
;jj 
}kk 	
}ll 
}mm ò
Q/Users/ratheesh/Documents/Work/Apis/EdBuddyApi/src/edbuddy.api/WeatherForecast.cs
	namespace 	
edbuddy
 
. 
api 
{ 
public 

class 
WeatherForecast  
{ 
public 
DateTime 
Date 
{ 
get "
;" #
set$ '
;' (
}) *
public		 
int		 
TemperatureC		 
{		  !
get		" %
;		% &
set		' *
;		* +
}		, -
public 
int 
TemperatureF 
=>  "
$num# %
+& '
(( )
int) ,
), -
(- .
TemperatureC. :
/; <
$num= C
)C D
;D E
public 
string 
Summary 
{ 
get  #
;# $
set% (
;( )
}* +
} 
} 