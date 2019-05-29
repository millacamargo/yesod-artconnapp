{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE QuasiQuotes #-}
module Handler.HomeUser where

import Import
import Database.Persist.Postgresql

getHomeUserR :: ObraId -> Handler TypedContent
getHomeUserR oid = do 
    obra <- runDB $ get404 oid
    sendStatusJSON ok200 (object ["resp" .= obra])

deleteHomeUserR :: ObraId -> Handler TypedContent
deleteHomeUserR oid = do 
    _ <- runDB $ get404 oid
    runDB $ delete oid
    sendStatusJSON noContent204 (object [])

putHomeUserR :: ObraId -> Handler TypedContent
putHomeUserR oid = do 
    novaObra <- requireJsonBody :: Handler HomeUser
    runDB $ replace oid novaObra
    sendStatusJSON noContent204 (object [])

