ancient_dragon_small_reflect = class({})
LinkLuaModifier("modifier_ancient_dragon_small_reflect", "creeps/abilities/npc_aa_creep_ancient_dragon_small/modifier_ancient_dragon_small_reflect", LUA_MODIFIER_MOTION_NONE)

function ancient_dragon_small_reflect:GetIntrinsicModifierName()
	return "modifier_ancient_dragon_small_reflect"
end