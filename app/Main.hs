{-# LANGUAGE OverloadedStrings #-}
module Main where

import Network.Wai
import Network.Wai.Handler.Warp
import Network.Wai.Application.Static
import Network.HTTP.Types
import Network.HTTP.Types.Header

main :: IO ()
main =
    let port = 3001 in
    runSettings (setPort port $ setHost "127.0.0.1" defaultSettings) app

app :: Application
app req f
    | pathInfo req == [] =
        f $ responseLBS status301 [(hLocation, "/index.html")] ""
    | otherwise = staticApp (defaultWebAppSettings "webroot") req f
