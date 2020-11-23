--------------------------------------------------------------------------------

local env = require 'src.env'
local game = require 'src.extensions.game'

--------------------------------------------------------------------------------

App.start(
  {
    -----------------------------------------
    name = 'Cherry Starter',
    version = '0.0.1',
    -----------------------------------------
    env = env.DEVELOPMENT,
    -----------------------------------------
    showHeadphonesScreen = false,
    useNamePicker = true,
    -----------------------------------------
    extension = {
      game = game
    },
    -----------------------------------------
    screens = {
      HOME = 'home.scene',
      SCREEN1 = 'screen1.scene'
    },
    -----------------------------------------
    background = {
      color = '#3a3f46'
    },
    -----------------------------------------
    colors = {
      text = '#9e6e98'
    },
    fonts = {
      default = 'cherry/assets/PatrickHand-Regular.ttf'
    },
    -----------------------------------------
    ANY_GLOBAL_VAR = 'plop' -- access App.ANY_GLOBAL_VAR anywhere
    -----------------------------------------
  }
)
