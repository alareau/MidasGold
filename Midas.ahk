#Requires AutoHotkey v2.0
#SingleInstance

; #Persistent
; SetTimer, PressTheKey, 70000 ; repeats every 70 sec (70.000ms)
; Return

GameName := "Midas Gold Plus"
^1::
{
    if WinExist(GameName)
    {
        Loop
        {
            ; Make sure your purchasing is set to Max
            ; make sure the autoclicker artifact is setup already
            sleep 10 

            UseSpells()
            AutoclickRock()
            BuyBuildings()
            BuyUpgrades()
        }
    }        
    Else
    {
        MsgBox "Midas not open"
    }
}   

Esc::ExitApp  ; Exit script with Escape key

AutoclickRock(loopTimes := 400)
{
    Loop loopTimes
    {
        MouseClick "left", 807, 710
        sleep 50
    }
}

UseSpells()
{
    ;spells will take about 10 seconds
    Send "{1}" ; Spell 1
    sleep 10 ; 
    Send "{3}" ; Spell 3
    sleep 10   
}

BuyBuildings()
{
    sleep 10 
    MouseClick "left", 1041, 532 ; buy Merchant
    sleep 10 
    MouseClick "left", 704, 532 ; Buy template (in case Merchant purchase was not possible)    
    sleep 10 
    MouseClick "left", 409, 532 ; Buy Shrine (in case Merchant purchase was not possible)    
}

BuyUpgrades()
{
    sleep 10 
    MouseClick "left", 35, 428 ; Press upgrade button
    sleep 10 
    MouseClick "left", 198, 884 ; Buy Max
}

; PressTheKey: ; subroutine
; prev:=WinActive("A") ; if you have another program active, i remember it
; MouseGetPos x, y ; also the mouse position
; Sleep, 10 ; just a small pause for convenience (10ms)
; if WinExist("Midas Gold Plus") ; let's check if Midas is running
; WinActivate ; Use the window found by WinExist.
; Sleep, 10 ; small pause to circumvent the windelay (10ms)
; MouseClick, left, 930, 570 ; click on War Outpost (button says Midaeum)
; MouseClick, left, 240, 500 ; click on War Preparations
; MouseClick, left, 1005, 122 ; click on X to close War Outpost
; ;important: the lines from IF to this point needs an indentation!!!
; Sleep, 10 ; small pause to circumvent the windelay (10ms)
; Send, 9 ; Powder of Lemuria
; Send, 8 ; Artifact of Atlantis
; Send, 7 ; Knowledge Burst of Babylonia
; Send, 6 ; Mysterious Leaf of El Dorado
; Send, 5 ; Winds of Valhalla
; Sleep, 10 ; just a small pause for convenience (10ms)
; if prev ; if you had another program active
; WinActivate, ahk_id %prev% ; activate that other window
; MouseMove %x%, %y% ; return mouse to original position
; ;important: the lines from IF to this point needs an indentation!!!
; Return ; return to Timer 