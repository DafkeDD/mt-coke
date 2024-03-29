local QBCore = exports['qb-core']:GetCoreObject()

-- Criar item usavel para spawn da mesa
QBCore.Functions.CreateUseableItem('coke_table', function(source, item)
    TriggerClientEvent('mt-coke:client:ColocarMesa', source)
end)

-- Evento de processo
RegisterNetEvent('mt-coke:server:ProcessarCoke', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local coke_leaf = Player.Functions.GetItemByName('coke_leaf')
    local coke_empty_bags = Player.Functions.GetItemByName('coke_empty_bags')
    if coke_leaf ~= nil and coke_empty_bags ~= nil then

        if coke_leaf.amount >= 20 and coke_empty_bags.amount >= 30 then
            Player.Functions.RemoveItem('coke_leaf', 10)
            Player.Functions.RemoveItem('coke_empty_bags', 30)
            Player.Functions.AddItem('coke_bags', 30)
            TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['coke_bags'], "add")
            --QBCore.Functions.Notify('Cocaine processed!', 'success')
        else
            --QBCore.Functions.Notify('You do not have the rigth items!', 'error')
        end
    else
        --QBCore.Functions.Notify('you need atleast 30 Coke Empty Bags and 20 Coke Leafs!', 'error')
    end
end)

-- Apanhar coke
RegisterNetEvent('mt-coke:server:ApanharCoke', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    Player.Functions.AddItem('coke_leaf', 5)
end)