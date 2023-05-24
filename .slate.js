const APPS = {
  HYPER: {
    name: 'Hyper',
    launch: '/Applications/Hyper.app/Contents/MacOS/Hyper',
  },
  ITERM: {
    name: 'iTerm2',
    launch: '/Applications/iTerm.app/Contents/MacOS/iTerm2',
  },
  KITTY: {
    name: 'kitty',
    launch: '/Applications/Kitty.app/Contents/MacOS/kitty',
  },
  OUTLOOK_PWA: {
    name: 'Outlook (PWA)',
    launch:
      '/Users/bryalee/Applications/Edge\\ Apps.localized/Outlook\\ (PWA).app',
  },
  SLACK: {
    name: 'Slack',
    launch: '/Applications/Slack.app',
  },
  EDGE: {
    name: 'Microsoft Edge',
    launch: '/Applications/Microsoft\\ Edge.app',
  },
  TEAMS: {
    name: 'Microsoft Teams',
    launch: '/Applications/Microsoft\\ Teams.app',
  },
  LOGSEQ: {
    name: 'Logseq',
    launch: '/Applications/Logseq.app',
  },
}

const pushLeft = slate.operation('move', {
  x: 'screenOriginX',
  y: 'screenOriginY',
  width: 'screenSizeX/2',
  height: 'screenSizeY',
})
const pushRight = slate.operation('move', {
  x: 'screenOriginX+(screenSizeX/2)',
  y: 'screenOriginY',
  width: 'screenSizeX/2',
  height: 'screenSizeY',
})
const maximize = slate.operation('move', {
  x: 'screenOriginX',
  y: 'screenOriginY',
  width: 'screenSizeX',
  height: 'screenSizeY',
})

const pushHalfTop = slate.operation('move', {
  x: 'windowTopLeftX',
  y: 'screenOriginY',
  width: 'windowSizeX',
  height: 'screenSizeY/2',
})
const pushHalfBottom = slate.operation('move', {
  x: 'windowTopLeftX',
  y: 'screenOriginY+(screenSizeY/2)',
  width: 'windowSizeX',
  height: 'screenSizeY/2',
})

const downsize = slate.operation('move', {
  x: 'windowTopLeftX+(windowSizeX*0.05)',
  y: 'windowTopLeftY+(windowSizeY*0.05)',
  width: 'windowSizeX*0.9',
  height: 'windowSizeY*0.9',
})
const center = slate.operation('move', {
  x: 'screenOriginX+(screenSizeX*0.2)',
  y: 'screenOriginY+(screenSizeY*0.1)',
  width: 'screenSizeX*0.6',
  height: 'screenSizeY*0.8',
})

const throwRight = slate.operation('throw', {
  screen: 'right',
  x: 'screenOriginX',
  y: 'screenOriginY',
  width: 'min({windowSizeX,screenSizeX})',
  height: 'min({windowSizeY,screenSizeY})',
})
const throwLeft = slate.operation('throw', {
  screen: 'left',
  x: 'screenOriginX',
  y: 'screenOriginY',
  width: 'min({windowSizeX,screenSizeX})',
  height: 'min({windowSizeY,screenSizeY})',
})

const launchOrFocus = (app) => {
  return (win) => {
    const { name, launch } = app
    let termPresent = false

    slate.eachApp((app) => {
      if (app.name() === name) {
        termPresent = true
      }
    })

    if (!termPresent) {
      slate.shell(launch)
    } else {
      win.doOperation(
        slate.operation('focus', {
          app: name,
        })
      )
    }
  }
}

slate.bindAll({
  'h:alt,shift': pushLeft,
  'l:alt,shift': pushRight,
  '=:alt,shift': maximize,
  '-:alt,shift': downsize,
  'o:alt,shift': center,

  'j:alt,shift': pushHalfBottom,
  'k:alt,shift': pushHalfTop,

  'h:alt,shift,ctrl': throwLeft,
  'l:alt,shift,ctrl': throwRight,

  // App focus
  // Terminal
  't:alt,shift': launchOrFocus(APPS.ITERM),
  // Email
  'e:alt,shift': launchOrFocus(APPS.OUTLOOK_PWA),
  // Chat
  'c:alt,shift': launchOrFocus(APPS.SLACK),
  // Browser
  'b:alt,shift': launchOrFocus(APPS.EDGE),
  // Video
  'v:alt,shift': launchOrFocus(APPS.TEAMS),
  // Notes
  'q:alt,shift': launchOrFocus(APPS.LOGSEQ),

  'g:alt,shift': slate.operation('grid'),

  'r:alt,shift,ctrl': slate.operation('relaunch'),
})
