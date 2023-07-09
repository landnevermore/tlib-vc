local TLib = TLib or {}
local PANEL = {}

AccessorFunc( PANEL, "m_bBorder", "DrawBorder", FORCE_BOOL )
AccessorFunc(PANEL, "m_settext", "BackgroundColor")
AccessorFunc(PANEL, "m_setTall", "Tall")
AccessorFunc(PANEL, "m_placeholder", "Placeholder")
AccessorFunc(PANEL, "m_textColor", "TextColor")
AccessorFunc(PANEL, "m_placeholderColor", "PlaceholderColor")
AccessorFunc(PANEL, "m_sethovercolor", "HoverColor")

TLib.Font("ListView_button", 18) 


function PANEL:Init()

	self:SetContentAlignment( 5 )

	self:SetDrawBorder( true )
	self:SetPaintBackground( true )
	self:SetText("")
	self:SetTall( 80 )
	self:SetWide( 40 )
	self:DockMargin( 10, 0, 10, 5 )
	self:SetMouseInputEnabled( true )
	self:SetKeyboardInputEnabled( true )
	self:SetCursor( "hand" )
	self:SetFont( "TLib.Font.ListView_button" )
	self.titlebtn = ""
	self.colorbtn = TLib.Theme.button.mbutton
	self.setColor = color_white
	-- self:TDLib()
	-- self:CircleHover(TLib.Theme.accentalpha)
	-- self:CircleClick(color_white)

end

function PANEL:IsDown()

	return self.Depressed

end

function PANEL:SetImage( img )

	if ( !img ) then

		if ( IsValid( self.m_Image ) ) then
			self.m_Image:Remove()
		end

		return
	end

	if ( !IsValid( self.m_Image ) ) then
		self.m_Image = vgui.Create( "DImage", self )
	end

	self.m_Image:SetImage( img )
	self.m_Image:SizeToContents()
	self:InvalidateLayout()

end
PANEL.SetIcon = PANEL.SetImage

function PANEL:SetMaterial( mat )

	if ( !mat ) then

		if ( IsValid( self.m_Image ) ) then
			self.m_Image:Remove()
		end

		return
	end

	if ( !IsValid( self.m_Image ) ) then
		self.m_Image = vgui.Create( "DImage", self )
	end

	self.m_Image:SetMaterial( mat )
	self.m_Image:SizeToContents()
	self:InvalidateLayout()

end

function PANEL:SetName(text)
	self.titlebtn = text
end 

function PANEL:SetColor(color)
	self.colorbtn = color
end 

function PANEL:SetTextColor(color,text)
	self.btntextcol = textcol
end

function PANEL:SetHoverColor(color)
	self.HoverColor = color
end

function PANEL:Paint( w, h )
	-- draw.SimpleText(self.titlebtn, "TLib.ListView", w / 2, h / 2, TLib.Theme.button.mbutton, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	-- draw.RoundedBox( 0, 0, 0, w, h, self.colorbtn )
end

function PANEL:UpdateColours( skin )

	if ( !self:IsEnabled() )					then return self:SetTextStyleColor( Color(0,255,149) ) end
	if ( self:IsDown() || self.m_bSelected )	then return self:SetTextStyleColor( color_white ) end
	if ( self.Hovered )							then return self:SetTextStyleColor( TLib.Theme.accent ) end

	return self:SetTextStyleColor( TLib.Theme.text.h1 )

end

function PANEL:PerformLayout( w, h )

	if ( IsValid( self.m_Image ) ) then

		self.m_Image:SetPos( 4, ( self:GetTall() - self.m_Image:GetTall() ) * 0.5 )

		self:SetTextInset( self.m_Image:GetWide() + 16, 0 )

	end

	DLabel.PerformLayout( self, w, h )

end

function PANEL:SetConsoleCommand( strName, strArgs )

	self.DoClick = function( self, val )
		RunConsoleCommand( strName, strArgs )
	end

end

function PANEL:SizeToContents()
	local w, h = self:GetContentSize()
	self:SetSize( w + 8, h + 4 )
end

function PANEL:GenerateExample( ClassName, PropertySheet, Width, Height )

	local ctrl = vgui.Create( ClassName )
	ctrl:SetText( "Example Button" )
	ctrl:SetWide( 200 )

	PropertySheet:AddSheet( ClassName, ctrl, nil, true, true )

end

--local PANEL = derma.DefineControl( "TLib.Button", "Tee's Button", PANEL, "DLabel" )
vgui.Register("TLib.ListView_button", PANEL, "TLib.Label_internal")
