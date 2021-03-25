include("shared.lua")
surface.CreateFont( "A1", {
    font = "DermaDefault",
    size = 35,
    weight = 1000
} )
surface.CreateFont( "A2", {
    font = "DermaDefault",
    size = 30,
    weight = 1000
} )


function ENT:Draw()
	self:DrawModel()

		self:DrawInfo()

end

function ENT:DrawInfo()
	local Pos = self:GetPos() + self:GetUp() * 80
	Pos = Pos + self:GetUp() * math.abs(math.sin(CurTime()) * 5)
	local Ang = Angle(0, LocalPlayer():EyeAngles().y - 90, 90)
    local main = (255 - math.Clamp(self:GetPos():Distance(EyePos()), 0, 255 ))

	cam.Start3D2D(Pos, Ang, 0.1)
    surface.SetDrawColor( 0, 0, 0, main )
    surface.DrawRect( -150, 20, 300, 100 )
    surface.SetDrawColor(255,255,255,255)
    --draw.OutlinedBox( -150, 20, 300, 100, 5, Color( 0, 0, 0 ,main ) )
    draw.SimpleTextOutlined( "Käufer", "A1", 0, 30, Color(255, 216, 0,main), 1, 0 , 2,Color(0,0,0,main))
    draw.SimpleTextOutlined("", "A2", 0, 65, Color(255, 255, 255,main), 1, 0 , 2,Color(0,0,0,main))
	cam.End3D2D()
end

function ENT:DrawTranslucent()
	self:Draw()
end
