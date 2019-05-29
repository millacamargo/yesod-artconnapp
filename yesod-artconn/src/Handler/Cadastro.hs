{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE QuasiQuotes #-}
module Handler.Cadastro where

import Import
import Database.Persist.Postgresql
import Network.HTTP.Types
import Funcs

-- Options define as permissoes de acesso da sua aplicação.

optionsCadastroR :: Handler ()
optionsCadastroR = headers

postCadastroR :: Handler TypedContent
postCadastroR = do
    usuario <- requireJsonBody :: Handler Usuarios
    uid <- runDB $ insert usuario
    sendStatusJSON created201 (object ["resp" .=uid])
