import Data.Monoid
import System.Exit
import System.IO(hPutStrLn)
import XMonad
import XMonad.Actions.CycleWS
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Layout.Accordion
import XMonad.Layout.Tabbed
import XMonad.Layout.Grid
import XMonad.Layout.Reflect
import XMonad.Util.Run(spawnPipe)

import qualified Data.Map        as Map
import qualified XMonad.StackSet as StackSet

myKeys conf@(XConfig {XMonad.modMask = modm}) = Map.fromList $
  [
    -- launch a terminal
    ((modm .|. shiftMask, xK_Return), spawn $ XMonad.terminal conf),
    -- launch dmenu
    -- ((modm .|. shiftMask, xK_p), spawn "exe=`dmenu_run` && eval \"exec $exe\""),
    ((modm .|. shiftMask, xK_p), spawn "~/.bin/dmenu_run"),

    -- close focused window
    ((modm .|. shiftMask, xK_c), kill),

    -- Rotate through the available layout algorithms
    ((modm, xK_space ), sendMessage NextLayout),
    --  Reset the layouts on the current workspace to default
    ((modm .|. shiftMask, xK_space), setLayout $ XMonad.layoutHook conf),

    -- Resize viewed windows to the correct size
    ((modm, xK_n), refresh),


    -- Move focus to the next window
    ((modm, xK_j), windows StackSet.focusDown),
    -- Move focus to the previous window
    ((modm, xK_k), windows StackSet.focusUp),

    -- Swap the focused window with the next window
    ((modm .|. shiftMask, xK_j), windows StackSet.swapDown),
    -- Swap the focused window with the previous window
    ((modm .|. shiftMask, xK_k), windows StackSet.swapUp),


    -- Go to the previous workspace
    ((modm, xK_h), prevWS),
    -- Go to the next workspace
    ((modm, xK_l), nextWS),

    -- Move to the previous workspace
    ((modm .|. shiftMask, xK_h), shiftToPrev >> prevWS),
    -- Move to the next workspace
    ((modm .|. shiftMask, xK_l), shiftToNext >> nextWS),

    -- Shrink the master area
    ((modm .|. controlMask .|. shiftMask, xK_h), sendMessage Shrink),
    -- Expand the master area
    ((modm .|. controlMask .|. shiftMask, xK_l), sendMessage Expand),


    -- Move focus to the master window
    ((modm, xK_m), windows StackSet.focusMaster),

    -- Swap the focused window and the master window
    ((modm, xK_Return), windows StackSet.swapMaster),

    -- Push window back into tiling
    ((modm, xK_t), withFocused $ windows . StackSet.sink),

    -- Increment the number of windows in the master area
    ((modm, xK_comma), sendMessage (IncMasterN 1)),

    -- Deincrement the number of windows in the master area
    ((modm, xK_period), sendMessage (IncMasterN (-1))),

    -- Toggle the status bar gap
    -- Use this binding with avoidStruts from Hooks.ManageDocks.
    -- See also the statusBar function from Hooks.DynamicLog.
    --
    -- ((modm              , xK_b     ), sendMessage ToggleStruts),
    -- Restart xmonad
    ((modm, xK_q), spawn "xmonad --recompile; xmonad --restart"),
    -- Quit xmonad
    ((modm .|. shiftMask, xK_q), io (exitWith ExitSuccess))
  ]
  ++

  --
  -- mod-[1..9], Switch to workspace N
  --
  -- mod-[1..9], Switch to workspace N
  -- mod-shift-[1..9], Move client to workspace N
  --
  [
    ((m .|. modm, k), windows $ f i)
      | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9],
        (f, m) <- [(StackSet.greedyView, 0), (StackSet.shift, shiftMask)]
  ]
  ++

  --
  -- mod-{w,e}, Switch to physical/Xinerama screens 1, 2
  -- mod-shift-{w,e}, Move client to screen 1, 2
  --
  [
    ((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
      | (key, sc) <- zip [xK_m, xK_n] [0..]
      , (f, m) <- [(StackSet.view, 0), (StackSet.shift, shiftMask)]
  ]


myMouseBindings (XConfig {XMonad.modMask = modm}) = Map.fromList $
  [
    -- mod-button1, Set the window to floating mode and move by dragging
    ((modm, button1), (\w -> focus w >> mouseMoveWindow w
                                     >> windows StackSet.shiftMaster)),
    -- mod-button2, Raise the window to the top of the stack
    ((modm, button2), (\w -> focus w >> windows StackSet.shiftMaster)),
    -- mod-button3, Set the window to floating mode and resize by dragging
    ((modm, button3), (\w -> focus w >> mouseResizeWindow w
                                     >> windows StackSet.shiftMaster))
    -- you may also bind events to the mouse scroll wheel (button4 and button5)
  ]

myLayout = tiled ||| reflectHoriz tiled ||| Mirror tiled ||| Grid ||| Accordion ||| Full ||| simpleTabbed
           where
             tiled = Tall tiledNmaster tiledDelta tiledRatio
             tiledNmaster = 1
             tiledDelta = 1/18
             tiledRatio = 2/3

main = do
  xmproc <- spawnPipe "/usr/bin/xmobar /home/tom/.xmonad/xmobarrc"
  xmonad defaultConfig {
  -- simple stuff
  terminal           = "~/.bin/terminal",
  focusFollowsMouse  = True,
  borderWidth        = 1,
  modMask            = mod1Mask,
  workspaces         = ["1:www", "2:dev", "3:term", "4:doc", "5:ops", "6:media", "7:mixed", "8:social", "9:scratch"],
  normalBorderColor  = "#666666",
  focusedBorderColor = "#336699",

  -- key bindings
  keys               = myKeys,
  mouseBindings      = myMouseBindings,

  -- hooks, layouts
  layoutHook = avoidStruts $ myLayout,

  manageHook = manageDocks <+> manageHook defaultConfig,

  logHook = dynamicLogWithPP $ xmobarPP { ppOutput  = hPutStrLn xmproc,
                                          ppCurrent = xmobarColor "#336699" "" . wrap "<" ">",
                                          ppTitle   = xmobarColor "#669933" "" . shorten 50 } }
