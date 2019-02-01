const HALF_WIDTH = 'screenSizeX/2'

const dockLeft = slate.operation('move', {
    x: 0,
    y: 0,
    width: 'screenSizeX/2',
    height: 'screenSizeY'
});
const dockRight = slate.operation('move', {
    x: 'screenSizeX/2',
    y: 0,
    width: 'screenSizeX/2',
    height: 'screenSizeY'
})
const dockTop = slate.operation('move', {
    x: 0,
    y: 0,
    width: 'screenSizeX',
    height: 'screenSizeY/2'
})
const dockBottom = slate.operation('move', {
    x: 0,
    y: 'screenSizeY/2',
    width: 'screenSizeX',
    height: 'screenSizeY/2'
})

slate.bindAll({
    'left:ctrl,cmd': dockLeft,
    'right:ctrl,cmd': dockRight,
    'up:ctrl,cmd': dockTop,
    'down:ctrl,cmd': dockBottom,
    'r:ctrl,cmd': slate.operation('relaunch')
});
