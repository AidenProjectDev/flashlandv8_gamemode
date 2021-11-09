--[[
  This file is part of FlashLand.
  Created at 09/11/2021 20:44
  
  Copyright (c) FlashLand - All Rights Reserved
  
  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]
---@author Pablo_1610

_FlashClient_Cache.items = function()
    return (_FlashClient_Cache.getCache("items"))
end

_FlashLand.onReceiveWithoutNet("loaded", function()
    _FlashLand.toServer("item:requestLightItems")
end)