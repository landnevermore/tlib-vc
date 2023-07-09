TLib.Font("Combo", 18)

local PANEL = {}

function PANEL:Init()

	self:SetFont( "TLib.Font.Combo" );
	self:SetTextColor( Color( 255, 255, 255 ) );
	self:SetContentAlignment( 5 );
    self:SetText("")
	

	local PAC = self.AddChoice

	self.AddChoice = function (s, val, data, select, icon)
		PAC( s, val, data, select, icon )

		surface.SetFont( "TLib.Font.Combo" )

		if ( #val > 13 ) then
			self:SetFont("TLib.Font.Combo")
		end

		return #self.Choices;

	end;

end;


function PANEL:ChooseOption( value, index )

	if ( self.Menu and !self.multiple ) then
		self.Menu:Remove();
		self.Menu = nil;
	end;

	if ( !self.multiple and value ) then
		self:SetText( value );
	end;

	self.selected = index;
	self:OnSelect(index, value, self.Data[index]);
	self.textCol = white;

	if (self.isChoice) then

		self.value = self:GetSelectedID() == 1;

	end;

end;

function PANEL:OpenMenu(pControlOpener)

	if ( pControlOpener && pControlOpener == self.TextEntry ) then
	
		return
	end

	if (#self.Choices == 0) then return end;

	if (IsValid(self.Menu)) then
		self.Menu:Remove();
		self.Menu = nil;
	end;

	local this = self;

	self.Menu = DermaMenu( false, self );

	function self.Menu:AddOption( strText, funcFunction )

        local pnl = vgui.Create( "DMenuOption", self );
        pnl:SetMenu( self );
        pnl:SetIsCheckable( true );

		if ( funcFunction ) then pnl.DoClick = funcFunction end

        function pnl:OnMouseReleased( mousecode )
            DButton.OnMouseReleased( self, mousecode )

            if ( self.m_MenuClicking && mousecode == MOUSE_LEFT ) then
                self.m_MenuClicking = false
            end

        end

        self:AddPanel(pnl)
        return pnl
    end

	for k, v in pairs( self.Choices ) do
		
		local option = self.Menu:AddOption( v, function() self:ChooseOption(v, k) end );

		function option:PerformLayout(w, h)
			self:SetTall(40);
		end;

		local this = self;
		

		option.Paint = function (self, w, h)

			local startalpha = 0
			local endalpha = 255
			local lerp = math.abs(math.sin(CurTime() * 0.7))
			local alpha = Lerp(lerp, startalpha, endalpha)


			surface.SetDrawColor( TLib.Theme.accentalpha )
			surface.DrawRect( 0, 0, w, h )

			if (self:IsHovered()) then
				surface.SetDrawColor( TLib.Theme.accent )
				surface.DrawRect( 0, 0, w, h )
			end;

			surface.SetDrawColor( TLib.Theme.accent )
			surface.DrawOutlinedRect( 0, 0, w, h )

			draw.SimpleText( v, "TLib.Font.Combo", w / 2, h / 2, (self:IsHovered() and TLib.Theme.text.h2 ) or color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER );
			
			return true;
		end
	end

	local x, y = self:LocalToScreen( 5, self:GetTall() )
	self.Menu:SetMinimumWidth( self:GetWide() - 19 )
	self.Menu:Open( x + 4, y - 1.5, false, self )
	self.Menu.Paint = nil

end

function PANEL:Paint(w, h)
    surface.SetDrawColor( TLib.Theme.outline )
    surface.DrawRect( 0, 0, w, h )

	if (self:IsHovered()) then

		TLib.HoverEffect(0,h - 2,w,h, 2)
	end;

	if  (self:IsMenuOpen()) then
		surface.SetDrawColor( TLib.Theme.accent )
		surface.DrawRect( 0, h - 2, w, 2 )
	end;
end;

vgui.Register("TLib.Combo", PANEL, "DComboBox");
