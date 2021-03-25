require('items/ranged_splash')

modifier_holy_book = modifier_holy_book or class({})

local mod = RangedSplashModifier:ApplyToModifier(modifier_holy_book)

function mod:IsHidden() 		return true  end
function mod:IsPurgable() 		return false end
function mod:DestroyOnExpire() 	return false end
function mod:IsPurgable() 		return false end
function mod:IsPurgeException() return false end

function mod:GetAttributes() return MODIFIER_ATTRIBUTE_PERMANENT + MODIFIER_ATTRIBUTE_MULTIPLE end

function mod:OnCreated(kv)
	local ability = self:GetAbility()

	if not ability then return end

	self.bonusDamage = ability:GetSpecialValueFor("bonus_damage")
	self.bonusInt    = ability:GetSpecialValueFor("bonus_int")
	self.bonusStr    = ability:GetSpecialValueFor("bonus_str")

	if not IsServer() then return end

	local splashDamage = ability:GetSpecialValueFor("splash_pct") / 100
	local splashRadius = ability:GetSpecialValueFor("splash_radius")

	self:Init(splashDamage, splashRadius)
end

mod.OnRefresh = mod.OnCreated

function mod:DeclareFunctions() return
{
	MODIFIER_PROPERTY_PREATTACK_BONUS_DAMAGE,
	MODIFIER_PROPERTY_STATS_STRENGTH_BONUS,
	MODIFIER_PROPERTY_STATS_INTELLECT_BONUS,
	MODIFIER_EVENT_ON_ATTACK_LANDED, -- RangedSplashModifier handle event automaticly if we dont handle it.
}
end

function mod:GetModifierPreAttack_BonusDamage()
	return self.bonusDamage
end

function mod:GetModifierBonusStats_Intellect()
	return self.bonusInt
end

function mod:GetModifierBonusStats_Strength()
	return self.bonusStr
end
