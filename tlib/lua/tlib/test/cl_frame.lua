
TLib.FrameTest = function()


    local htmltestframe = vgui.Create("TLib.Frame")
    htmltestframe:SetSize(ScrW() / 2, ScrH() / 2)
    htmltestframe:Center()
    htmltestframe:MakePopup()
    htmltestframe:SetTitle("TLib in TLib - HTML Test")
    -- htmltestframe:SetHeaderColor(TLib.Theme.green)
    -- htmltestframe:CenterTitle()
    -- htmltestframe:SetTitle("TLib in TLib - HTML Test")


    local progressbar = vgui.Create("TLib.Progress", htmltestframe)
    progressbar:Dock(TOP)
    progressbar:DockMargin(15,15,15,15)
    progressbar:SetTall(10)
    progressbar:SetFraction(0.5)
    -- progressbar:ShowText()
    -- progressbar.Paint = function(self, w, h)
    --     local radius = 8
    --     local thickness = 2

    --     draw.RoundedBox(radius, 0, 0, w, h, TLib.Theme.accentalpha)
    --     draw.RoundedBox(radius, thickness, thickness, w-thickness*2, h-thickness*2, TLib.Theme.background)

    --     draw.RoundedBox(radius, thickness, thickness, self:GetFraction() * (w-thickness*2), h-thickness*2, TLib.Theme.accent)

    --     draw.WordBox( radius, w/2, h/2, math.Round(self:GetFraction() * 100) .. "%", "TLib.Font.Progressbar", TLib.Theme.transparent, TLib.Theme.text.h1, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
    
    -- end
    



    -- local frame = vgui.Create("TLib.Frame")
    -- frame:SetSize(ScrW() * 0.5, ScrH() * 0.5)
    -- frame:Center()
    -- frame:MakePopup()
    -- frame:SetTitle("TLib - Garry's Mod Library")

    -- local dockpanel = vgui.Create("TLib.Panel", frame)
    -- dockpanel:Dock(TOP)
    -- dockpanel:DockMargin(10,10,10,10)
    -- dockpanel:SetTall(70)

    -- local notifytest = vgui.Create("TLib.Button", dockpanel)
    -- notifytest:Dock(LEFT)
    -- notifytest:DockMargin(5,5,5,5)
    -- notifytest:SetText("Notify")
    -- notifytest:SetWide(100)
    -- notifytest.DoClick = function()
    --     TNRP:Notify( TLib.Theme.red , "TNRP Notify Test" , "Lorem Ipsum, Dipsum Ealse Alstor", "ticons/job_demo.png" )
    -- end

    -- local button = vgui.Create("DButton", dockpanel)
    -- button:Dock(LEFT)
    -- button:DockMargin(5,5,5,5)
    -- button:SetText("Button")
    -- button:SetWide(100)
    -- button.Paint = function(self, w, h)
    --     surface.SetDrawColor(TLib.HextoRGB("#eb4034"))
    --     surface.DrawRect(0,0,w,h)
    -- end
    
    
    -- TLib.CreateBox(dockpanel, "Header", "Text", LEFT)

    -- local btndock = vgui.Create("TLib.Panel", frame)
    -- btndock:Dock(TOP)
    -- btndock:DockMargin(10,10,10,10)
    -- btndock:SetTall(70)


    -- local button = vgui.Create("TLib.Button", btndock)
    -- button:Dock(LEFT)
    -- button:DockMargin(5,5,5,5)
    -- button:SetText("Button")
    -- button:SetWide(100)

    -- local button2 = vgui.Create("TLib.Button2", btndock)
    -- button2:Dock(LEFT)
    -- button2:DockMargin(5,5,5,5)
    -- button2:SetText("Button2")
    -- button2:SetWide(100)

    -- local button3 = vgui.Create("TLib.Button3", btndock)
    -- button3:Dock(LEFT)
    -- button3:DockMargin(5,5,5,5)
    -- button3:SetText("")
    -- button3:SetWide(100)
    -- button3:SetOutline(TLib.Theme.red)
    -- button3:SetColor(TLib.Theme.red)


    -- local frame = vgui.Create("TLib.Frame")
    -- frame:SetSize(ScrW() * 0.5, ScrH() * 0.5)
    -- frame:Center()
    -- frame:MakePopup()
    -- frame:SetTitle("TLib - TestFrame")
    -- frame:SetDraggable(true)

    -- local image = vgui.Create("DImageButton", frame)
    -- image:SetImage("ticons/classdcard.png")
    -- image:Dock(LEFT)
    -- image:DockMargin(5,5,5,5)
    -- image:SetSize(374,621)
    -- image:SetColor(Color(255,255,255))
    -- image:SetKeepAspect(true)

    -- image.Paint = function(self, w, h)
    --     surface.SetDrawColor(255,255,255)
    --     surface.DrawRect(0,0,w,h)
    -- end

    -- local dockpanel = vgui.Create("TLib.Panel", frame)
    -- dockpanel:Dock(TOP)
    -- dockpanel:DockMargin(10,10,10,10)
    -- dockpanel:SetTall(30)

    -- local button = vgui.Create("TLib.Button", dockpanel)
    -- button:Dock(LEFT)
    -- button:DockMargin(5,5,5,5)
    -- button:SetText("Pipi & kaka")
    -- button:SizeToContents()

    -- local button = vgui.Create("TLib.Button", dockpanel)
    -- button:Dock(LEFT)
    -- button:DockMargin(5,5,5,5)
    -- button:SetText("Pipi & kaka")
    -- button:SizeToContents()



    -- local button = vgui.Create("TLib.Button", frame)
    -- button:Dock(BOTTOM)
    -- button:DockMargin(5,5,5,5)
    -- button:SetText("Pipi & kaka")

    -- local entry = vgui.Create("TLib.TextEntry", frame)
    -- entry:Dock(BOTTOM)

    -- local label = vgui.Create("TLib.Label", frame)
    -- label:Dock(BOTTOM)
    -- label:SetText("Lorem Dipshit")
    -- label:DockMargin(20, 0, 0, 5)


    -- local menubar = vgui.Create("TLib.MenuBar", frame)
    -- menubar:Dock(TOP)
    -- menubar:DockMargin(5,5,5,5)

    -- local menu = menubar:AddMenu("Datei")
    -- menu:AddOption("Neu", function() print("Neu") end)
    -- menu:AddOption("Öffnen", function() print("Öffnen") end)
    -- menu:AddOption("Speichern", function() print("Speichern") end)
    -- menu:AddOption("Speichern unter", function() print("Speichern unter") end)
    -- menu:AddOption("Schließen", function() print("Schließen") end)

    -- local numslider = vgui.Create("TLib.NumSlider", frame)
    -- numslider:Dock(TOP)
    -- numslider:DockMargin(5,5,5,5)
    -- numslider:SetText("Test")
    -- numslider:SetMin(0)
    -- numslider:SetMax(100)
    -- numslider:SetDecimals(0)
    -- numslider:SetValue(50)
    

    -- local propertysheet = vgui.Create("TLib.PropertySheet", frame)
    -- propertysheet:Dock(FILL)
    -- propertysheet:DockMargin(5,5,5,5)

    -- local panel = vgui.Create("TLib.Panel", propertysheet)
    -- panel:Dock(FILL)
    -- panel:DockMargin(5,5,5,5)
    -- panel:SetBackgroundColor(Color(255,0,0))
    -- propertysheet:AddSheet("Test", panel, "icon16/accept.png")


    -- local panel = vgui.Create("DPanel", propertysheet)
    -- panel:Dock(FILL)
    -- panel:DockMargin(5,5,5,5)
    -- panel:SetBackgroundColor(Color(0,255,0))
    -- propertysheet:AddSheet("Test", panel, "icon16/accept.png")


    --     local liste = vgui.Create("TLib.ListView", frame)
    -- liste:Dock(FILL)
    -- liste:SetMultiSelect(false)
    -- liste:AddColumn( "Beruf" ):SetWidth(200)
    -- liste:AddColumn( "Joins" ):SetWidth(50)
    -- liste:AddColumn( "Stunden" ):SetWidth(50)

    -- local listview = vgui.Create("TLib.Tree", frame)
    -- listview:Dock(FILL)

    
    -- local node = listview:AddNode( "Node One" )
    -- local node = listview:AddNode( "Node Two" )
    -- local cnode = node:AddNode( "Node 2.1" )
    -- local cnode = node:AddNode( "Node 2.2" )
    -- local cnode = node:AddNode( "Node 2.3" )
    -- local cnode = node:AddNode( "Node 2.4" )
    -- local cnode = node:AddNode( "Node 2.5" )
    -- local gcnode = cnode:AddNode( "Node 2.5" )
    -- local cnode = node:AddNode( "Node 2.6" )
    -- local node = listview:AddNode( "Node Three ( Maps Folder )" )
    -- node:MakeFolder( "maps", "GAME", true )
    -- local node = listview:AddNode( "Node Four" )

    -- listview:AddColumn("Name")
    -- listview:AddColumn("Hallo")

    -- listview:AddLine("Hallo")
    
end



concommand.Add("TLib_test", TLib.FrameTest)