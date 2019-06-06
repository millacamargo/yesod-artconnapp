{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE RecordWildCards   #-}
module Handler.CadastroObra where

import Import
import Database.Persist.Postgresql
import Handler.Funcs

optionsObraR :: ObrasId -> Handler ()
optionsObraR _ = headers

optionsCadastroObraR :: Handler ()
optionsCadastroObraR = headers

postCadastroObraR :: Handler TypedContent
postCadastroObraR = do
    headers
    obra <- requireJsonBody :: Handler Obras
    oid <- runDB $ insert obra
    sendStatusJSON created201 (object ["obra" .= oid])

getObraR :: ObrasId -> Handler TypedContent
getObraR oid = do 
    headers
    obra <- runDB $ get404 oid
    putStrLn $ (pack.show) obra
    sendStatusJSON ok200 $ obra
    
deleteObraR :: ObrasId -> Handler TypedContent
deleteObraR oid = do 
    headers
    _ <- runDB $ get404 oid
    runDB $ delete oid
    sendStatusJSON noContent204 (object [])

putObraR :: ObrasId -> Handler TypedContent
putObraR oid = do 
    headers
    novaObra <- requireJsonBody :: Handler Obras
    runDB $ replace oid novaObra
    sendStatusJSON noContent204 (object [])

