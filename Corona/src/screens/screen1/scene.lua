--------------------------------------------------------------------------------

local composer = require 'composer'
local _ = require 'cherry.libs.underscore'
local colorize = require 'cherry.libs.colorize'
local Button = require 'cherry.components.button'
local Text = require 'cherry.components.text'

--------------------------------------------------------------------------------

local scene = composer.newScene()

--------------------------------------------------------------------------------

function scene:create(event)
  self.bg = display.newRect(self.view, W / 2, H / 2, W, H)
  self.bg:setFillColor(colorize('#123'))

  self.title =
    Text:create(
    {
      parent = self.view,
      value = 'Screen1',
      x = W / 2,
      y = H / 5
    }
  )

  self.backButton =
    Button:create(
    {
      parent = self.view,
      bg = false,
      text = {
        value = 'back',
        fontSize = 90,
        color = App.colors.text
      },
      x = W / 2,
      y = H / 2,
      action = function()
        Router:open(App.screens.HOME)
      end
    }
  )
end

--------------------------------------------------------------------------------

function scene:resetView()
  self.bg.alpha = 1
  self.backButton.alpha = 1
end

--------------------------------------------------------------------------------

function scene:show(event)
  if (event.phase == 'did') then
    self:resetView()

    transition.from(
      self.backButton,
      {
        alpha = 0
      }
    )

    transition.from(
      self.bg,
      {
        alpha = 0
      }
    )
  end
end

--------------------------------------------------------------------------------

function scene:hide(event)
  if (event.phase == 'did') then
    transition.to(
      self.backButton,
      {
        alpha = 0
      }
    )

    transition.to(
      self.bg,
      {
        alpha = 0
      }
    )
  end
end

function scene:destroy(event)
end

--------------------------------------------------------------------------------

scene:addEventListener('create', scene)
scene:addEventListener('show', scene)
scene:addEventListener('hide', scene)
scene:addEventListener('destroy', scene)

--------------------------------------------------------------------------------

return scene
