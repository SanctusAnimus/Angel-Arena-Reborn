modifier_bandoline_blade_cd = modifier_bandoline_blade_cd or class({})

local mod = modifier_bandoline_blade_cd

function mod:IsHidden()         return true  end
function mod:IsPurgable()       return false end
function mod:DestroyOnExpire()  return true end
function mod:IsPurgable()       return false end
function mod:IsPurgeException() return false end
