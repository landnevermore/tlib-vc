/*---------------------------------------------------------------------------
	Three's Derma Lib
	Made by Threebow

	You are free to use this anywhere you like, or sell any addons
	made using this, as long as I am properly accredited.
---------------------------------------------------------------------------*/

/*---------------------------------------------------------------------------
	Constants
---------------------------------------------------------------------------*/
local blur = Material("pp/blurscreen")
local gradLeft = Material("vgui/gradient-l")
local gradUp = Material("vgui/gradient-u")
local gradRight = Material("vgui/gradient-r")
local gradDown = Material("vgui/gradient-d")


/*---------------------------------------------------------------------------
	Collection of various utilities
---------------------------------------------------------------------------*/
TDLibUtil = {}

//Beast's circle drawing function v2
TDLibUtil.DrawCircle = function(x, y, r, col)
    local circle = {}

    for i = 1, 360 do
        circle[i] = {}
        circle[i].x = x + math.cos(math.rad(i * 360) / 360) * r
        circle[i].y = y + math.sin(math.rad(i * 360) / 360) * r
    end

    surface.SetDrawColor(col)
    draw.NoTexture()
    surface.DrawPoly(circle)
end

TDLibUtil.DrawArc = function(x, y, ang, p, rad, color, seg)
	seg = seg || 80
    ang = (-ang) + 180
    local circle = {}

    table.insert(circle, {x = x, y = y})
    for i = 0, seg do
        local a = math.rad((i / seg) * -p + ang)
        table.insert(circle, {x = x + math.sin(a) * rad, y = y + math.cos(a) * rad})
    end

    surface.SetDrawColor(color)
    draw.NoTexture()
    surface.DrawPoly(circle)
end

TDLibUtil.LerpColor = function(frac, from, to)
	return Color(
		Lerp(frac, from.r, to.r),
		Lerp(frac, from.g, to.g),
		Lerp(frac, from.b, to.b),
		Lerp(frac, from.a, to.a)
	)
end

//Various handy premade transition functions
TDLibUtil.HoverFunc = function(s) return s:IsHovered() end
TDLibUtil.HoverFuncChild = function(s) return s:IsHovered() || s:IsChildHovered() end


/*---------------------------------------------------------------------------
	Circle function - credit to Beast
---------------------------------------------------------------------------*/
local function drawCircle(x, y, r)
	local circle = {}

	for i = 1, 360 do
		circle[i] = {}
		circle[i].x = x + math.cos(math.rad(i * 360) / 360) * r
		circle[i].y = y + math.sin(math.rad(i * 360) / 360) * r
	end

	surface.DrawPoly(circle)
end


/*---------------------------------------------------------------------------
	Basic helper classes
---------------------------------------------------------------------------*/
local classes = {}

classes.On = function(pnl, name, fn)
	name = pnl.AppendOverwrite || name

	local old = pnl[name]
	
	pnl[name] = function(s, ...)
		if(old) then old(s, ...) end
		fn(s, ...)
	end
end

classes.SetupTransition = function(pnl, name, speed, fn)
	fn = pnl.TransitionFunc || fn

	pnl[name] = 0
	pnl:On("Think", function(s)
		s[name] = Lerp(FrameTime()*speed, s[name], fn(s) && 1 || 0)
	end)
end


/*---------------------------------------------------------------------------
	Classes
---------------------------------------------------------------------------*/
classes.FadeHover = function(pnl, col, speed, rad)
	col = col || Color(255, 255, 255, 30)
	speed = speed || 6

	pnl:SetupTransition("FadeHover", speed, TDLibUtil.HoverFunc)
	pnl:On("Paint", function(s, w, h)
		local col = ColorAlpha(col, col.a*s.FadeHover)

		if(rad && rad > 0) then
			draw.RoundedBox(rad, 0, 0, w, h, col)
		else
			surface.SetDrawColor(col)
			surface.DrawRect(0, 0, w, h)
		end
	end)
end

