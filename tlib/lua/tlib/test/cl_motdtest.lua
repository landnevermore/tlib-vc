TLib.Font("Modt", 30, "Bauhaus Md BT")
TLib.Font("Modt_time", 30, "Digital-7")
TLib.Font("Modt_date", 20, "Digital-7")


TLib.MOTDBTN = {
    [1] = {
        name = "Continue",
    },
    [2] = {
        name = "Settings",
    },
    [3] = {
        name = "Console",
    },
    [4] = {
        name = "Exit",
    },
}

TLib.Modttest = function()
    

    local baseframe = vgui.Create("DFrame")
    baseframe:SetSize(ScrW(), ScrH())
    baseframe:SetTitle("")
    baseframe:MakePopup()
    baseframe.Paint = function(self, w, h)
        draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0))
    end

    local basepanel = vgui.Create("DPanel", baseframe)
    basepanel:Dock(FILL)
    basepanel:DockMargin(40, 40, 40, 40)
    basepanel.Paint = function(self, w, h)
        draw.RoundedBox(0, 0, 0, w, h, Color(255, 255, 255, 0))
    end

    local topdock = vgui.Create("TLib.Panel", basepanel)
    topdock:Dock(TOP)
    topdock:SetTall(100)
    topdock:DockMargin(0, 0, 0, 20)

    local title = vgui.Create("TLib.Label", topdock)
    title:Dock(LEFT)
    title:SetText("TitansRP | SCP-RP")
    title:SetFont("TLib.Font.Modt")
    title:SetTextInset(20, 0)
    title:SetContentAlignment(4)
    title:SizeToContents()

    local time = vgui.Create("TLib.Button2", topdock)
    time:Dock(RIGHT)
    time:SetWide(100)
    time:SetText(os.date("%H:%M", os.time()))
    time:SetFont("TLib.Font.Modt")
    time.Think = function(self)
        self:SetText(os.date("%H:%M", os.time()))
    end


    local leftdock = vgui.Create("TLib.Panel", basepanel)
    leftdock:Dock(LEFT)
    leftdock:SetWide(500)
    leftdock:DockMargin(0, 0, 20, 0)

    local lefttopdock = vgui.Create("TLib.Panel", leftdock)
    lefttopdock:Dock(TOP)
    lefttopdock:SetTall(100)
    lefttopdock:DockMargin(0, 0, 0, 0)

    local lefttopdocklabel = vgui.Create("TLib.Label", lefttopdock)
    lefttopdocklabel:Dock(FILL)
    lefttopdocklabel:SetText("Welcome to the server!")
    lefttopdocklabel:SetFont("TLib.Font.Modt")
    lefttopdocklabel:SetContentAlignment(5)

    local leftbottomdock = vgui.Create("TLib.Panel", leftdock)
    leftbottomdock:Dock(BOTTOM)
    leftbottomdock:SetTall(100)
    leftbottomdock:DockMargin(0, 0, 0, 0)


    for k,v in SortedPairs(TLib.MOTDBTN) do
        local btn = vgui.Create("TLib.Button", leftdock)
        btn:Dock(TOP)
        btn:SetTall(161)
        btn:SetText(v.name)
        btn:SetFont("TLib.Font.Button")
        btn:SetTextColor(TLib.Theme.text.h1)

        btn.Paint = function(self, w, h)
            draw.SimpleText(self.titlebtn, "TLib.Font.Button", w / 2, h / 2, TLib.Theme.accent, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            surface.SetDrawColor(TLib.Theme.outline)
            surface.DrawRect(0, 0, w, h)


            if (self:IsDown()) then
                surface.SetDrawColor(0,0,0,100)
                surface.DrawRect(0, 0, w, h)

                return
            end

            if (self:IsHovered()) then
                TLib.HoverEffect(0,0,w,h)
            end

            self.OnCursorEntered = function( self )
                surface.PlaySound( "tlib/click.mp3" )
            end
        end

    end



    local rightdock = vgui.Create("TLib.Panel", basepanel)
    rightdock:Dock(FILL)
    rightdock:DockMargin(20, 0, 0, 0)
    
    local righttopdock = vgui.Create("TLib.Panel", rightdock)
    righttopdock:Dock(TOP)
    righttopdock:SetTall(100)
    righttopdock:DockMargin(0, 0, 0, 0)

    local righttopdocklabel = vgui.Create("TLib.Label", righttopdock)
    righttopdocklabel:Dock(FILL)
    righttopdocklabel:SetText("Neuigkeiten")
    righttopdocklabel:SetFont("TLib.Font.Modt")
    righttopdocklabel:SetContentAlignment(5)

    local rightbottomdock = vgui.Create("TLib.Panel", rightdock)
    rightbottomdock:Dock(BOTTOM)
    rightbottomdock:SetTall(100)
    rightbottomdock:DockMargin(0, 0, 0, 0)

    local scroll = vgui.Create("TLib.ScrollPanel", rightdock)
    scroll:Dock(FILL)
    scroll:DockMargin(0, 0, 0, 0)

    for i = 1, 10 do
        local panel = vgui.Create("TLib.Panel", scroll)
        panel:Dock(TOP)
        panel:SetTall(100)
        panel:DockMargin(0, 0, 0, 5)


        local timedock = vgui.Create("TLib.Panel", panel)
        timedock:Dock(LEFT)
        timedock:SetWide(100)
        timedock:DockMargin(5,5,5,5)

        local time = vgui.Create("TLib.Label", timedock)
        time:Dock(TOP)
        time:DockMargin(0, 15, 0, 0)
        time:SetText(os.date("%H:%M", os.time()))
        time:SetContentAlignment(5)
        time:SetFont("TLib.Font.Modt_time")

        local date = vgui.Create("TLib.Label", timedock)
        date:Dock(BOTTOM)
        date:DockMargin(0, 0, 0, 15)
        date:SetText(os.date("%d.%m.%Y", os.time()))
        date:SetContentAlignment(5)
        date:SetFont("TLib.Font.Modt_date")


        local title = vgui.Create("TLib.Label", panel)
        title:Dock(TOP)
        title:SetText("Neuigkeit ".. i)
        title:SetFont("TLib.Font.Modt")
        title:SetTextInset(5, 0)
        title:SetTall(40)

        local text = vgui.Create("TLib.Label", panel)
        text:Dock(FILL)
        text:SetText("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vitccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc")
        text:Wrap()
        
    end








end


concommand.Add("tlib_modttest", TLib.Modttest)