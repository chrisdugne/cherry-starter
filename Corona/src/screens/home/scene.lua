--------------------------------------------------------------------------------

local composer = require 'composer'
local _ = require 'cherry.libs.underscore'
local animation = require 'cherry.libs.animation'
local Button = require 'cherry.components.button'
local Options = require 'cherry.components.options'
local Text = require 'cherry.components.text'

--------------------------------------------------------------------------------

local scene = composer.newScene()

--------------------------------------------------------------------------------

local createButton = function(options)
  return Button:create(
    {
      parent = options.parent,
      bg = false,
      text = {
        value = options.text,
        fontSize = 90,
        color = App.colors.text
      },
      x = options.x,
      y = options.y,
      action = function()
        Router:open(options.screen)
      end
    }
  )
end

--------------------------------------------------------------------------------

function scene:create(event)
  Options:create(self.view)

  self.title =
    Text:create(
    {
      parent = self.view,
      value = 'Home',
      x = W / 2,
      y = H / 5
    }
  )

  self.startButton =
    createButton(
    {
      parent = self.view,
      text = 'Playground',
      x = W / 2,
      y = H / 2,
      screen = App.screens.PLAYGROUND
    }
  )

  self.startButton =
    createButton(
    {
      parent = self.view,
      text = 'Screen1',
      x = W / 2,
      y = H / 2 + 100,
      screen = App.screens.SCREEN1
    }
  )

  --------------------
end

--------------------------------------------------------------------------------

function scene:resetView()
  self.startButton.alpha = 1
end

--------------------------------------------------------------------------------

function scene:show(event)
  if (event.phase == 'did') then
    self:resetView()

    animation.bounce(Options.toggleActionsButton, {scaleTo = .7})
    animation.bounce(Options.leaderboardButton, {scaleTo = .7})

    transition.from(
      self.startButton,
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
      self.startButton,
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
