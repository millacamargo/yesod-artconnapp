{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE QuasiQuotes #-}
module Handler.Obras where

import Import
import Database.Persist.Postgresql
import Handler.Funcs

optionsObrasR :: Handler ()
optionsObrasR = headers

getObrasR :: Handler TypedContent
getObrasR = do 
    obras <- runDB $ selectList [] [Asc ObrasTitulo]
    sendStatusJSON ok200 (object ["obras" .= obras])


