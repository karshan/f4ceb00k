{-# LANGUAGE OverloadedStrings #-}
module Main where

import Network.Wai
import Network.Wai.Handler.Warp
import Network.Wai.Application.Static

main :: IO ()
main =
    let port = 3001 in
    runSettings (setPort port $ setHost "127.0.0.1" defaultSettings) app

app :: Application
app = staticApp $ defaultWebAppSettings "webroot"