classes.BarHover = function(pnl, col, height, speed, align)
	col = col || Color(255, 255, 255, 255)
	height = height || 2
	speed = speed || 6
	align = align || BOTTOM
		
	pnl:SetupTransition("BarHover", speed, TDLibUtil.HoverFunc)
	pnl:On("PaintOver", function(s, w, h)
		local barw = math.Round(w*s.BarHover)
		local barh = math.Round(h*s.BarHover)
		if (align == BOTTOM) then
			surface.SetDrawColor(col)
			surface.DrawRect(w/2-barw/2, h-height, barw, height)
		elseif (align == TOP) then
			surface.SetDrawColor(col)
			surface.DrawRect(w/2-barw/2, 0, barw, height)
		elseif (align == LEFT) then
			surface.SetDrawColor(col)
			surface.DrawRect(0, h/2-barh/2, height, barh)
		elseif (align == RIGHT) then
			surface.SetDrawColor(col)
			surface.DrawRect(w-height, h/2-barh/2, height, barh)
		end
	end)
end


classes.FillHover = function(pnl, col, dir, speed, mat)
	col = col || Color(255, 255, 255, 30)
	dir = dir || LEFT
	speed = speed || 8

	pnl:SetupTransition("FillHover", speed, TDLibUtil.HoverFunc)
	pnl:On("PaintOver", function(s, w, h)
		surface.SetDrawColor(col)

		local x, y, fw, fh
		if(dir == LEFT) then
			x, y, fw, fh = 0, 0, math.Round(w*s.FillHover), h
		elseif(dir == TOP) then
			x, y, fw, fh = 0, 0, w, math.Round(h*s.FillHover)
		elseif(dir == RIGHT) then
			local prog = math.Round(w*s.FillHover)
			x, y, fw, fh = w-prog, 0, prog, h
		elseif(dir == BOTTOM) then
			local prog = math.Round(h*s.FillHover)
			x, y, fw, fh = 0, h-prog, w, prog
		end

		if(mat) then
			surface.SetMaterial(mat)
			surface.DrawTexturedRect(x, y, fw, fh)
		else
			surface.DrawRect(x, y, fw, fh)
		end
	end)
end

classes.Background = function(pnl, col, rad, rtl, rtr, rbl, rbr)
	pnl:On("Paint", function(s, w, h)
		if(rad && rad > 0) then
			if(rtl != nil) then
				draw.RoundedBoxEx(rad, 0, 0, w, h, col, rtl, rtr, rbl, rbr)
			else
				draw.RoundedBox(rad, 0, 0, w, h, col)
			end
		else
			surface.SetDrawColor(col)
			surface.DrawRect(0, 0, w, h)
		end
	end)
end

classes.Material = function(pnl, mat, col)
	col = col || Color(255, 255, 255)

	pnl:On("Paint", function(s, w, h)
		surface.SetDrawColor(col)
		surface.SetMaterial(mat)
		surface.DrawTexturedRect(0, 0, w, h)
	end)
end

classes.TiledMaterial = function(pnl, mat, tw, th, col)
	col = col || Color(255, 255, 255, 255)

	pnl:On("Paint", function(s, w, h)
		surface.SetMaterial(mat)
		surface.SetDrawColor(col)
		surface.DrawTexturedRectUV(0, 0, w, h, 0, 0, w/tw, h/th)
	end)
end

classes.Outline = function(pnl, col, width)
	col = col || Color(255, 255, 255, 255)
	width = width || 1

	pnl:On("Paint", function(s, w, h)
		surface.SetDrawColor(col)
		
		for i=0, width-1 do
			surface.DrawOutlinedRect(0+i,0+i,w-i*2,h-i*2)
		end
	end)
end

classes.LinedCorners = function(pnl, col, len)
	col = col || Color(255, 255, 255, 255)
	len = len || 15

	pnl:On("Paint", function(s, w, h)
		surface.SetDrawColor(col)

		surface.DrawRect(0, 0, len, 1)
		surface.DrawRect(0, 1, 1, len-1)
		surface.DrawRect(w-len, h-1, len, 1)
		surface.DrawRect(w-1, h-len, 1, len-1)
	end)
