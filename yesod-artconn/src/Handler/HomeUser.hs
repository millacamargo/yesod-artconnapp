{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE QuasiQuotes #-}
module Handler.HomeUser where

import Import
import Database.Persist.Postgresql
import Network.HTTP.Types
import Funcs

optionsHomeUserR :: Handler ()
optionsHomeUserR = headers

getHomeUserR :: Handler TypedContent
getHomeUserR = do 
    obras <- runDB $ selectList [] [Asc ObrasNome]
    sendStatusJSON ok200 (object ["resp" .= obras])


