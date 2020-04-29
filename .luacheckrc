stds.corona = {
  globals = {
    'application',
    math = {fields = {round = {}}},
    'settings'
  },
  read_globals = {
    'audio',
    'composer',
    'display',
    'easing',
    'graphics',
    'json',
    'native',
    'network',
    'Runtime',
    'system',
    'timer',
    'transition',
    'widget',
    'media'
  }
}

stds.cherry = {
  globals = {
    'App',
    'Camera',
    'Effects',
    'Game',
    'math',
    'Router',
    'Sound',
    'string',
    'table',
    'unpack',
    'W',
    'H'
  }
}

std = 'min+corona+cherry'
ignore = {'212'}
files['Corona/test/**/*.lua'].std = '+busted'
exclude_files = {}
