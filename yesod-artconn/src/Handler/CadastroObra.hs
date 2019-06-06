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

-- verbo + nome da função
-- colocar o headers para liberar as requisições http
-- depois de inserir infos no front ele será o jsonbody e ele vai bater na tabela Obras pra verificar se esta tudo igual
-- oid variavel da obra inserida, vai rodar o banco e inserir essa obra dentro do banco
-- na ultima linha ele vai mandar um status json que foi criado e vai se tornar um array da obra inserida
postCadastroObraR :: Handler TypedContent 
postCadastroObraR = do
    headers
    obra <- requireJsonBody :: Handler Obras
    oid <- runDB $ insert obra
    sendStatusJSON created201 (object ["obra" .= oid])

-- ele vai rodar o banco e pegar o id das obras 
-- putstringln vai mostrar a obra e pack show é o pacote de mostrar do haskell
-- da um status 200 dizendo que ta tudo ok com a requisição
getObraR :: ObrasId -> Handler TypedContent
getObraR oid = do 
    headers
    obra <- runDB $ get404 oid
    putStrLn $ (pack.show) obra
    sendStatusJSON ok200 $ obra
    
-- pega o id da obra e ignora o resto
-- roda o banco e deleta essa obra selecionada
-- da um status 204 e não devolve nada, isso significa que for realmente deletado
deleteObraR :: ObrasId -> Handler TypedContent
deleteObraR oid = do 
    headers
    _ <- runDB $ get404 oid
    runDB $ delete oid
    sendStatusJSON noContent204 (object [])

-- depois de inserir infos no front de alteração ele será o jsonbody e ele vai devolver pra tabela Obras essa nova obra
-- vai rodar o banco e substituir a obra de acordo com o id dela
-- da um status 204 e não devolve nada, o get que devolve
putObraR :: ObrasId -> Handler TypedContent
putObraR oid = do 
    headers
    novaObra <- requireJsonBody :: Handler Obras
    runDB $ replace oid novaObra
    sendStatusJSON noContent204 (object [])