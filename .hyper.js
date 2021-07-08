// Future versions of Hyper may add additional config options,
// which will not automatically be merged into this file.
// See https://hyper.is#cfg for all currently supported options.

module.exports = {
  config: {
    // choose either `'stable'` for receiving highly polished,
    // or `'canary'` for less polished but more frequent updates
    updateChannel: 'stable',

    // default font size in pixels for all tabs
    fontSize: 13,

    // font family with optional fallbacks
    fontFamily: 'menlo, monaco, monospace',

    // default font weight: 'normal' or 'bold'
    fontWeight: 'normal',

    // font weight for bold characters: 'normal' or 'bold'
    fontWeightBold: 'bold',

    // line height as a relative unit
    lineHeight: 1,

    // letter spacing as a relative unit
    letterSpacing: 0,

    // terminal cursor background color and opacity (hex, rgb, hsl, hsv, hwb or cmyk)
    cursorColor: 'rgba(248,28,229,0.8)',

    // terminal text color under BLOCK cursor
    cursorAccentColor: '#000',

    // `'BEAM'` for |, `'UNDERLINE'` for _, `'BLOCK'` for █
    cursorShape: 'BLOCK',

    // set to `true` (without backticks and without quotes) for blinking cursor
    cursorBlink: false,

    // color of the text
    foregroundColor: '#fff',

    // terminal background color
    // opacity is only supported on macOS
    backgroundColor: '#000',

    // terminal selection color
    selectionColor: 'rgba(248,28,229,0.3)',

    // border color (window, tabs)
    borderColor: '#333',

    // custom CSS to embed in the main window
    css: `
            // Dim the inactive pane
            .term_term {
                opacity: 0.6;
            }
            .term_active .term_term {
                opacity: 1;
            }
        `,

    // custom CSS to embed in the terminal window
    termCSS: '',

    // if you're using a Linux setup which show native menus, set to false
    // default: `true` on Linux, `true` on Windows, ignored on macOS
    showHamburgerMenu: '',

    // set to `false` (without backticks and without quotes) if you want to hide the minimize, maximize and close buttons
    // additionally, set to `'left'` if you want them on the left, like in Ubuntu
    // default: `true` (without backticks and without quotes) on Windows and Linux, ignored on macOS
    showWindowControls: '',

    // custom padding (CSS format, i.e.: `top right bottom left`)
    padding: '5px 5px',

    // the full list. if you're going to provide the full color palette,
    // including the 6 x 6 color cubes and the grayscale map, just provide
    // an array here instead of a color map object
    colors: {
      black: '#000000',
      red: '#C51E14',
      green: '#1DC121',
      yellow: '#C7C329',
      blue: '#0A2FC4',
      magenta: '#C839C5',
      cyan: '#20C5C6',
      white: '#C7C7C7',
      lightBlack: '#686868',
      lightRed: '#FD6F6B',
      lightGreen: '#67F86F',
      lightYellow: '#FFFA72',
      lightBlue: '#6A76FB',
      lightMagenta: '#FD7CFC',
      lightCyan: '#68FDFE',
      lightWhite: '#FFFFFF',
    },

    // the shell to run when spawning a new session (i.e. /usr/local/bin/fish)
    // if left empty, your system's login shell will be used by default
    //
    // Windows
    // - Make sure to use a full path if the binary name doesn't work
    // - Remove `--login` in shellArgs
    //
    // Bash on Windows
    // - Example: `C:\\Windows\\System32\\bash.exe`
    //
    // PowerShell on Windows
    // - Example: `C:\\WINDOWS\\System32\\WindowsPowerShell\\v1.0\\powershell.exe`
    shell: '',

    // for setting shell arguments (i.e. for using interactive shellArgs: `['-i']`)
    // by default `['--login']` will be used
    shellArgs: ['--login'],

    // for environment variables
    env: {},

    // set to `false` for no bell
    bell: false,

    // if `true` (without backticks and without quotes), selected text will automatically be copied to the clipboard
    copyOnSelect: false,

    // if `true` (without backticks and without quotes), hyper will be set as the default protocol client for SSH
    defaultSSHApp: true,

    // if `true` (without backticks and without quotes), on right click selected text will be copied or pasted if no
    // selection is present (`true` by default on Windows and disables the context menu feature)
    // quickEdit: true,

    // URL to custom bell
    // bellSoundURL: 'http://example.com/bell.mp3',

    // for advanced config flags please refer to https://hyper.is/#cfg
  },

  // a list of plugins to fetch and install from npm
  // format: [@org/]project[#version]
  // examples:
  //   `hyperpower`
  //   `@company/project`
  //   `project#1.0.1`
  plugins: [
    'hyperminimal',
    // 'hyper-loved',
    // 'hyper-one-light',
    // 'hyper-polarbear',
  ],

  // in development, you can create a directory under
  // `~/.hyper_plugins/local/` and include it here
  // to load it and avoid it being `npm install`ed
  localPlugins: [],

  keymaps: {
    // Example
    // 'window:devtools': 'cmd+alt+o',
  },
};

/**
 * Tweaked Colorscheme
 */
const mainColor = '#67dee4';
const backgroundColor = '#E7F1F4';
const foregroundColor = '#013733';

const borderColor = mainColor;
const cursorColor = mainColor;

const padding = '0px 0px 3px 6px';

const cursorShape = 'BLOCK';
const colors = {
  // Colors
  black: foregroundColor,
  white: '#FFFFFF',
  red: '#f75f5e',
  green: '#06b560',
  blue: '#01629d',
  cyan: '#13b4cb',
  yellow: '#f0b94b',
  magenta: '#8032d8',
  white: '#d5e4e4',

  // Light Colors
  lightBlack: foregroundColor,
  lightRed: '#f75f5e',
  lightGreen: '#06c580',
  lightYellow: '#ffc069',
  lightBlue: '#01629d',
  lightMagenta: '#8032d8',
  lightCyan: '#13b4cb',
  lightWhite: '#d5e4e4',
};

module.exports.config = {
  ...module.exports.config,
  padding,
  backgroundColor,
  foregroundColor,
  borderColor,
  cursorColor,
  cursorShape,
  colors,
  // CSS setting
  css: `
      ${module.exports.config.css || ''}
      * {
        text-rendering: optimizeLegibility;
        font-weight: 500;
      }
      .hyper_main {
        border: solid 2px ${mainColor};
      }
      .tabs_nav {
        background-color: #cfe7ed;
      }
      .tab_tab {
        color: #8e9191;
        background-color:#cfe7ed;
        border-color: ${borderColor};
      }
      .tab_tab:before {
        border: 0;
      }
      .tab_tab.tab_active {
        border: transparent;
        font-weight: bold;
        color: ${foregroundColor};
        background-color: ${backgroundColor};
        .tab_textInner, .tab_icon {
        svg {
            fill: ${foregroundColor} !important;
          }
        }
      }
      .tab_textInner, .tab_icon, .tabs_title {
        svg {
          fill: #8e9191 !important;
        }
      }
    `,
};
