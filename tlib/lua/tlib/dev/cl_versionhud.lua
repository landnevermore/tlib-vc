TNRP = TNRP or {}
TNRP.Version = "dev"

hook.Add("HUDPaint", "TNRP::VERSION::HUD", function()
    if TLib.Config.Devmode == false then return end

    local x, y = ScrW() - 950, ScrH() - 1030

    draw.WordBox(5, x, y, "TitansRP ist in einer frühen Entwicklungsphase!", "ChatFont", TLib.Theme.background, TLib.Theme.red, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    draw.WordBox(5, x, y + 30, "Jegliches Visuelles kann und wird eventuell sich verändern!", "ChatFont", TLib.Theme.background, TLib.Theme.red, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

    draw.WordBox(5, ScrW() - 1915, ScrH() - 20, "Aktuelle Version: "..TNRP.Version, "ChatFont", TLib.Theme.background, TLib.Theme.red, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)

    -- draw.SimpleText("Achtung! TNRP ist in einer frühen Entwicklungsphase!", "ChatFont", x, y, TLib.Theme.red, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

    -- draw.SimpleText("Jegliches Visuelles kann und wird eventuell sich verändern!", "ChatFont", x, y + 30, TLib.Theme.red, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

    -- draw.SimpleText("Aktuelle Version: "..TNRP.Version, "ChatFont", ScrW() - 1825, ScrH() - 10, TLib.Theme.red, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)


end)