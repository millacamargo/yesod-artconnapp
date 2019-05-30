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

optionsCadastroObraR :: ObrasId -> Handler ()
optionsCadastroObraR _ = headers

optionsCadastrodeObraR :: Handler ()
optionsCadastrodeObraR = headers

postCadastrodeObraR :: Handler TypedContent
postCadastrodeObraR = do
    obra <- requireJsonBody :: Handler Obras
    oid <- runDB $ insert obra
    sendStatusJSON created201 (object ["resp" .= oid])

data ObraGenero = ObraGenero {obra :: Obras, genero :: Generos} deriving Show

instance ToJSON ObraGenero where
    toJSON ObraGenero {..} = object
        [ "obra" .= obra
        , "obra" .= genero
        ]
-- (object ["obra" .= obra, genero])

getCadastroObraR :: ObrasId -> Handler TypedContent
getCadastroObraR oid = do 
    obra <- runDB $ get404 oid
    -- entityVal entityKey
    --let obraId = fmap (obrasGeneroId.entityVal) obra
    --genero <- runDB $ get404 obraId
    -- let obraGenero = ObraGenero obra genero
    putStrLn $ (pack.show) obra
    sendStatusJSON ok200 $ obra
    
deleteCadastroObraR :: ObrasId -> Handler TypedContent
deleteCadastroObraR oid = do 
    _ <- runDB $ get404 oid
    runDB $ delete oid
    sendStatusJSON noContent204 (object [])

putCadastroObraR :: ObrasId -> Handler TypedContent
putCadastroObraR oid = do 
    novaObra <- requireJsonBody :: Handler Obras
    runDB $ replace oid novaObra
    sendStatusJSON noContent204 (object [])

