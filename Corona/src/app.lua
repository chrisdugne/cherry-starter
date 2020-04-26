--------------------------------------------------------------------------------

local game = require 'src.extensions.game'

--------------------------------------------------------------------------------

App:start(
  {
    -----------------------------------------
    name = 'Startup demo',
    version = '0.0.1',
    -----------------------------------------
    -- 'production', 'development', 'editor'
    ENV = 'production',
    -----------------------------------------
    IOS_ID = '',
    ANALYTICS_TRACKING_ID = '',
    API_GATEWAY_URL = '',
    API_GATEWAY_KEY = '',
    -----------------------------------------
    showHeadphonesScreen = false,
    useNamePicker = true,
    -----------------------------------------
    background = {
      color = '#3a3f46'
    },
    screens = {
      HOME = 'home.scene'
    },
    colors = {
      text = '#ededed'
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
