local PANEL = {}
local matCloseBtn = Material("teelib/closebutton.png")

TLib.Font("Header", 22)


AccessorFunc(PANEL, "m_bIsMenuComponent", "IsMenu", FORCE_BOOL)
AccessorFunc(PANEL, "m_bDraggable", "Draggable", FORCE_BOOL)

function PANEL:Init()

    self.header = self:Add("Panel")
    self.header:Dock(TOP)
    self.header:SetTall(1)

    self.header.Paint = function(pnl, w, h)

        surface.SetDrawColor(TLib.Theme.background)
        surface.DrawRect(0, 0, w, h)

        surface.SetDrawColor(TLib.Theme.accent)
        surface.DrawRect(0, 0, w, 5)

        surface.SetDrawColor(TLib.Theme.outline)
        surface.DrawOutlinedRect(0, 0, w, h, 2)
        surface.DrawLine(0, h - 1, w, h - 1)

    end

    
    self.header.closeBtn = self.header:Add("TLib.Button")
    self.header.closeBtn:Dock(RIGHT)
    self.header.closeBtn:SetText("")

    self.header.closeBtn.DoClick = function(pnl)
        self:Remove()
    end

    self.header.closeBtn.margin = 16

    self.header.closeBtn.Paint = function(pnl, w, h)
        local margin = pnl.margin

        TLib.DrawRect(0, 0, w, h, TLib.Theme.background)
        TLib.DrawOutline(0, 0, w, h, 2, TLib.Theme.outline)

        surface.SetDrawColor(color_white)
        surface.SetMaterial(matCloseBtn)
        surface.DrawTexturedRect(margin, margin, w - (margin * 2), h - (margin * 2))

        if self.header.closeBtn:IsHovered() then
            local margin = pnl.margin


            surface.SetDrawColor(TLib.Theme.red)
            surface.DrawRect(0, 0, w, h - 42)


            surface.SetDrawColor(TLib.Theme.text.h1)
            surface.SetMaterial(matCloseBtn)
            surface.DrawTexturedRect(margin, margin, w - (margin * 2), h - (margin * 2))      

            surface.SetDrawColor(TLib.Theme.outline)
            surface.DrawOutlinedRect(0, 0, w, h, 2)
        end

    end
    
    self.header.title = self.header:Add("TLib.Button2")
    self.header.title:Dock(LEFT)
    self.header.title:SetFont("TLib.Font.Header")
    self.header.title:SetText("")
    self.header.title:SizeToContents()

    self.header.title.PerformLayout = function(pnl)
        pnl:SizeToContents()
        pnl:SetWide(pnl:GetWide() + 16)
        pnl:SetTall(pnl:GetParent():GetTall())
    end

    self.header.title.Paint = function(pnl, w, h)

        if self.header.title:GetText() == "" then return end

        surface.SetDrawColor(TLib.Theme.background)
        surface.DrawRect(0, 0, w, h)

        surface.SetDrawColor(TLib.Theme.outline)
        surface.DrawOutlinedRect(0, 0, w, h, 2)
    end

end

function PANEL:ShowCloseButton(bShow)
    self.header.closeBtn:SetVisible(bShow)
end

function PANEL:SetTitle(text)
    self.header.title:SetText(text)
end

function PANEL:SetupFrame(sizeW, sizeH, title, devbool)
    self:SetSize(sizeW, sizeH)
    self:Center()
    self:SetTitle(title)
    self:MakePopup()
    self:ShowCloseButton(devbool or true)
end

function PANEL:SetHeaderColor(color)
    self.header.Paint = function(pnl, w, h)
        surface.SetDrawColor(color)
        surface.DrawRect(0, 0, w, h)

        surface.SetDrawColor(TLib.Theme.outline)
        surface.DrawOutlinedRect(0, 0, w, h, 2)

        surface.SetDrawColor(TLib.Theme.outline)
        surface.DrawLine(0, h - 1, w, h - 1)

        surface.SetDrawColor(TLib.Theme.outline)
        surface.DrawLine(0, 0, 0, h)

        surface.SetDrawColor(TLib.Theme.outline)
        surface.DrawLine(w - 1, 0, w - 1, h)
    end
end

function PANEL:HideHeader()
    self.header.Paint = nil 
end

function PANEL:PerformLayout(w, h)
    self.header:SetTall(TLib.UISizes.hallo.height)
    self.header.closeBtn:SetWide(self.header:GetTall())
end

function PANEL:SetDraggable(bool)
    self.m_bDraggable = bool
end

function PANEL:CenterTitle()
    self.header.title:Dock(FILL)
    self.header.title:SetContentAlignment(5)
    self.header.title:SetTextInset(0, 0)
end

function PANEL:Close()
    self:Remove()
end

function PANEL:Dev(func)
    
    self.reloadbtn = self.header:Add("TLib.Button2")
    self.reloadbtn:SetupDock(RIGHT)
    self.reloadbtn:SetText("Reload")
    self.reloadbtn:SetWide(100)
    self.reloadbtn.DoClick = function(pnl)
        self:Remove()
        func()
    end
    self.reloadbtn.Paint = function(pnl, w, h)
        TLib.DrawRect(0, 0, w, h, TLib.Theme.background)
        TLib.DrawOutline(0, 0, w, h, 2, TLib.Theme.outline)

        if self.reloadbtn:IsHovered() then
            TLib.DrawRect(0, 0, w, h - 42, TLib.Theme.blue)
            TLib.DrawOutline(0, 0, w, h, 2, TLib.Theme.outline)
        end
    end
end

function PANEL:Draggable(bool)
    self.m_bDraggable = bool
end

vgui.Register("TLib.Frame", PANEL, "TLib.Panel")