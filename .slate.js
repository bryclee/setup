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

const downsize = slate.operation('move', {
    x: 'windowTopLeftX+(windowSizeX*0.05)',
    y: 'windowTopLeftY+(windowSizeY*0.05)',
    width: 'windowSizeX*0.9',
    height: 'windowSizeY*0.9'
});

const throwRight = slate.operation('throw', {
    screen: 'right'
});
const throwLeft = slate.operation('throw', {
    screen: 'left'
});

slate.bindAll({
    '[:ctrl,cmd': pushLeft,
    ']:ctrl,cmd': pushRight,
    '=:ctrl,cmd': maximize,
    '-:ctrl,cmd': downsize,

    '[:ctrl,cmd,alt': throwLeft,
    ']:ctrl,cmd,alt': throwRight,

    'g:ctrl,cmd': slate.operation('grid'),

    'r:ctrl,shift': slate.operation('relaunch')
});
