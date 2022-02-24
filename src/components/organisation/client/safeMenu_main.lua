--[[
  This file is part of FlashLand.
  Created at 19/02/2022 12:19
  
  Copyright (c) FlashLand - All Rights Reserved
  
  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]
---@author VibR1cY

local function checkPerm(permission)
    return (_FlashClient_Organisation.hasPermission(permission))
end

---@param player _Player
_FlashClient_Organisation_Safe.drawer[1] = function(player)
    RageUI.Separator(("Organisation : ~r~%s"):format(_FlashClient_Organisation_Safe.intraVars.label))
    RageUI.Line()
    RageUI.Button("Item(s)", nil, { RightLabel = "~r~→→" }, true, {}, _FlashClient_Organisation_Safe.getMenus()[2])
    RageUI.Button("Arme(s)", nil, { RightLabel = "~r~→→" }, true, {}, _FlashClient_Organisation_Safe.getMenus()[3])
end