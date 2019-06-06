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

-- quando rodar o banco ele irá selecionar um array de obras pelo titulo da Obra e salvará na variavel obras
-- da um ok 200 e devolve a lista de obras do banco
--
getObrasR :: Handler TypedContent
getObrasR = do 
    headers
    obras <- runDB $ selectList [] [Asc ObrasTitulo]
    sendStatusJSON ok200 (object ["obras" .= obras])