end

classes.SideBlock = function(pnl, col, size, side)
	col = col || Color(255, 255, 255, 255)
	size = size || 3
	side = side || LEFT

	pnl:On("Paint", function(s, w, h)
		surface.SetDrawColor(col)
		
		if(side == LEFT) then
			surface.DrawRect(0, 0, size, h)
		elseif(side == TOP) then
			surface.DrawRect(0, 0, w, size)
		elseif(side == RIGHT) then
			surface.DrawRect(w-size, 0, size, h)
		elseif(side == BOTTOM) then
			surface.DrawRect(0, h-size, w, size)
		end
	end)
end

classes.Text = function(pnl, text, font, col, alignment, ox, oy, paint)
	font = font || "Trebuchet24"
	col = col || Color(255, 255, 255, 255)
	alignment = alignment || TEXT_ALIGN_CENTER
	ox = ox || 0
	oy = oy || 0

	if(!paint && pnl.SetText && pnl.SetFont && pnl.SetTextColor) then
		pnl:SetText(text)
		pnl:SetFont(font)
		pnl:SetTextColor(col)
	else
		pnl:On("Paint", function(s, w, h)
			local x = 0
			if(alignment == TEXT_ALIGN_CENTER) then
				x = w/2
			elseif(alignment == TEXT_ALIGN_RIGHT) then
				x = w
			end

			draw.SimpleText(text,font,x+ox,h/2+oy,col,alignment,TEXT_ALIGN_CENTER)
		end)
	end
end

classes.DualText = function(pnl, toptext, topfont, topcol, bottomtext, bottomfont, bottomcol, alignment, centerSpacing)
	topfont = topfont || "Trebuchet24"
	topcol = topcol || Color(0, 127, 255, 255)
	bottomfont = bottomfont || "Trebuchet18"
	bottomcol = bottomcol || Color(255, 255, 255, 255)
	alignment = alignment || TEXT_ALIGN_CENTER
	centerSpacing = centerSpacing || 0

	pnl:On("Paint", function(s, w, h)
		surface.SetFont(topfont)
		local tw, th = surface.GetTextSize(toptext)

		surface.SetFont(bottomfont)
		local bw, bh = surface.GetTextSize(bottomtext)

		local y1, y2 = h/2-bh/2, h/2+th/2

		local x
		if(alignment == TEXT_ALIGN_LEFT) then
			x = 0
		elseif(alignment == TEXT_ALIGN_CENTER) then
			x = w/2
		elseif(alignment == TEXT_ALIGN_RIGHT) then
			x = w
		end

		draw.SimpleText(toptext, topfont, x, y1+centerSpacing, topcol, alignment, TEXT_ALIGN_CENTER)
		draw.SimpleText(bottomtext, bottomfont, x, y2-centerSpacing, bottomcol, alignment, TEXT_ALIGN_CENTER)
	end)
end

classes.TripleText = function(pnl, toptext, topfont, topcol, midtext, midfont, midcol, bottomtext, bottomfont, bottomcol, alignment, centerSpacing)
	topfont = topfont || "Trebuchet24"
	topcol = topcol || Color(0, 127, 255, 255)
	midfont = midfont || "Trebuchet18"
	midcol = midcol || Color(255, 255, 255, 255)
	bottomfont = bottomfont || "Trebuchet18"
	bottomcol = bottomcol || Color(255, 255, 255, 255)
	alignment = alignment || TEXT_ALIGN_CENTER
	centerSpacing = centerSpacing || 0

	pnl:On("Paint", function(s, w, h)
		surface.SetFont(topfont)
		local tw, th = surface.GetTextSize(toptext)

		surface.SetFont(midfont)
		local mw, mh = surface.GetTextSize(midtext)

		surface.SetFont(bottomfont)
		local bw, bh = surface.GetTextSize(bottomtext)

		local y1, y2, y3 = h/2-bh/2-mh/2, h/2+th/2, h/2+bh/2+mh/2

		local x
		if(alignment == TEXT_ALIGN_LEFT) then
			x = 0
		elseif(alignment == TEXT_ALIGN_CENTER) then
			x = w/2
		elseif(alignment == TEXT_ALIGN_RIGHT) then
			x = w
		end

		draw.SimpleText(toptext, topfont, x, y1+centerSpacing, topcol, alignment, TEXT_ALIGN_CENTER)
		draw.SimpleText(midtext, midfont, x, y2-centerSpacing, midcol, alignment, TEXT_ALIGN_CENTER)
		draw.SimpleText(bottomtext, bottomfont, x, y3-centerSpacing, bottomcol, alignment, TEXT_ALIGN_CENTER)
	end)
