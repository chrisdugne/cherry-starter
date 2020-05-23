local _ = require 'cherry.libs.underscore'

local COMMON = {}

return {
  DEVELOPMENT = _.extend(
    {
      name = 'development',
      -- Cherry overrides
      SOUND_OFF = true
      -- Custom
      -- INVINCIBLE = true,
    },
    COMMON
  ),
  PRODUCTION = _.extend(
    {
      name = 'production'
      -- Cherry overrides
      -- Custom
    },
    COMMON
  )
}
