; HHKBと併用すること
#SingleInstance Force

CapsLock::LCtrl

LCtrl::
    KeyWait, LCtrl
    SetCapsLockState, % GetKeyState("CapsLock","T") ? "Off" : "On"
return
