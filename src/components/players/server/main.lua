--[[
  This file is part of FlashLand.
  Created at 25/10/2021 11:21
  
  Copyright (c) FlashLand - All Rights Reserved
  
  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]
---@author Pablo_1610

---@class _FlashServer_Players
_FlashServer_Players = {}

local list = {}

---@param player _Player
_FlashServer_Players.isNew = function(player)
    return (player.identity == nil)
end

_FlashServer_Players.exists = function(playerId)
    return (list[playerId] ~= nil)
end

_FlashServer_Players.get = function(playerId)
    if (not (_FlashServer_Players.exists(playerId))) then
        return nil
    end
    return (list[playerId])
end

---@param player _Player
_FlashServer_Players.add = function(player)
    list[player.sId] = player
end

_FlashServer_Players.remove = function(playerId)
    list[playerId] = nil
end

_FlashServer_Players.load = function(_src, cb)
    local identifier = _FlashServer_Utils.identifiers_get(_src, "license")
    _FlashServer_Database.query("SELECT * FROM flash_players WHERE identifier = @identifier", {["identifier"] = identifier}, function(result)
        if (result[1]) then
            cb(_Player(_src, result.flashId, result.identifier, result.rankId, result.identity, result.cash, result.skin, result.outfits, result.selectedOutfit, result.accessories))
        else
            cb(nil)
        end
    end)
end

_FlashLand.log("Chargement du composant: ^3players")