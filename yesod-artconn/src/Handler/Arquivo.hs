{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}
module Handler.Arquivo where

import Import
import Database.Persist.Postgresql
import Handler.Funcs
import Handler.Obras

optionsArquivoR :: ObrasId -> Handler ()
optionsArquivoR _ = headers
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

getArquivoR :: ObrasId -> Handler Html
getArquivoR oid = do 
    headers
    (widget,enctype) <- generateFormPost formArquivo
    defaultLayout $ do
        addStylesheet $ StaticR css_bootstrap_css
        [whamlet|
            <form action=@{ArquivoR oid} method=post id="arquivo" enctype=#{enctype}>
                ^{widget}
        |]

postArquivoR :: ObrasId -> Handler Html 
postArquivoR oid = do 
    headers
    ((res,_),_) <- runFormPost formArquivo
    case res of 
        FormSuccess arq -> do 
            liftIO $ fileMove arq ("static/imgs/" ++ show (fromSqlKey oid))
            redirect ObrasR
        _ -> redirect ObrasR
        
    -- Adiciona um arquivo ao servidor. E pronto!
            -- fileName extrai o nome do arquivo
            -- Para mostrar em uma tag img o arquivo mandado,
            -- basta fazer <img src="static/img/imagem.jpg">
            -- Nao eh possivel usar StaticR, dado que, as imagens
            -- sao dinamicas e nao estaticas.
            -- liftIO troca de monada: IO por Handler
            -- fileMove envia, de fato, o arquivo ao servidor.