end

classes.Blur = function(pnl, amount)
	pnl:On("Paint", function(s, w, h)
		local x, y = s:LocalToScreen(0, 0)
		local scrW, scrH = ScrW(), ScrH()

		surface.SetDrawColor(255, 255, 255)
		surface.SetMaterial(blur)

		for i = 1, 3 do
			blur:SetFloat("$blur", (i / 3) * (amount or 8))
			blur:Recompute()

			render.UpdateScreenEffectTexture()
			surface.DrawTexturedRect(x * -1, y * -1, scrW, scrH)
		end
	end)
end

classes.CircleClick = function(pnl, col, speed, trad)
	col = col || Color(255, 255, 255, 50)
	speed = speed || 5

	pnl.Rad, pnl.Alpha, pnl.ClickX, pnl.ClickY = 0, 0, 0, 0

	pnl:On("Paint", function(s, w, h)
		if(s.Alpha >= 1) then
			surface.SetDrawColor(ColorAlpha(col, s.Alpha))
			draw.NoTexture()
			drawCircle(s.ClickX, s.ClickY, s.Rad)
			s.Rad = Lerp(FrameTime()*speed, s.Rad, trad || w)
			s.Alpha = Lerp(FrameTime()*speed, s.Alpha, 0)
		end
	end)

	pnl:On("DoClick", function(s)
		s.ClickX, s.ClickY = s:CursorPos()
		s.Rad = 0
		s.Alpha = col.a
	end)
end

classes.CircleHover = function(pnl, col, speed, trad)
	col = col || Color(255, 255, 255, 30)
	speed = speed || 6

	pnl.LastX, pnl.LastY = 0, 0

	pnl:SetupTransition("CircleHover", speed, TDLibUtil.HoverFunc)
	pnl:On("Think", function(s)
		if(s:IsHovered()) then
			s.LastX, s.LastY = s:CursorPos()
		end
	end)

	pnl:On("PaintOver", function(s, w, h)
		draw.NoTexture()
		surface.SetDrawColor(ColorAlpha(col, col.a*s.CircleHover))
		drawCircle(s.LastX, s.LastY, s.CircleHover*(trad || w))
	end)
end


classes.CircleCheckbox = function(pnl, inner, outer, speed)
	inner = inner || Color(0, 255, 0, 255)
	outer = outer || Color(255, 255, 255, 255)
	speed = speed || 14

	pnl:SetupTransition("CircleCheckbox", speed, function(s) return s:GetChecked() end)
	pnl:On("Paint", function(s, w, h)
		draw.NoTexture()
		surface.SetDrawColor(outer)
		drawCircle(w/2, h/2, w/2-1)

		surface.SetDrawColor(inner)
		drawCircle(w/2, h/2, w*s.CircleCheckbox/2)
	end)
end


classes.Circle = function(pnl, col)
	col = col || Color(255, 255, 255, 255)

	pnl:On("Paint", function(s, w, h)
		draw.NoTexture()
		surface.SetDrawColor(col)
		drawCircle(w/2, h/2, math.min(w, h)/2)
	end)
end

classes.CircleFadeHover = function(pnl, col, speed)
	col = col || Color(255, 255, 255, 30)
	speed = speed || 6

	pnl:SetupTransition("CircleFadeHover", speed, TDLibUtil.HoverFunc)
	pnl:On("Paint", function(s, w, h)
		draw.NoTexture()
		surface.SetDrawColor(ColorAlpha(col, col.a*s.CircleFadeHover))
		drawCircle(w/2, h/2, math.min(w, h)/2)
	end)
