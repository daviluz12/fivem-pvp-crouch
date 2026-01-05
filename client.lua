--[[
    Desenvolvido por: Daviluz12
    Descrição: Script de agachar focado em PvP (Fast Crouch, No-Prone, Auto-Stand on Shoot)
]]

-- CONFIGURAÇÕES --
local velocidadeAnimacao = 0.1 -- Tempo de transição (0.1 = Rápido/PvP | 0.5 = Suave/RP)
local delayParaLevantar = 0    -- Tempo (ms) para esperar antes de levantar ao atirar (0 = Instantâneo)

-- CÓDIGO --
local crouched = false

RegisterCommand('agachar', function()
    local ped = PlayerPedId()

    -- Bloqueios básicos (não agachar morto ou no carro)
    if IsEntityDead(ped) or IsPedInAnyVehicle(ped, false) then return end

    -- Carrega a animação de agachar
    local animSet = "move_ped_crouched"
    if not HasAnimSetLoaded(animSet) then
        RequestAnimSet(animSet)
        while not HasAnimSetLoaded(animSet) do
            Wait(10)
        end
    end

    crouched = not crouched

    if crouched then
        -- Define movimentação agachada
        SetPedMovementClipset(ped, animSet, velocidadeAnimacao)
        -- Define o modo de MIRAR agachado (Corrigido para não levantar ao mirar)
        SetPedStrafeClipset(ped, "move_ped_crouched_strafing")
    else
        -- Reseta com a mesma velocidade
        ResetPedMovementClipset(ped, velocidadeAnimacao)
        ResetPedStrafeClipset(ped)
    end
end)

-- Registra a tecla LCONTROL
RegisterKeyMapping('agachar', 'Agachar (PvP)', 'keyboard', 'LCONTROL')

-- Loop de controle e verificações
CreateThread(function()
    while true do
        Wait(0)
        -- Desativa o CTRL nativo do GTA (Stealth Mode)
        DisableControlAction(0, 36, true) 
        
        if crouched then 
            -- Auto-Levantar ao Atirar (Pop Shot)
            if IsPedShooting(PlayerPedId()) then
                if delayParaLevantar > 0 then
                    Wait(delayParaLevantar)
                end
                ExecuteCommand('agachar')
            end
        end
    end
end)