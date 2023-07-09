
TLib.Akten = function()

    main = vgui.Create("TLib.Frame")
    main:SetSize(ScrW() * 0.5, ScrH() * 0.5)
    main:Center()
    main:SetTitle("Akten System")
    main:MakePopup()

    local top = vgui.Create("TLib.Panel", main)
    top:Dock(TOP)
    top:SetTall(30)
    top:DockMargin(15, 15, 15, 15)

    local paper = vgui.Create("TLib.Button", top)
    paper:Dock(LEFT)
    paper:DockMargin(5, 5, 5, 5)
    paper:SetWide(100)
    paper:SetText("Papier")
    
    local search = vgui.Create("TLib.Button", top)
    search:Dock(LEFT)
    search:DockMargin(5, 5, 5, 5)
    search:SetWide(100)
    search:SetText("Suchen")

    local new = vgui.Create("TLib.Button", top)
    new:Dock(RIGHT)
    new:DockMargin(5, 5, 5, 5)
    new:SetWide(100)
    new:SetText("Erstellen")
    new:TDLib():Background(Color(1,182,55)):BarHover(TLib.Theme.accent):CircleHover(TLib.Theme.accentalpha)
    new.DoClick = function()
        TLib.Aktencreate()
    end





    local listdock = vgui.Create("TLib.Panel", main)
    listdock:Dock(FILL)
    listdock:DockMargin(15, 0, 15, 15)


    local list = vgui.Create("TLib.ListView", listdock)
    list:Dock(FILL)
    list:DockMargin(10, 10, 10, 10)
    list:AddColumn("ID"):SetWidth(20)
    list:AddColumn("Datum"):SetWidth(120)
    list:AddColumn("Mediziner"):SetWidth(150)
    list:AddColumn("Zusammenfassung"):SetWidth(500)

    for i = 1, 100 do
        list:AddLine(i, "01.01.2020", "Dr. Kleiner", "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut")
    end

    list.OnRowSelected = function( panel, line )
        TLib.Aktenview()
    end

end


TLib.Aktenview = function ()

    local main = vgui.Create("TLib.Frame")  
    main:SetSize(ScrW() * 0.2, ScrH() * 0.6)
    main:Center()
    main:SetTitle("Akten Einsehen")
    main:MakePopup()        

    local top = vgui.Create("TLib.Panel", main)
    top:Dock(TOP)
    top:SetTall(30)
    top:DockMargin(15, 15, 15, 15)

    local save = vgui.Create("TLib.Button", top)
    save:Dock(LEFT)
    save:DockMargin(5, 5, 5, 5)
    save:SetWide(100)
    save:SetText("Bearbeiten")
    save:TDLib():Background(TLib.Theme.blue):BarHover(TLib.Theme.accent):CircleHover(TLib.Theme.accentalpha)


    local delete = vgui.Create("TLib.Button", top)
    delete:Dock(LEFT)
    delete:DockMargin(5, 5, 5, 5)
    delete:SetWide(100)
    delete:SetText("Löschen")
    delete:TDLib():Background(TLib.Theme.red):BarHover(TLib.Theme.accent):CircleHover(TLib.Theme.accentalpha)
    
end


TLib.Aktencreate = function()

    local main = vgui.Create("TLib.Frame")
    main:SetSize(ScrW() * 0.2, ScrH() * 0.6)
    main:Center()
    main:SetTitle("Akten Erstellen")
    main:MakePopup()
    main:SetDraggable(true)
    
    local top = vgui.Create("TLib.Panel", main)
    top:Dock(TOP)
    top:SetTall(30)
    top:DockMargin(15, 15, 15, 15)

    local save = vgui.Create("TLib.Button", top)
    save:Dock(LEFT)
    save:DockMargin(5, 5, 5, 5)
    save:SetWide(100)
    save:SetText("Speichern")
    save:TDLib():Background(TLib.Theme.green):BarHover(TLib.Theme.accent):CircleHover(TLib.Theme.accentalpha)

    local delete = vgui.Create("TLib.Button", top)
    delete:Dock(LEFT)
    delete:DockMargin(5, 5, 5, 5)
    delete:SetWide(100)
    delete:SetText("Löschen")
    delete:TDLib():Background(TLib.Theme.red):BarHover(TLib.Theme.accent):CircleHover(TLib.Theme.accentalpha)

    local dockfill = vgui.Create("TLib.Panel", main)
    dockfill:Dock(FILL)
    dockfill:DockMargin(15, 0, 15, 15)

    

    -- local sumdock = vgui.Create("TLib.Panel", dockfill)
    -- sumdock:Dock(TOP)
    -- sumdock:DockMargin(5, 5, 5, 5)
    -- sumdock:SetTall(30)


    -- local sumtext = vgui.Create("TLib.Label", sumdock)
    -- sumtext:Dock(FILL)
    -- sumtext:DockMargin(10,0,0,0)
    -- sumtext:SetText("Zusammenfassung")

    -- local sum = vgui.Create("TLib.TextEntry", dockfill)
    -- sum:Dock(TOP)
    -- sum:DockMargin(10, 5, 10, 5)
    -- sum:SetTall(30)
    -- sum:SetPlaceholderText("Zusammenfassung")

    local meddock = vgui.Create("TLib.Panel", dockfill)
    meddock:Dock(TOP)
    meddock:DockMargin(5, 5, 5, 5)
    meddock:SetTall(30)

    local medtext = vgui.Create("TLib.Label", meddock)
    medtext:Dock(FILL)
    medtext:DockMargin(10,0,0,0)
    medtext:SetText("Mediziner")

    local med = vgui.Create("TLib.TextEntry", dockfill)
    med:Dock(TOP)
    med:DockMargin(10, 5, 10, 5)
    med:SetTall(30)
    med:SetPlaceholderText(LocalPlayer():Nick())
    med:SetText(LocalPlayer():Nick())

    local patdock = vgui.Create("TLib.Panel", dockfill)
    patdock:Dock(TOP)
    patdock:DockMargin(5, 5, 5, 5)
    patdock:SetTall(30)

    local pattext = vgui.Create("TLib.Label", patdock)
    pattext:Dock(FILL)
    pattext:DockMargin(10,0,0,0)
    pattext:SetText("Patient")

    local pat = vgui.Create("TLib.Combo", dockfill)
    pat:Dock(TOP)
    pat:DockMargin(10, 5, 10, 5)
    pat:SetTall(30)
    pat:SetValue("Patient auswählen...")

    for k, v in pairs(player.GetAll()) do
        pat:AddChoice(v:Nick())
    end
    
    -- pat:SetPlaceholderText("Patient")
    

    local condock = vgui.Create("TLib.Panel", dockfill)
    condock:Dock(TOP)
    condock:DockMargin(5, 5, 5, 5)
    condock:SetTall(30)


    local contenttext = vgui.Create("TLib.Label", condock)
    contenttext:Dock(FILL)
    contenttext:DockMargin(10,0,0,0)
    contenttext:SetText("Anmerkung")

    local content = vgui.Create("TLib.TextEntry", dockfill)
    content:Dock(FILL)
    content:DockMargin(10, 5, 10, 10)
    content:SetMultiline(true)
    content:SetPlaceholderText("")











    
end

concommand.Add("Tlib_Akten", TLib.Akten)