end

classes.CircleExpandHover = function(pnl, col, speed)
	col = col || Color(255, 255, 255, 30)
	speed = speed || 6

	pnl:SetupTransition("CircleExpandHover", speed, TDLibUtil.HoverFunc)
	pnl:On("Paint", function(s, w, h)
		local rad = math.Round(w/2*s.CircleExpandHover)

		draw.NoTexture()
		surface.SetDrawColor(ColorAlpha(col, col.a*s.CircleExpandHover))
		drawCircle(w/2, h/2, rad)
	end)
end

classes.Gradient = function(pnl, col, dir, frac, op)
	dir = dir || BOTTOM
	frac = frac || 1

	pnl:On("Paint", function(s, w, h)
		surface.SetDrawColor(col)

		local x, y, gw, gh		
		if(dir == LEFT) then
			local prog = math.Round(w*frac)
			x, y, gw, gh = 0, 0, prog, h
			surface.SetMaterial(op && gradRight || gradLeft)
		elseif(dir == TOP) then
			local prog = math.Round(h*frac)
			x, y, gw, gh = 0, 0, w, prog
			surface.SetMaterial(op && gradDown || gradUp)
		elseif(dir == RIGHT) then
			local prog = math.Round(w*frac)
			x, y, gw, gh = w-prog, 0, prog, h
			surface.SetMaterial(op && gradLeft || gradRight)
		elseif(dir == BOTTOM) then
			local prog = math.Round(h*frac)
			x, y, gw, gh = 0, h-prog, w, prog
			surface.SetMaterial(op && gradUp || gradDown)
		end

		surface.DrawTexturedRect(x, y, gw, gh)
	end)
end



classes.FadeIn = function(pnl, time, alpha)
	time = time || 0.2
	alpha = alpha || 255

	pnl:SetAlpha(0)
	pnl:AlphaTo(alpha, time)
end

classes.SetTransitionFunc = function(pnl, fn)
	pnl.TransitionFunc = fn
end

classes.ClearTransitionFunc = function(pnl)
	pnl.TransitionFunc = nil
end

classes.SetAppendOverwrite = function(pnl, fn)
	pnl.AppendOverwrite = fn
end

classes.ClearAppendOverwrite = function(pnl)
	pnl.AppendOverwrite = nil
end

classes.ClearPaint = function(pnl)
	pnl.Paint = nil
end

classes.BorderStyle = function(pnl, borders, thick, col)
	col = col || Color(255, 0, 0, 255)
	thick = thick || 10
	borders = borders || {"top","left","right","bottom"}
	PrintTable(borders)
	pnl:On("PaintOver", function(s, w, h)
		for k,v in pairs(borders) do
			if v == "top" then
				surface.SetDrawColor(col)
				surface.DrawRect(0, 0, w, thick)
			end
			if v == "left" then
				surface.SetDrawColor(col)
				surface.DrawRect(0, 0, thick, h)
			end
			if v == "right" then
				surface.SetDrawColor(col)
				surface.DrawRect(w-thick, 0, thick, h)
			end
			if v == "bottom" then
				surface.SetDrawColor(col)
				surface.DrawRect(0, h-thick, w, thick)
			end
		end
	end)
end


/*---------------------------------------------------------------------------
	TDLib function which adds all the classes to your panel
---------------------------------------------------------------------------*/
local meta = FindMetaTable("Panel")

function meta:TDLib()
	self.Class = function(pnl, name, ...)
		local class = classes[name]
		assert(class, "[TDLib]: Class "..name.." does not exist.")

		class(pnl, ...)

		return pnl
	end

	for k, v in pairs(classes) do
		self[k] = function(s, ...) return s:Class(k, ...) end
	end

	return self
end

function TDLib(c, p, n)
	local pnl = vgui.Create(c, p, n)
	return pnl:TDLib()
end
