-- W.I.P

---
TLib.Chatbox = function()
    TLib.chatbox = vgui.Create("TLib.Frame")
    TLib.chatbox:SetSize(ScrW() * 0.3, ScrH() * 0.3)
    TLib.chatbox:SetTitle("Chat")
    TLib.chatbox:MakePopup()
    TLib.chatbox:Center()

    TLib.chatbox.chat = vgui.Create("RichText", TLib.chatbox)
    TLib.chatbox.chat:Dock(FILL)
    TLib.chatbox.chat:DockMargin(10, 10, 10, 10)
    TLib.chatbox.chat.Paint = function(self, w, h)
        draw.RoundedBox(0, 0, 0, w, h, TLib.Theme.outline)
    end

    TLib.entry = vgui.Create("TLib.TextEntry", TLib.chatbox)
    TLib.entry:Dock(BOTTOM)
    TLib.entry:DockMargin(10, 10, 10, 10)


end

concommand.Add("tlib_chatbox", TLib.Chatbox)