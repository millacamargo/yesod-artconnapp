{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE QuasiQuotes #-}
module Handler.Cadastro where

import Import
import Database.Persist.Postgresql

postCadastroR :: Handler TypedContent
postCadastroR = do
    cadastro <- requireJsonBody :: Handler Cadastro
    cid <- runDB $ insert cadastro
    sendStatusJSON created201 (object ["resp" .= cid])
