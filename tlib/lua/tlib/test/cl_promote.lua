TLib.Promote = function ()
    
    main = vgui.Create("TLib.Frame")
    main:SetSize(ScrW() * 0.5, ScrH() * 0.5)
    main:Center()
    main:SetTitle("Promote System")
    main:MakePopup()

    local top = vgui.Create("TLib.Panel", main)
    top:Dock(TOP)
    top:SetTall(30)
    top:DockMargin(15, 15, 15, 15)

    local med = vgui.Create("TLib.Button", top)
    med:Dock(LEFT)
    med:DockMargin(5, 5, 5, 5)
    med:SetText("Medizinische Abteilung")
    med:SizeToContents()

    local sec = vgui.Create("TLib.Button", top)
    sec:Dock(LEFT)
    sec:DockMargin(5, 5, 5, 5)
    sec:SetText("Sicherheits Abteilung")
    sec:SizeToContents()

    local sci = vgui.Create("TLib.Button", top)
    sci:Dock(LEFT)
    sci:DockMargin(5, 5, 5, 5)
    sci:SetText("Forschungs Abteilung")
    sci:SizeToContents()

    local eng = vgui.Create("TLib.Button", top)
    eng:Dock(LEFT)
    eng:DockMargin(5, 5, 5, 5)
    eng:SetText("Technische Abteilung")
    eng:SizeToContents()

    


end

concommand.Add("tlib_promote", TLib.Promote)