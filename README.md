# 🔫 FiveM PvP Crouch (Standalone)

Um script leve e otimizado de agachar focado em PvP, removendo o delay das animações de RP e permitindo "Pop-shots".

A lightweight and optimized crouch script focused on PvP, removing RP animation delays and enabling "Pop-shots".

## 🚀 Features / Funcionalidades

- **Fast Crouch:** Transição instantânea ou suave (configurável).
- **PvP Strafe:** Mira continua agachada (não levanta ao mirar).
- **Pop-Shot:** O personagem levanta automaticamente ao atirar.
- **No-Prone:** Substitui o sistema de deitar no chão.
- **Standalone:** Funciona em Qbox, QBCore, ESX ou qualquer base.

## ⚙️ Configuration / Configuração

No arquivo `client.lua` você pode ajustar:

```lua
local velocidadeAnimacao = 0.1 -- 0.1 = Rápido (PvP) | 0.5 = Suave (RP)
local delayParaLevantar = 0    -- Delay em ms para levantar após o tiro
