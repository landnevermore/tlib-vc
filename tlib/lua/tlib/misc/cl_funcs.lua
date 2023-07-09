function TLib.Font(name, size, font)
	surface.CreateFont("TLib.Font."..name, {font = font or "Montserrat Medium", size = size, weight = 500, antialias = true,})
end

surface.CreateFont("TLib.TestFont", {
    font = "Montserrat custom",
    size = 20,
    weight = 500,
    antialias = true,
})

----------------------------------------------------------------------------------------------------------------------!]]
--! Draw Functions
----------------------------------------------------------------------------------------------------------------------!]]

function TLib.HoverEffect(x,y,w,h)
	local startalpha = 0
	local endalpha = 255
	local lerp = math.abs(math.sin(CurTime() * 0.7))
	local alpha = Lerp(lerp, startalpha, endalpha)

	surface.SetDrawColor( Color(121,121,121,alpha) )
	surface.DrawRect(x, y, w, h)
end

function TLib.DrawCircle( x, y, radius, seg )
	local cir = {}

	table.insert( cir, { x = x, y = y, u = 0.5, v = 0.5 } )
	for i = 0, seg do
		local a = math.rad( ( i / seg ) * -360 )
		table.insert( cir, { x = x + math.sin( a ) * radius, y = y + math.cos( a ) * radius, u = math.sin( a ) / 2 + 0.5, v = math.cos( a ) / 2 + 0.5 } )
	end

	local a = math.rad( 0 )
	table.insert( cir, { x = x + math.sin( a ) * radius, y = y + math.cos( a ) * radius, u = math.sin( a ) / 2 + 0.5, v = math.cos( a ) / 2 + 0.5 } )

	surface.DrawPoly( cir )
end

function TLib.DrawOutline(x, y, w, h, thickness, color)
    surface.SetDrawColor(color or TLib.Theme.outline)
    surface.DrawOutlinedRect(x, y, w, h, thickness)
end

function TLib.DrawRect(x, y, w, h, color)
    surface.SetDrawColor(color or color_white)
    surface.DrawRect(x, y, w, h)
end

function TLib.DrawVignette(x, y, w, h)
    surface.SetDrawColor(255,255,255)
    surface.SetMaterial(Material("ticons/vignette.png"))
    surface.DrawTexturedRect(x, y, w, h)
end

function TLib.DrawSkin(x,y,w,h,thickness)
    surface.SetDrawColor(TLib.Theme.background)
    surface.DrawRect(x,y,w,h)

    surface.SetDrawColor(TLib.Theme.outline)
    surface.DrawOutlinedRect(x, y, w, h, thickness)
end

function TLib.DrawRoundedOutline(x,y,w,h,bgcol, outcol)
    draw.RoundedBox(8, x, y, w, h, bgcol or TLib.Theme.background)

    draw.RoundedBox(8, x+2, y+2, w-2*2, h-2*2, TLib.Theme.outline)
    draw.RoundedBox(8, x+2, y+2, w-2*2, h-2*2, outcol or TLib.Theme.outline)
end

function TLib.DrawHexagon(x, y, radius, color)
    local sides = 6
    local vertices = {}

    for i = 0, sides - 1 do
        local angle = math.pi * 2 * i / sides
        local vertex = {}
        vertex.x = x + math.cos(angle) * radius
        vertex.y = y + math.sin(angle) * radius
        table.insert(vertices, vertex)
    end

    surface.SetDrawColor(color or color_white) -- Set the color to white
    surface.DrawPoly(vertices)
end

function TLib.DrawBlur(panel, amount)
    local x, y = panel:LocalToScreen(0, 0)
    local scrW, scrH = ScrW(), ScrH()
    surface.SetDrawColor(255, 255, 255)
    surface.SetMaterial(Material("pp/blurscreen"))
    for i = 1, 3 do
        Material("pp/blurscreen"):SetFloat("$blur", (i / 3) * (amount or 6))
        Material("pp/blurscreen"):Recompute()
        render.UpdateScreenEffectTexture()
        surface.DrawTexturedRect(x * -1, y * -1, scrW, scrH)
    end
end

----------------------------------------------------------------------------------------------------------------------!]]
--! Helper Functions
----------------------------------------------------------------------------------------------------------------------!]]

function TLib.HextoRGB(hex)
    hex = hex:gsub("#","")
    return Color(tonumber("0x"..hex:sub(1,2)), tonumber("0x"..hex:sub(3,4)), tonumber("0x"..hex:sub(5,6)))
end

function TLib.RGBtoHex(color)
    return string.format("%02X%02X%02X", color.r, color.g, color.b)
end


function TLib.LerpColor(frac, from, to)
    local r = Lerp(frac, from.r, to.r)
    local g = Lerp(frac, from.g, to.g)
    local b = Lerp(frac, from.b, to.b)
    local a = Lerp(frac, from.a, to.a)

    return Color(r, g, b, a)
end

concommand.Add("getbodygroups", function()
 if not (LocalPlayer():IsAdmin()) then return end

    for k,v in pairs(LocalPlayer():GetBodyGroups()) do
        print("BG ID: "..v.id)
        print("BG Name: "..v.name)
        print("BG Num: "..v.num)
        print("------------------")
    end
end)