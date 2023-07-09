local PANEL = {}

function PANEL:Init()


    self.label = vgui.Create("TLib.Label", self)
    self.label:Dock(FILL)
    self.label:SetContentAlignment(5)



end

function PANEL:SetText(text)
    self.label:SetText(text)
end

function PANEL:SetFont(font)
    self.label:SetFont(font)
end

function PANEL:SetOutline(color)
    self.PaintOver = function(s, w, h)
        surface.SetDrawColor(color or TLib.Theme.outline)
        surface.DrawOutlinedRect(0, 0, w, h)
    end
end

function PANEL:Paint(w, h)
    surface.SetDrawColor(TLib.Theme.background)
    surface.DrawRect(0, 0, w, h)

    surface.SetDrawColor(TLib.Theme.outline)
    surface.DrawOutlinedRect(0, 0, w, h)
end
vgui.Register("TLib.LabelPanel", PANEL, "TLib.Panel")