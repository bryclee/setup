const TERMINALS = {
    HYPER: {
        name: 'Hyper',
        launch: '/Applications/Hyper.app/Contents/MacOS/Hyper'
    },
    ITERM: {
        name: 'iTerm2',
        launch: '/Applications/iTerm.app/Contents/MacOS/iTerm2'
    }
};

const PREFERRED_TERMINAL = TERMINALS.ITERM;

const pushLeft = slate.operation('move', {
    x: 'screenOriginX',
    y: 'screenOriginY',
    width: 'screenSizeX/2',
    height: 'screenSizeY'
});
const pushRight = slate.operation('move', {
    x: 'screenOriginX+(screenSizeX/2)',
    y: 'screenOriginY',
    width: 'screenSizeX/2',
    height: 'screenSizeY'
});
const maximize = slate.operation('move', {
    x: 'screenOriginX',
    y: 'screenOriginY',
    width: 'screenSizeX',
    height: 'screenSizeY'
});

const pushHalfTop = slate.operation('move', {
    x: 'windowTopLeftX',
    y: 'screenOriginY',
    width: 'windowSizeX',
    height: 'screenSizeY/2'
});
const pushHalfBottom = slate.operation('move', {
    x: 'windowTopLeftX',
    y: 'screenOriginY+(screenSizeY/2)',
    width: 'windowSizeX',
    height: 'screenSizeY/2'
});

const downsize = slate.operation('move', {
    x: 'windowTopLeftX+(windowSizeX*0.05)',
    y: 'windowTopLeftY+(windowSizeY*0.05)',
    width: 'windowSizeX*0.9',
    height: 'windowSizeY*0.9'
});
const center = slate.operation('move', {
    x: 'screenOriginX+(screenSizeX*0.2)',
    y: 'screenOriginY+(screenSizeY*0.1)',
    width: 'screenSizeX*0.6',
    height: 'screenSizeY*0.8'
});

const throwRight = slate.operation('throw', {
    screen: 'right',
    x: 'screenOriginX',
    y: 'screenOriginY',
    width: 'min({windowSizeX,screenSizeX})',
    height: 'min({windowSizeY,screenSizeY})'

});
const throwLeft = slate.operation('throw', {
    screen: 'left',
    x: 'screenOriginX',
    y: 'screenOriginY',
    width: 'min({windowSizeX,screenSizeX})',
    height: 'min({windowSizeY,screenSizeY})'
});


const launchOrFocusTerm = win => {
    const { name, launch } = PREFERRED_TERMINAL;
    let termPresent = false;

    slate.eachApp(app => {
        if (app.name() === name) {
            termPresent = true;
        }
    });

    if (!termPresent) {
        slate.shell(launch);
    } else {
        win.doOperation(slate.operation('focus', {
            app: name
        }));
    }
};

slate.bindAll({
    'h:ctrl,cmd': pushLeft,
    'l:ctrl,cmd': pushRight,
    '=:ctrl,cmd': maximize,
    '-:ctrl,cmd': downsize,
    'o:ctrl,cmd': center,

    'j:ctrl,cmd': pushHalfBottom,
    'k:ctrl,cmd': pushHalfTop,

    'h:ctrl,cmd,alt': throwLeft,
    'l:ctrl,cmd,alt': throwRight,

    't:ctrl,cmd': launchOrFocusTerm,

    'g:ctrl,cmd': slate.operation('grid'),

    'r:ctrl,shift': slate.operation('relaunch')
});
