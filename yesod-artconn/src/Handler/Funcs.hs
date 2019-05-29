module Funcs where

import Yesod
import Foundation

headers :: Handler ()
headers = do 
    addHeader "Access-Control-Allow-Origin" "*"
    addHeader "Access-Control-Allow-Methods" "*"
    addHeader "Access-Control-Allow-Headers" "*"