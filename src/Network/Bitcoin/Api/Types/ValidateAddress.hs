{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell   #-}

module Network.Bitcoin.Api.Types.ValidateAddress where

import           Control.Applicative ((<$>))
import           Control.Lens.TH     (makeLenses)
import           Control.Monad       (mzero)

import           Data.Aeson

-- | Whether or not a bitcoin address is valid
--
--   For more detailed documentation of the fields, see:
--     https://bitcoin.org/en/developer-reference#listunspent
data ValidateAddress = ValidateAddress {
  
  -- | Whether the address is valid or not
  _isValid       :: Bool

  } deriving ( Show )

makeLenses ''ValidateAddress

instance FromJSON ValidateAddress where
  parseJSON (Object o) =
    ValidateAddress
      <$> o .:  "isvalid"

  parseJSON _          = mzero
