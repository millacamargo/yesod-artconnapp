{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE QuasiQuotes #-}
module Handler.CadastroObra where

import Import
import Database.Persist.Postgresql
import Network.HTTP.Types
import Funcs

optionsCadastroObraR :: Handler ()
optionsCadastroObraR = headers

postCadastroObraR :: Handler TypedContent
postCadastroObraR = do
    obra <- requireJsonBody :: Handler Obras
    oid <- runDB $ insert obra
    sendStatusJSON created201 (object ["resp" .= oid])
    
getCadastroObraR :: ObrasId -> Handler TypedContent
getCadastroObraR oid = do 
    obra <- runDB $ get404 oid
    sendStatusJSON ok200 (object ["resp" .= obra])
    
deleteCadastroObraR :: ObrasId -> Handler TypedContent
deleteCadastroObraR oid = do 
    _ <- runDB $ get404 oid
    runDB $ delete oid
    sendStatusJSON noContent204 (object [])

putCadastroObraR :: ObrasId -> Handler TypedContent
putCadastroObraR oid = do 
    novaObra <- requireJsonBody :: Handler HomeUser
    runDB $ replace oid novaObra
    sendStatusJSON noContent204 (object [])

