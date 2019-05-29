{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}
module Handler.Arquivo where

import Import
import Database.Persist.Postgresql
import Network.HTTP.Types
import Funcs

optionsArquivoR :: Handler ()
optionsArquivoR = headers
-- Field Settings deixa vc setar atributos em uma tag input.
-- Nesse caso, queremos soh jpg
-- FileInfo eh o tipo Arquivo.
formArquivo :: Form FileInfo
formArquivo = renderBootstrap $ areq fileField 
                           FieldSettings{fsId=Just "hident1",
                                         fsLabel="Arquivo: ",
                                         fsTooltip= Nothing,
                                         fsName= Nothing,
                                         fsAttrs=[("accept","image/jpeg")]} 
                           Nothing

getArquivoR :: ObraId -> Handler Html
getArquivoR oid = do 
    (widget,enctype) <- generateFormPost formArquivo
    defaultLayout $ do
        addStylesheet $ StaticR css_bootstrap_css
        [whamlet|
            <form action=@{ArquivoR oid} method=post id="arquivo" enctype=#{enctype}>
                ^{widget}
        |]

postArquivoR :: ObraId -> Handler Html 
postArquivoR oid = do 
    ((res,_),_) <- runFormPost formArquivo
    case res of 
        FormSuccess arq -> do 
            -- Adiciona um arquivo ao servidor. E pronto!
            -- fileName extrai o nome do arquivo
            -- Para mostrar em uma tag img o arquivo mandado,
            -- basta fazer <img src="static/img/imagem.jpg">
            -- Nao eh possivel usar StaticR, dado que, as imagens
            -- sao dinamicas e nao estaticas.
            -- liftIO troca de monada: IO por Handler
            -- fileMove envia, de fato, o arquivo ao servidor.
            liftIO $ fileMove arq ("static/imgs/" ++ (fromSqlKey oid))
            redirect HomeUserR
        _ -> redirect HomeUserR