Scriptname PauseWhenCraftingScript extends Quest

Bool bIsGameTimePaused = False ; Used to avoid running sgtm commands when not needed

Event OnInit()
	GoToState("")
	bIsGameTimePaused = False
	RegisterForMenu("Crafting Menu")

	; Menu Registration for SkyrimSouls Unpaused Menus
	RegisterForMenu("ContainerMenu")	
	RegisterForMenu("BarterMenu")
	RegisterForMenu("GiftMenu")
	RegisterForMenu("InventoryMenu")
	RegisterForMenu("MagicMenu")
EndEvent

Function PauseTime()
	If bIsGameTimePaused == False
		ConsoleUtil.ExecuteCommand("sgtm 0")
		bIsGameTimePaused = True
	EndIf
EndFunction

Function UnpauseTime()
	If bIsGameTimePaused == True
		ConsoleUtil.ExecuteCommand("sgtm 1")
		bIsGameTimePaused = False
	EndIf
EndFunction

Function InputModePauseHandler()
EndFunction

Event OnMenuOpen(string menuName)
	GoToState("ListenForInputMode")
	bIsGameTimePaused = False
	RegisterForAllKeys()
	; InputModePauseHandler() ; Start the polling loop
endEvent

Event OnMenuClose(string menuName)
	GoToState("")
	UnpauseTime()
	UnregisterForAllKeys()
endEvent

Event OnKeyDown(Int KeyCode)
EndEvent

Function RegisterForAllKeys()
	; @TODO Figure out how to get the actual keybinding
	RegisterForKey(57) ; Spacebar (SkyUI Default Search Keybinding) ; @TODO Look up the SkyUI setting for this keybinding 
	RegisterForKey(256) ; Left Mouse Button
	RegisterForKey(257) ; Right Mouse Button
	RegisterForKey(258) ; Middle Mouse Button
EndFunction

State ListenForInputMode
	Event OnMenuOpen(string menuName)
	endEvent

	Event OnKeyUp(Int KeyCode, Float HoldTime)
		Utility.WaitMenuMode(0.1)
		Utility.Wait(0.1)
		If UI.IsTextInputEnabled()
			PauseTime()
		Else
			UnpauseTime()
		EndIf
	EndEvent
EndState
