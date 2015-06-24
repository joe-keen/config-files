import XMonad 
import XMonad.ManageHook
import XMonad.Layout
import XMonad.Layout.ThreeColumns
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks

import qualified XMonad.StackSet as W

myManageHook = composeAll
    [ liftX (withWindowSet (return . W.currentTag)) =? "7" --> doFloat
    , className =? "MPlayer"                               --> doFloat
    , className =? "Gimp"                                  --> doFloat
    , className =? "wesnoth"                               --> doFloat]

myLayout = avoidStruts (ThreeCol 1 (3/100) (1/3) ||| 
           Full)
    where
        tiled   = Tall nmaster delta ratio
        nmaster = 1
        ratio   = 1/3
        delta   = 3/100

myLogHook = dynamicLogWithPP dzenPP

main = xmonad defaults

defaults = defaultConfig {
      -- simple stuff
        modMask            = mod3Mask,
        -- terminal           = "xterm +sb -fg white -bg black -fn -misc-*-medium-*-*-*-14-*-*-*-*-*-*-*",
        -- terminal           = "xterm +sb -fg Grey84 -bg Grey11 -fn -misc-*-medium-*-*-*-14-*-*-*-*-*-*-*",
        terminal           = "/home/jkeen/bin/launch_xterm",
        borderWidth        = 2,
        workspaces         = map show [0..9], -- ++ ["games","web"],
        normalBorderColor  = "#554c4c",
        focusedBorderColor = "#ffa800",
        manageHook         = myManageHook,
        layoutHook         = myLayout,
        logHook            = myLogHook

      -- hooks, layouts
      --  layoutHook         = myLayout,
      --  logHook            = myLogHook,
      --  startupHook        = myStartupHook
    }
