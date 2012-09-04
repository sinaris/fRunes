---------------------------------------------------------------------------------------------
-- AddOn Name: fRunes
-- License: MIT
-- Author: Sinaris @ Das Syndikat, Vaecia @ Blackmoore
-- Credits: All credits goes to the original Author: Foof
-- Description: Very low-weight rune tracker for Tukui.
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

if( S.myclass ~= "DEATHKNIGHT" ) then return end

fRunesSettings = {
	texture = C["media"]["normTex"],
	barLength = 40,
	barThickness = 14,
	rpBarThickness = 10,
	anchor = UIParent,
	hideOOC = true,
	x = 0,
	y = 170,
	growthDirection = "HORIZONTAL", -- HORIZONTAL or VERTICAL

	displayRpBar = true, -- runic power bar below the runes
	displayRpBarText = true, -- runic power text on the runic power bar

	runestrike = true, -- shows a rune strike icon whenever it's usable

	colors = {
		{ 0.69, 0.31, 0.31 }, -- blood
		{ 0.33, 0.59, 0.33 }, -- unholy
		{ 0.31, 0.45, 0.63 }, -- frost
		{ 0.84, 0.75, 0.65 }, -- death
		{ 0, 0.82, 1 }, -- runic power
	},
	
	--[[
		runemap instructions.
		This is the order you want your runes to be displayed in (down to bottom or left to right).
		1,2 = Blood
		3,4 = Unholy
		5,6 = Frost
		(Note: All numbers must be included or it will break)
	]]
	runemap = { 1, 2, 3, 4, 5, 6 },
}

local fRunesOnLogon = CreateFrame( "Frame" )
fRunesOnLogon:RegisterEvent( "PLAYER_ENTERING_WORLD" )
fRunesOnLogon:SetScript( "OnEvent", function( self, event )
	self:UnregisterEvent( "PLAYER_ENTERING_WORLD" )

	print( "|cff00AAFFfRunes " .. GetAddOnMetadata( "fRunes", "Version" ) .. "|r loaded" )
end )