---------------------------------------------------------------------------------------------
-- AddOn Name: fRunes
-- License: MIT
-- Author: Sinaris @ Das Syndikat, Vaecia @ Blackmoore
-- Credits: All credits goes to the original Author: Foof
-- Description: Very low-weight rune tracker for Tukui.
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

if( S.myclass ~= "DEATHKNIGHT" or fRunesSettings.runestrike ~= true ) then return end

local name, _, icon = GetSpellInfo( 56815 )

local frame = CreateFrame( "Frame", nil, UIParent )
frame:Size( 50 )
frame:SetPoint( "BOTTOM", _G["fRunes"], "TOP", 0, 10 )
frame:SetTemplate( "Default" )
frame:SetAlpha( 1 )

frame.icon = frame:CreateTexture( nil, "OVERLAY" )
frame.icon:SetTexture( icon )
frame.icon:SetSize( frame:GetHeight() - 4, frame:GetHeight() - 4 )
frame.icon:SetPoint( "CENTER" )
frame.icon:SetTexCoord( 0.1, 0.9, 0.1, 0.9 )

function frame:FadeIn()
	UIFrameFadeIn( self, ( 0.3 * ( 1 - self:GetAlpha() ) ), self:GetAlpha(), 1 )
end

function frame:FadeOut()
	UIFrameFadeOut( self, ( 0.3 * ( 0 + self:GetAlpha() ) ), self:GetAlpha(), 0 )
end

local function OnEvent( self, event )
	isUsable = IsUsableSpell( name )

	if( isUsable ) then
		self:FadeIn()
	else
		self:FadeOut()
	end
end

frame:RegisterEvent( "PLAYER_ENTERING_WORLD" )
frame:RegisterEvent( "ACTIONBAR_UPDATE_USABLE" )
frame:RegisterEvent( "SPELL_UPDATE_USABLE" )
frame:SetScript( "OnEvent", OnEvent )