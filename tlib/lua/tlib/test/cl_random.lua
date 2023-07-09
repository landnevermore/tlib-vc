TLib.cardtest = function()
    cardframe = vgui.Create("TLib.Frame")
    cardframe:SetSize(ScrW() * 0.6, ScrH() * 0.7)
    cardframe:Center()
    cardframe:SetTitle("Hallo Nydal")
    cardframe:MakePopup()

    local bottomdock = vgui.Create("DPanel", cardframe)
    bottomdock:Dock(BOTTOM)
    bottomdock:SetTall(50)
    bottomdock.Paint = function ()
        draw.RoundedBox(0, 0, 0, bottomdock:GetWide(), bottomdock:GetTall(), TLib.Theme.outline)
    end

    local btmlabel = bottomdock:Add("TLib.Label")
    btmlabel:Dock(LEFT)
    btmlabel:DockMargin(10,0,0,0)
    btmlabel:SetText("Unsure where you want to Join?")
    btmlabel:SizeToContents()

    local btmbutton = bottomdock:Add("DButton")
    btmbutton:Dock(LEFT)
    btmbutton:DockMargin(5,0,0,0)
    btmbutton:SetText("")
    btmbutton:SetWide(100)
    btmbutton.Paint = function ()
        draw.RoundedBox(0, 0, 0, btmbutton:GetWide(), btmbutton:GetTall(), TLib.Theme.outline)
        draw.SimpleText("Leave Server", "ChatFont", btmbutton:GetWide() / 2, btmbutton:GetTall() / 2, Color(255, 0, 0), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

        if btmbutton:IsHovered() then
            draw.RoundedBox(0, 0, 0, btmbutton:GetWide(), btmbutton:GetTall(), TLib.Theme.outline)
            draw.SimpleText("Leave Server", "ChatFont", btmbutton:GetWide() / 2, btmbutton:GetTall() / 2, Color(197, 9, 9), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end

    end



    card1 = vgui.Create("TLib.Panel", cardframe)
    card1:Dock(LEFT)
    card1:DockMargin(10,20,0,0)
    card1:SetWide(374)
    card1:SetTall(621)
    card1.Paint = function ()
        surface.SetDrawColor(255,255,255,255)
        surface.SetMaterial(Material("materials/ticons/mediccard.png"))
        surface.DrawTexturedRect(0,0,374,621)
    end

    local join = card1:Add("DButton")
    join:SetSize(240, 50)
    join:SetPos(290, 550)
    join:SetText("")
    join.Paint = function ()
        draw.RoundedBox(15, 0, 0, join:GetWide(), join:GetTall(), Color(255, 0, 0, 200))
        draw.RoundedBox(15, 2, 2, join:GetWide() - 4, join:GetTall() - 4, Color(0, 0, 0, 200))

        if (join:IsHovered()) then
            draw.RoundedBox(15, 0, 0, join:GetWide(), join:GetTall(), Color(255, 0, 0, 200))
            draw.SimpleText("Join", "Trebuchet24", join:GetWide() / 5, join:GetTall() / 2, Color(0, 0, 0), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end

        draw.SimpleText("Join", "Trebuchet24", join:GetWide() / 5, join:GetTall() / 2, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)





    end

    card2 = vgui.Create("TLib.Panel", cardframe)
    card2:Dock(LEFT)
    card2:DockMargin(3,20,0,0)
    card2:SetWide(374)
    card2:SetTall(621)

    card2.Paint = function ()
        surface.SetDrawColor(255, 255, 255, 255)
        surface.SetMaterial(Material("materials/ticons/mtcard.png"))
        surface.DrawTexturedRect(0,0,374,621)

    end

    local join = card2:Add("DButton")
    join:SetSize(240, 50)
    join:SetPos(290, 550)
    join:SetText("")
    join.Paint = function ()

        -- surface.SetDrawColor(255, 255, 255, 255)
        -- surface.SetMaterial(Material("materials/ticons/join.png"))
        -- surface.DrawTexturedRect(0,0,join:GetWide(), join:GetTall())

        draw.RoundedBox(15, 0, 0, join:GetWide(), join:GetTall(), Color(255, 0, 0, 200))
        draw.RoundedBox(15, 2, 2, join:GetWide() - 4, join:GetTall() - 4, Color(0, 0, 0, 200))

        if (join:IsHovered()) then
            draw.RoundedBox(15, 0, 0, join:GetWide(), join:GetTall(), Color(255, 0, 0, 200))
            draw.SimpleText("Join", "Trebuchet24", join:GetWide() / 5, join:GetTall() / 2, Color(0, 0, 0), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        else
            draw.SimpleText("Join", "Trebuchet24", join:GetWide() / 5, join:GetTall() / 2, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end
    end


    card3 = vgui.Create("TLib.Panel", cardframe)
    card3:Dock(LEFT)
    card3:DockMargin(3,20,5,0)
    card3:SetWide(374)
    card3:SetTall(621)

    card3.Paint = function ()
        surface.SetDrawColor(255, 255, 255, 255)
        surface.SetMaterial(Material("materials/ticons/classdcard.png"))
        surface.DrawTexturedRect(0,0,374,621)

    end

    local join = card3:Add("DButton")
    join:SetSize(240, 50)
    join:SetPos(290, 550)
    join:SetText("")
    join.Paint = function ()

        -- surface.SetDrawColor(255, 255, 255, 255)
        -- surface.SetMaterial(Material("materials/ticons/join.png"))
        -- surface.DrawTexturedRect(0,0,join:GetWide(), join:GetTall())

        draw.RoundedBox(15, 0, 0, join:GetWide(), join:GetTall(), Color(255, 0, 0, 200))
        draw.RoundedBox(15, 2, 2, join:GetWide() - 4, join:GetTall() - 4, Color(0, 0, 0, 200))

        if (join:IsHovered()) then
            draw.RoundedBox(15, 0, 0, join:GetWide(), join:GetTall(), Color(255, 0, 0, 200))
            draw.SimpleText("Join", "Trebuchet24", join:GetWide() / 5, join:GetTall() / 2, Color(0, 0, 0), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        else
            draw.SimpleText("Join", "Trebuchet24", join:GetWide() / 5, join:GetTall() / 2, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end
    end

end

concommand.Add("cardtest", TLib.cardtest)