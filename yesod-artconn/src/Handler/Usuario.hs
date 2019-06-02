{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE QuasiQuotes #-}
module Handler.Usuario where

import Import
import Database.Persist.Postgresql
import Handler.Funcs

-- Options define as permissoes de acesso da sua aplicação.

optionsUsuarioR :: Handler ()
optionsUsuarioR = headers

postUsuarioR :: Handler TypedContent
postUsuarioR = do
    headers
    usuario <- requireJsonBody :: Handler Usuarios
    uid <- runDB $ insert usuario
    sendStatusJSON created201 (object ["usuarios" .=uid])
