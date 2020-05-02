--------------------------------------------------------------------------------

local game = require 'src.extensions.game'

--------------------------------------------------------------------------------

App.start(
  {
    -----------------------------------------
    name = 'Cherry Starter',
    version = '0.0.1',
    -----------------------------------------
    -- 'production', 'development', 'editor'
    ENV = 'production',
    -----------------------------------------
    showHeadphonesScreen = false,
    useNamePicker = true,
    -----------------------------------------
    background = {
      color = '#3a3f46'
    },
    screens = {
      HOME = 'home.scene',
      SCREEN1 = 'screen1.scene'
    },
    colors = {
      text = '#dd00dd'
    },
    globals = {},
    fonts = {
      default = 'cherry/assets/PatrickHand-Regular.ttf'
    },
    -----------------------------------------
    extension = {
      game = game
    }
  }
)
