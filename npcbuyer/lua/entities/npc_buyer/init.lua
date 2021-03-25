AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

function ENT:SpawnFunction(ply, tr)
	if (not tr.Hit) then return end
	local SpawnPos = tr.HitPos + tr.HitNormal * 1
	local ent = ents.Create(self.ClassName)
	local angle = ply:GetAimVector():Angle()
	angle = Angle(0, angle.yaw, 0)
	angle:RotateAroundAxis(angle:Up(), 180)
	ent:SetAngles(angle)
	ent:SetPos(SpawnPos)
	ent:Spawn()
	ent:Activate()

	return ent
end

function ENT:Initialize()
	self:SetModel("models/Humans/Group03/male_07.mdl")

	self:SetSolid(SOLID_BBOX)
	self:SetHullSizeNormal()
	self:SetNPCState(NPC_STATE_SCRIPT)
	self:SetHullType(HULL_HUMAN)
	self:SetUseType(SIMPLE_USE)
    self:SetTrigger(true)
	self:SetMaxYawSpeed(90)
	self:CapabilitiesAdd(CAP_ANIMATEDFACE)
	self:CapabilitiesAdd(CAP_TURN_HEAD)
	self:DropToFloor()
	self:SetCollisionGroup(COLLISION_GROUP_WEAPON)
	local phys = self:GetPhysicsObject()

    if phys:IsValid() then
        phys:Wake()
    end
end


local items = {

	[1] = {
		name = "arbig",
		price = 10000
	},
	[2] = {
		name = "sent_ball",
		price = 10000
	}
}


function ENT:StartTouch(ent)

	for k, v in pairs(items) do

	if ent:GetClass() == v.name then
		ent:Remove()

		local ent = ents.Create("spawned_money")

     	if (  !IsValid( ent ) ) then return end

     	ent:SetPos( self:GetPos() + Vector(0, - 25, 0) )
	    ent.dt.amount = v.price
	    ent:Spawn()
	end

end
end 
