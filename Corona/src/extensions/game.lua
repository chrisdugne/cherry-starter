--------------------------------------------------------------------------------

local _ = require 'cherry.libs.underscore'
local colorize = require 'cherry.libs.colorize'
local Button = require 'cherry.components.button'
local Text = require 'cherry.components.text'
local showScore = require 'cherry.core.actions.show-score'

--------------------------------------------------------------------------------

local GameExtension = {}

--------------------------------------------------------------------------------

function GameExtension:initialState()
  return _.extend({})
end

function GameExtension:resetState()
  self.state = self:initialState()
end

function GameExtension:resetElements()
  if (self.elements.gameRect) then
    display.remove(self.elements.gameRect)
  end

  self.gameRect = display.newRect(App.hud, 220, 220, W / 2, H / 3)
  self.gameRect:setFillColor(colorize('#a00'))
  self.gameRect.anchorX = 0
  self.gameRect.anchorY = 0
end

--------------------------------------------------------------------------------

function GameExtension:onRun()
  Text:create(
    {
      parent = App.hud,
      x = W / 2,
      y = H / 2,
      value = 'Game is running',
      fontSize = 80,
      font = _G.FONTS.default,
      color = App.colors.text
    }
  )

  Button:create(
    {
      parent = App.hud,
      text = {
        value = 'back',
        fontSize = 50,
        color = App.colors.dark
      },
      x = W / 2,
      y = H * 0.8,
      action = function()
        Router:open(App.screens.HOME)
      end
    }
  )

  self.showScoreButton =
    Button:create(
    {
      parent = App.hud,
      text = {
        value = 'showScore',
        fontSize = 50,
        color = App.colors.dark
      },
      x = W / 2,
      y = H * 0.6,
      action = function()
        showScore()
        self:onShowScore()
      end
    }
  )

  self.cameraRect =
    display.newRect(App.game.camera, W * 0.1, H * 0.1, W * 0.8, H * 0.8)
  self.cameraRect:setFillColor(colorize('#e7e'))
  self.cameraRect.anchorX = 0
  self.cameraRect.anchorY = 0
end

--------------------------------------------------------------------------------

function GameExtension:onShowScore()
  display.remove(self.showScoreButton)
  self:removeCamera()
end

function GameExtension:onExit(noScore)
end

--------------------------------------------------------------------------------

return GameExtension
