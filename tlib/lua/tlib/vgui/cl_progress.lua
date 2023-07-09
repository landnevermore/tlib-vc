local PANEL = {}
AccessorFunc(PANEL, "m_fFraction", "Fraction")

Derma_Hook( PANEL, "Paint", "Paint", "Progress" )

TLib.Font("Progressbar", 18)


function PANEL:Init()
    self:SetMouseInputEnabled(false)
    self:SetFraction(0)
end

function PANEL:GetFraction()
    return self.m_fFraction or 0
end

function PANEL:SetFraction(fFraction)
    self.m_fFraction = math.Clamp(fFraction, 0, 1)
    self:InvalidateLayout()
end

function PANEL:SetupDock(pos, left, top, right, bottom)
	self:Dock(pos)
	self:DockMargin(left or 0, top or 0, right or 0, bottom or 0)
end

function PANEL:SetupTooltip(text)
	self:SetTooltip(text)
	self:SetTooltipPanelOverride("TLib.Tooltip")
end

function PANEL:ShowText()

    local w, h = self:GetSize()
    local radius = 8
    local thickness = 2

    self.PaintOver = function(self, w, h)
    draw.WordBox(radius, w / 2, h / 2, math.Round(self:GetFraction() * 100) .. "%", "TLib.Font.Progressbar", TLib.Theme.transparent, TLib.Theme.text.h1, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    end

end

function PANEL:Paint()
    local w, h = self:GetSize()
    local radius = 8
    local thickness = 2

    draw.RoundedBox(radius, 0, 0, w, h, TLib.Theme.accentalpha)
    draw.RoundedBox(radius, thickness, thickness, w - thickness * 2, h - thickness * 2, TLib.Theme.background)
    draw.RoundedBox(radius, thickness, thickness, self:GetFraction() * (w - thickness * 2), h - thickness * 2, TLib.Theme.accent)
end

-- derma.DefineControl("TLib.Progress", "", PANEL, "TLib.Panel")
vgui.Register("TLib.Progress", PANEL, "Panel")