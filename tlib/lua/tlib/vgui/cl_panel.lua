
local PANEL = {}

AccessorFunc( PANEL, "m_bBackground",		"PaintBackground",	FORCE_BOOL )
AccessorFunc( PANEL, "m_bBackground",		"DrawBackground",	FORCE_BOOL ) -- deprecated
AccessorFunc( PANEL, "m_bIsMenuComponent",	"IsMenu",			FORCE_BOOL )
AccessorFunc( PANEL, "m_bDisableTabbing",	"TabbingDisabled",	FORCE_BOOL )

AccessorFunc( PANEL, "m_bDisabled",	"Disabled" )
AccessorFunc( PANEL, "m_bgColor",	"BackgroundColor" )

Derma_Hook( PANEL, "Paint", "Paint", "Panel" )
Derma_Hook( PANEL, "ApplySchemeSettings", "Scheme", "Panel" )
Derma_Hook( PANEL, "PerformLayout", "Layout", "Panel" )

function PANEL:Init()

	self:SetPaintBackground( true )
	self:SetPaintBackgroundEnabled( false )
	self:SetPaintBorderEnabled( false )

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

local amount = 3
function PANEL:Paint(w, h)
    local aX, aY = self:LocalToScreen()
    BSHADOWS.BeginShadow()

    surface.SetDrawColor(TLib.Theme.background)
    surface.DrawRect(aX, aY, w, h)

    
    surface.SetDrawColor(TLib.Theme.outline)
    surface.DrawOutlinedRect(aX, aY, w, h, 2)

    BSHADOWS.EndShadow(1, 2, 2)
end

function PANEL:SetupDock(pos, left, top, right, bottom)
	self:Dock(pos)
	self:DockMargin(left or 0, top or 0, right or 0, bottom or 0)
end

function PANEL:SetupTooltip(text)
	self:SetTooltip(text)
	self:SetTooltipPanelOverride("TLib.Tooltip")
end

function PANEL:Gradient(col, dir, frac, op)

	self.Paint = function()
	local w, h = self:GetSize()
	local x, y = self:LocalToScreen()
	local dir = dir || BOTTOM
	local frac = frac || 1


	local aX, aY = self:LocalToScreen()
	BSHADOWS.BeginShadow()

	surface.SetDrawColor(TLib.Theme.background)
	surface.DrawRect(aX, aY, w, h)

	
	surface.SetDrawColor(TLib.Theme.outline)
	surface.DrawOutlinedRect(aX, aY, w, h, 2)

	BSHADOWS.EndShadow(1, 2, 2)

	local gradLeft = Material("vgui/gradient-l")
	local gradUp = Material("vgui/gradient-u")
	local gradRight = Material("vgui/gradient-r")
	local gradDown = Material("vgui/gradient-d")

		surface.SetDrawColor(col)

		local x, y, gw, gh		
		if(dir == LEFT) then
			local prog = math.Round(w*frac)
			x, y, gw, gh = 0, 0, prog, h
			surface.SetMaterial(op && gradRight || gradLeft)
		elseif(dir == TOP) then
			local prog = math.Round(h*frac)
			x, y, gw, gh = 0, 0, w, prog
			surface.SetMaterial(op && gradDown || gradUp)
		elseif(dir == RIGHT) then
			local prog = math.Round(w*frac)
			x, y, gw, gh = w-prog, 0, prog, h
			surface.SetMaterial(op && gradLeft || gradRight)
		elseif(dir == BOTTOM) then
			local prog = math.Round(h*frac)
			x, y, gw, gh = 0, h-prog, w, prog
			surface.SetMaterial(op && gradUp || gradDown)
		end

		surface.DrawTexturedRect(x, y, gw, gh)
	end
end

function PANEL:UpdateColours()
end

derma.DefineControl( "TLib.Panel", "", PANEL, "Panel" )
