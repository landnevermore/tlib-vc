TLib.Font("Char_40", 40, "Bauhaus Md BT")
TLib.Font("CharText_30", 30)


TLib.CreateChar = function()

    CharBase = vgui.Create("DFrame")
    CharBase:SetSize(ScrW() * 0.4, ScrH() * 0.9)
    CharBase:Center()
    CharBase:MakePopup()
    CharBase:SetTitle("Character Creation")


    local img = vgui.Create("DImage", CharBase)
    img:Dock(FILL)
    img:SetImage("ticons/empty.jpg")


    local rightdock = vgui.Create("DPanel", img)
    rightdock:Dock(TOP)
    rightdock:SetTall(ScrH() * 0.1)
    rightdock:DockMargin(520,10,0,0)
    -- rightdock.Paint = function(self, w, h)
    -- end

    local clearance = vgui.Create("TLib.Label", rightdock)
    clearance:Dock(TOP)
    clearance:SetTall(30)
    clearance:SetContentAlignment(5)
    clearance:SetText("0")
    clearance:SetTextColor(Color(0,0,0))
    clearance:SetFont("TLib.Font.Char_40")


    local filldock = vgui.Create("DPanel", img)
    filldock:Dock(FILL)
    filldock:DockMargin(30,10,30,70)
    filldock.Paint = function(self, w, h)
        -- draw.RoundedBox(0, 0, 0, w, h, Color(0,0,0))
    end


    local topdock = vgui.Create("DPanel", filldock)
    topdock:Dock(TOP)
    topdock:SetTall(ScrH() * 0.2)

    -- local name = vgui.Create("TLib.Label", topdock)
    -- name:Dock(TOP)
    -- name:SetTall(30)
    -- name:SetContentAlignment(4)
    -- name:SetText(" Vor & Name")
    -- name:SetTextColor(Color(0,0,0))
    -- name:SetFont("TLib.Font.Char_40")

    -- local name = vgui.Create("TLib.TextEntry", topdock)
    -- name:Dock(TOP)
    -- name:SetTall(30)
    -- name:SetPlaceholderText("Name")




    -- local name = vgui.Create("TLib.Label", filldock)
    -- name:Dock(TOP)
    -- name:SetTall(30)
    -- name:SetContentAlignment(4)
    -- name:SetText("Name")
    -- name:SetTextColor(Color(0,0,0))
    -- name:SetFont("TLib.Font.Char_40")



    -- local name = vgui.Create("DTextEntry", CharBase)
    -- name:Dock(TOP)
    -- name:SetTall(30)
    -- name:SetPlaceholderText("Name")
    


end


tlib_chartest = function()

    CharBase = vgui.Create("TLib.Frame")
    CharBase:SetSize(ScrW() * 0.5, ScrH() * 0.7)
    CharBase:Center()
    CharBase:MakePopup()
    CharBase:SetTitle("Personal Akten")

    local scroll = vgui.Create("TLib.ScrollPanel", CharBase)
    scroll:Dock(LEFT)
    scroll:DockMargin(10,10,10,10)
    scroll:SetWide(ScrW() * 0.1)

    local rightdock = vgui.Create("TLib.Panel", CharBase)
    rightdock:Dock(FILL)

 
    for k,v in pairs(player.GetAll()) do 

        if v:getJobTable().isSCP then continue end


        local ply = vgui.Create("TLib.Button", scroll)
        ply:Dock(TOP)
        ply:DockMargin(10,5,10,5)
        ply:SetTall(30)
        ply:SetText(v:Nick())
        ply:SetVisible(true)



        ply.DoClick = function()
            rightdock:Clear()

            local label = vgui.Create("TLib.Label", rightdock)
            label:Dock(FILL)
            label:SetContentAlignment(5)
            label:SetText("Keine Akten vorhanden")



        end

    end

end


concommand.Add("tlib_chartest", tlib_chartest)

concommand.Add("tlib_char", TLib.CreateChar)