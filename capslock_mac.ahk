#SingleInstance force

SetCapsLockState, AlwaysOff  
SetStoreCapslockMode,Off


if not A_IsAdmin
{
   ; Run *RunAs "%A_ScriptFullPath%"  ; Requires v1.0.92.01+
    Run *RunAs "%A_AhkPath%" "%A_ScriptFullPath%"
   ExitApp
}


$^F2::
	Reload
Return

CapsLock & i::Send, {Home}
CapsLock & `;::Send, {End}
CapsLock & [::Send, {Esc}
CapsLock & c::Send, ^{c}
$^+!]::Send, {Capslock}
CapsLock & w::Send, ^{w}
CapsLock & v::Send, ^{v}
CapsLock & d::Send, ^{d}
CapsLock & u::Send, ^{u}
CapsLock & n::Send, ^{n}
CapsLock & p::Send, ^{p}
CapsLock & o::Send, ^{o}
CapsLock & e::Send, ^{e}
CapsLock & a::Send, ^{a}
CapsLock & y::Send, ^{y}
CapsLock & x::Send, ^{x}
CapsLock & r::Send, ^{r}
CapsLock & f::Send, {PgDn}
CapsLock & b::Send, {PgUp}
CapsLock & z::Send, #{t}
CapsLock & ,::Send ^{PgUp}
CapsLock & .::Send ^{PgDn}
CapsLock & j::Send {Down}
CapsLock & k::Send {Up}
CapsLock & h::Send {LEFT}   ; j SHIFT + LEFT    (Highlight per character)
CapsLock & l::Send {RIGHT}  ; l SHIFT + RIGHT   (Highlight per character)
CapsLock & space::Send #^0
CapsLock & '::Send !{Tab}
; CapsLock & \::Send {|}{|}{LEFT}
CapsLock & \::Send ^{\}
CapsLock & t::Send #!{d}
CapsLock & 1::Send ^#{1}
CapsLock & 2::Send ^#{2}
CapsLock & 3::Send ^#{3}
CapsLock & 4::Send ^#{4}
CapsLock & 5::Send ^#{5}
CapsLock & g::Send ^#{6}
CapsLock & 8::Send #{Left}
CapsLock & 9::Send #{Right}
CapsLock & m::Send ^{m}
CapsLock & 0::Send #+{RIGHT}
CapsLock & Backspace::Send ^{Backspace}
CapsLock & /::Send ^{/}
CapsLock & Enter::Send ^{Enter}
