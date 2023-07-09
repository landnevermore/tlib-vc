
local PANEL = {}

TLib.Font("Label", 20)

function PANEL:Init()

	self:SetIsToggle( false )
	self:SetToggle( false )
	self:SetDisabled( false )
	self:SetMouseInputEnabled( false )
	self:SetKeyboardInputEnabled( false )
	self:SetDoubleClickingEnabled( true )

	-- Nicer default height
	self:SetTall( 20 )

	-- This turns off the engine drawing
	self:SetPaintBackgroundEnabled( false )
	self:SetPaintBorderEnabled( false )

	self:SetFont( "TLib.Font.Label" )

    self:SetTextColor( TLib.Theme.text.h1 )
	self:SetText("")

end

function PANEL:Wrap()
	self:SetWrap( true  )
	self:SetAutoStretchVertical( true )
end

vgui.Register( "TLib.Label", PANEL, "TLib.Label_internal" )


