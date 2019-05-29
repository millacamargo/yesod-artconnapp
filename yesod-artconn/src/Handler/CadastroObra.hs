{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE QuasiQuotes #-}
module Handler.CadastroObra where

import Import
import Database.Persist.Postgresql

postCadastroObraR :: Handler TypedContent
postCadastroObraR = do
    obra <- requireJsonBody :: Handler CadastroObra
    oid <- runDB $ insert obra
    sendStatusJSON created201 (object ["resp" .= oid])
    
getCadastroObraR :: Handler TypedContent
getCadastroObraR = do 
    obras <- runDB $ selectList [] [Asc ObraNome]
    sendStatusJSON ok200 (object ["resp" .= obras])

