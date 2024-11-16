import XMonad
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run
import XMonad.Hooks.DynamicLog
import XMonad.Util.CustomKeys
import XMonad.Util.EZConfig

main = do
  xmproc <- spawnPipe "xmobar"
  xmonad $ def
    { terminal = "xterm"
    , manageHook = manageDocks <+> manageHook def
    , layoutHook = avoidStruts $ layoutHook def
    , logHook = dynamicLogWithPP $ def { ppOutput = hPutStrLn xmproc, ppOrder = \(ws:_:t:_) -> [ws,t] }
    , borderWidth = 3
    }
    `additionalKeys`
    [ ((mod1Mask, xK_p), spawn "exe=`dmenu_path | /home/biggie/.cabal/bin/yeganesh -- -b -fn xft:Inconsolata:size=16` && eval \"exec $exe\"") ]

