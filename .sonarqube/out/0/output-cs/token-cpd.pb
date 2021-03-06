?	
X/Users/ratheesh/Documents/Work/Apis/EdBuddyApi/src/edbuddy.common/entities/ClientAuth.cs
	namespace 	
edbuddy
 
. 
common 
. 
entities !
{ 
public 

class 

ClientAuth 
{ 
public		 
string		 
	ClientKey		 
{		  !
get		" %
;		% &
set		' *
;		* +
}		, -
public

 
string

 
ClientSecret

 "
{

# $
get

% (
;

( )
set

* -
;

- .
}

/ 0
public 
string 
	IpAddress 
{  !
get" %
;% &
set' *
;* +
}, -
} 
public 

class 
ClientAuthResponse #
{# $
public 
int 
AppID 
{ 
get 
; 
set !
;! "
}" #
public 
string 
AppName 
{ 
get "
;" #
set# &
;& '
}' (
} 
} ?

W/Users/ratheesh/Documents/Work/Apis/EdBuddyApi/src/edbuddy.common/entities/Responses.cs
	namespace 	
edbuddy
 
. 
common 
. 
entities !
{ 
[ 
DataContract 
] 
public 

class 
ApiResponse 
< 
T 
> 
{ 
[

 

DataMember

 
(

 
Name

 
=

 
$str

 (
)

( )
]

) *
public 
string 
Message !
{" #
get$ '
;' (
set) ,
;, -
}. /
[ 

DataMember 
( 
Name 
= 
$str %
)% &
]& '
public 
int 
Code 
{ 
get !
;! "
set# &
;& '
}( )
[ 

DataMember 
( 
Name 
= 
$str %
)% &
]& '
public 
T 
Data 
{ 
get 
;  
set! $
;$ %
}& '
} 
} ?
R/Users/ratheesh/Documents/Work/Apis/EdBuddyApi/src/edbuddy.common/entities/User.cs
	namespace 	
edbuddy
 
. 
common 
. 
entities !
{ 
public 

class 
	UserLogin 
{ 
public		 
string		 
Username		 
{		  
get		! $
;		$ %
set		& )
;		) *
}		+ ,
public

 
string

 
Password
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
string 
	IpAddress 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 
DeviceId 
{  
get! $
;$ %
set& )
;) *
}+ ,
} 
public 

class 
LoginResponse 
{ 
public 
int 
ParentId 
{ 
get  
;  !
set! $
;$ %
}% &
public 
string 
Username 
{  
get  #
;# $
set$ '
;' (
}( )
public 
string 
Status 
{ 
get !
;! "
set" %
;% &
}& '
public 
string 
Token 
{ 
get 
;  
set  #
;# $
}$ %
public 
string 
Expiry 
{ 
get  
;  !
set! $
;$ %
}% &
} 
} 