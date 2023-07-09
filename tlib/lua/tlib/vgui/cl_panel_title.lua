
local PANEL = {}

AccessorFunc( PANEL, "m_bBackground",		"PaintBackground",	FORCE_BOOL )
AccessorFunc( PANEL, "m_bBackground",		"DrawBackground",	FORCE_BOOL ) -- deprecated
AccessorFunc( PANEL, "m_bIsMenuComponent",	"IsMenu",			FORCE_BOOL )
AccessorFunc( PANEL, "m_bDisableTabbing",	"TabbingDisabled",	FORCE_BOOL )

AccessorFunc( PANEL, "m_bDisabled",	"Disabled" )
AccessorFunc( PANEL, "m_bgColor",	"BackgroundColor" )


function PANEL:Init()

	self:SetPaintBackground( true )

	-- This turns off the engine drawing
	self:SetPaintBackgroundEnabled( false )
	self:SetPaintBorderEnabled( false )

    self.titledock = self:Add("DPanel")
    self.titledock:Dock(TOP)
    self.titledock:SetTall(self:GetTall() * 1)
    self.titledock.Paint = function() 
        surface.SetDrawColor( TLib.Theme.outline )
        surface.DrawRect(0,0, self:GetWide(), self:GetTall())
    end

    self.title = self.titledock:Add("TLib.Label")
    self.title:Dock(FILL)
    self.title:SetText("Title")
    self.title:SetTextInset(5,0)

    
end

function PANEL:SetTitle( text )
    self.title:SetText(text)
end

function PANEL:CenterTitle()
    self.title:SetTextInset(0,0)
    self.title:SetContentAlignment(5)
end

function PANEL:SetupTitle(text, bool)

	self.title:SetText(text)

	if bool  == true then
		self.title:SetContentAlignment(5)
		self.title:SetTextInset(0,0)
	end

end

function PANEL:SubHeader(text)
	self.subheader = self:Add("TLib.Label")
	self.subheader:SetupDock(TOP, 10,10,10,10)
	self.subheader:SetText(text)
	self.subheader:SetFont("ChatFont")
	self.subheader:SetContentAlignment(5)
end

function PANEL:SetDisabled( bDisabled )

	self.m_bDisabled = bDisabled

	if ( bDisabled ) then
		self:SetAlpha( 75 )
		self:SetMouseInputEnabled( false )
	else
		self:SetAlpha( 255 )
		self:SetMouseInputEnabled( true )
	end

end

function PANEL:SetEnabled( bEnabled )

	self:SetDisabled( !bEnabled )

end

function PANEL:IsEnabled()

	return !self:GetDisabled()

end

function PANEL:OnMousePressed( mousecode )

	if ( self:IsSelectionCanvas() && !dragndrop.IsDragging() ) then
		self:StartBoxSelection()
		return
	end

	if ( self:IsDraggable() ) then

		self:MouseCapture( true )
		self:DragMousePress( mousecode )

	end

end

function PANEL:OnMouseReleased( mousecode )

	if ( self:EndBoxSelection() ) then return end

	self:MouseCapture( false )

	if ( self:DragMouseRelease( mousecode ) ) then
		return
	end

end

-- local amount = 3
-- function PANEL:Paint(w, h)
--     local aX, aY = self:LocalToScreen()
--     BSHADOWS.BeginShadow()

--     surface.SetDrawColor(TLib.Theme.background)
--     surface.DrawRect(aX, aY, w, h)

    
--     surface.SetDrawColor(TLib.Theme.outline)
--     surface.DrawOutlinedRect(aX, aY, w, h, 2)

--     BSHADOWS.EndShadow(1, 2, 2)
-- end

vgui.Register("TLib.TitlePanel", PANEL, "TLib.Panel")