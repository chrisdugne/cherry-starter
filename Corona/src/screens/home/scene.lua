--------------------------------------------------------------------------------

local composer = require 'composer'
local _ = require 'cherry.libs.underscore'
local animation = require 'cherry.libs.animation'
local colorize = require 'cherry.libs.colorize'
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

  self.screen1Button =
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

  self.transversalBackRect =
    display.newRect(App.transversalBackLayer, 30, 30, W / 2, H / 3)
  self.transversalBackRect:setFillColor(colorize('#945'))
  self.transversalBackRect.anchorX = 0
  self.transversalBackRect.anchorY = 0

  self.currentViewRect = display.newRect(self.view, 60, 60, W / 2, H / 3)
  self.currentViewRect:setFillColor(colorize('#fd0'))
  self.currentViewRect.anchorX = 0
  self.currentViewRect.anchorY = 0

  self.transversalFrontRect =
    display.newRect(App.transversalFrontLayer, 90, 90, W / 2, H / 3)
  self.transversalFrontRect:setFillColor(colorize('#06f'))
  self.transversalFrontRect.anchorX = 0
  self.transversalFrontRect.anchorY = 0
end

--------------------------------------------------------------------------------

function scene:resetView()
  self.startButton.alpha = 1
  self.screen1Button.alpha = 1

  self.hudRect = display.newRect(App.hud, 120, 120, W / 2, H / 3)
  self.hudRect:setFillColor(colorize('#0b0'))
  self.hudRect.anchorX = 0
  self.hudRect.anchorY = 0
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
        delay = 150,
        alpha = 0
      }
    )

    transition.from(
      self.screen1Button,
      {
        delay = 300,
        alpha = 0
      }
    )

    transition.from(
      self.hudRect,
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
