
TLib.preview = function()

    local frame = vgui.Create("TLib.Frame")
    frame:SetSize(ScrW() * 0.6, ScrH() * 0.6)
    frame:Center()
    frame:MakePopup()
    frame:SetTitle("TLib Preview")

    local scroll = vgui.Create("TLib.ScrollPanel", frame)
    scroll:Dock(FILL)

end


function TLib.CreatePreview(panel)
end

concommand.Add("TLib", TLib.preview)