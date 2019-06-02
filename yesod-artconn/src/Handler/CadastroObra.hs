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

--data ObraGenero = ObraGenero {obra :: Obras, genero :: Generos} deriving Show

--instance ToJSON ObraGenero where
  --  toJSON ObraGenero {..} = object
    --    [ "obra" .= obra
      --  , "obra" .= genero
      --  ]
-- (object ["obra" .= obra, genero])

getObraR :: ObrasId -> Handler TypedContent
getObraR oid = do 
    headers
    obra <- runDB $ get404 oid
    -- entityVal entityKey
    --let obraId = fmap (obrasGeneroId.entityVal) obra
    --genero <- runDB $ get404 obraId
    -- let obraGenero = ObraGenero obra genero
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

