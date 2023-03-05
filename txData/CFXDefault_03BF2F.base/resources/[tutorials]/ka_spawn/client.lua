local spawnPos = vector3(686.245,577.950,130.461)

AddEventHandler('onClientGameTypeStart', function()
    function()
        exports.spawnmanager:setAutoSpawn(false)
        exports.spawnmanager:spawnPlayer({
            x = spawnPos.x,
            y = spawnPos.y,
            z = spawnPos.z,
            model = 'a_m_y_skater_01'
        }, function()
            TriggerEvent('chat:addMessage', {
                color = {255, 0, 0},
                multiline = true,
                args = {'Spawn', 'You have spawned at the skate park.'}
            })
        end)
    end)