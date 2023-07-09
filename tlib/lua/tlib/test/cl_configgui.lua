
TLib.Configui = function()
    mainframe = vgui.Create("TLib.Frame")
    mainframe:SetSize(ScrW() * 0.5, ScrH() * 0.5)
    mainframe:Center()
    mainframe:SetTitle("TLib Configuration")
    mainframe:MakePopup()

    local scroll = vgui.Create("TLib.ScrollPanel", mainframe)
    scroll:Dock(FILL)

    local general = vgui.Create("TLib.Panel", scroll)
    general:Dock(TOP)
    general:DockMargin(10, 10, 10, 0)
    general:SetTall(40)
    general:DockPadding(10, 10, 10, 10)
    general:TDLib()
    general:Background(TLib.Theme.outline)
    general:Text("General", "TLib.Header")

    local generaldock = vgui.Create("TLib.Panel", scroll)
    generaldock:Dock(TOP)
    generaldock:DockMargin(10, 0, 10, 0)
    generaldock:SetTall(100)


    local colors = vgui.Create("TLib.Panel", scroll)
    colors:Dock(TOP)
    colors:DockMargin(10, 10, 10, 0)
    colors:SetTall(40)
    colors:DockPadding(10, 10, 10, 10)
    colors:TDLib()
    colors:Background(TLib.Theme.outline)
    colors:Text("Theme", "TLib.Header")

    colorsdock = vgui.Create("TLib.Panel", scroll)
    colorsdock:Dock(TOP)
    colorsdock:DockMargin(10, 0, 10,10)
    colorsdock:SetTall(250)


    local colorpicker = vgui.Create("DColorMixer", colorsdock)
    colorpicker:Dock(FILL)
    colorpicker:DockMargin(10, 10, 10,10)
    colorpicker:SetTall(40)
    colorpicker:TDLib()
    colorpicker:Background(TLib.Theme.outline)
    colorpicker:Text("Theme", "TLib.Header")

    local hud = vgui.Create("TLib.Panel", scroll)
    hud:Dock(TOP)
    hud:DockMargin(10, 10, 10, 0)
    hud:SetTall(40)
    hud:TDLib()
    hud:Background(TLib.Theme.outline)
    hud:Text("HUD", "TLib.Header")

    local huddock = vgui.Create("TLib.Panel", scroll)
    huddock:Dock(TOP)
    huddock:DockMargin(10, 10, 10, 50)
    huddock:SetTall(100)

    local hudtoggle = vgui.Create("TLib.CheckBoxLabel", huddock)
    -- hudtoggle:SetPos(mainframe:GetWide() - 150, 20)
    -- hudtoggle:SetSize(190, 30)
    hudtoggle:Dock(TOP)
    hudtoggle:DockMargin(10, 10, 10, 0)
    hudtoggle:TDLib()
    hudtoggle:Text("Enable HUD", "TLib.Label", color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)





end

concommand.Add("TLib_config", TLib.Configui)