; Altキー単独をリマップするとすごい勢いで他に影響するので、
; Altキーの同時押しにより無変換キーと変換キーへのリマップを実現させる

#InstallKeybdHook

; Shift + 右AltUP → 無変換
Shift & RAlt up::SendInput, {vk1Csc079}
  Return

; Shift + 左AltUP → 変換
Shift & LAlt up::SendInput, {vk1Dsc07B}
  Return
