{-# OPTIONS_GHC -w #-}
{-# OPTIONS -XMagicHash -XBangPatterns -XTypeSynonymInstances -XFlexibleInstances -cpp #-}
#if __GLASGOW_HASKELL__ >= 710
{-# OPTIONS_GHC -XPartialTypeSignatures #-}
#endif
{-# OPTIONS_GHC -fno-warn-incomplete-patterns -fno-warn-overlapping-patterns #-}
module Core.Par
  ( happyError
  , myLexer
  , pExp1
  , pExp3
  , pExp
  , pExp2
  , pDecl
  , pPatt
  , pPatt1
  , pSummand
  , pListSummand
  , pBranch
  , pListBranch
  , pListIdent
  ) where
import qualified Core.Abs
import Core.Lex
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import qualified GHC.Exts as Happy_GHC_Exts
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.20.0

newtype HappyAbsSyn  = HappyAbsSyn HappyAny
#if __GLASGOW_HASKELL__ >= 607
type HappyAny = Happy_GHC_Exts.Any
#else
type HappyAny = forall a . a
#endif
newtype HappyWrap15 = HappyWrap15 (Core.Abs.Ident)
happyIn15 :: (Core.Abs.Ident) -> (HappyAbsSyn )
happyIn15 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap15 x)
{-# INLINE happyIn15 #-}
happyOut15 :: (HappyAbsSyn ) -> HappyWrap15
happyOut15 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut15 #-}
newtype HappyWrap16 = HappyWrap16 (Core.Abs.CaseTk)
happyIn16 :: (Core.Abs.CaseTk) -> (HappyAbsSyn )
happyIn16 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap16 x)
{-# INLINE happyIn16 #-}
happyOut16 :: (HappyAbsSyn ) -> HappyWrap16
happyOut16 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut16 #-}
newtype HappyWrap17 = HappyWrap17 (Core.Abs.DataTk)
happyIn17 :: (Core.Abs.DataTk) -> (HappyAbsSyn )
happyIn17 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap17 x)
{-# INLINE happyIn17 #-}
happyOut17 :: (HappyAbsSyn ) -> HappyWrap17
happyOut17 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut17 #-}
newtype HappyWrap18 = HappyWrap18 (Core.Abs.Exp)
happyIn18 :: (Core.Abs.Exp) -> (HappyAbsSyn )
happyIn18 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap18 x)
{-# INLINE happyIn18 #-}
happyOut18 :: (HappyAbsSyn ) -> HappyWrap18
happyOut18 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut18 #-}
newtype HappyWrap19 = HappyWrap19 (Core.Abs.Exp)
happyIn19 :: (Core.Abs.Exp) -> (HappyAbsSyn )
happyIn19 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap19 x)
{-# INLINE happyIn19 #-}
happyOut19 :: (HappyAbsSyn ) -> HappyWrap19
happyOut19 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut19 #-}
newtype HappyWrap20 = HappyWrap20 (Core.Abs.Exp)
happyIn20 :: (Core.Abs.Exp) -> (HappyAbsSyn )
happyIn20 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap20 x)
{-# INLINE happyIn20 #-}
happyOut20 :: (HappyAbsSyn ) -> HappyWrap20
happyOut20 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut20 #-}
newtype HappyWrap21 = HappyWrap21 (Core.Abs.Exp)
happyIn21 :: (Core.Abs.Exp) -> (HappyAbsSyn )
happyIn21 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap21 x)
{-# INLINE happyIn21 #-}
happyOut21 :: (HappyAbsSyn ) -> HappyWrap21
happyOut21 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut21 #-}
newtype HappyWrap22 = HappyWrap22 (Core.Abs.Decl)
happyIn22 :: (Core.Abs.Decl) -> (HappyAbsSyn )
happyIn22 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap22 x)
{-# INLINE happyIn22 #-}
happyOut22 :: (HappyAbsSyn ) -> HappyWrap22
happyOut22 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut22 #-}
newtype HappyWrap23 = HappyWrap23 (Core.Abs.Patt)
happyIn23 :: (Core.Abs.Patt) -> (HappyAbsSyn )
happyIn23 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap23 x)
{-# INLINE happyIn23 #-}
happyOut23 :: (HappyAbsSyn ) -> HappyWrap23
happyOut23 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut23 #-}
newtype HappyWrap24 = HappyWrap24 (Core.Abs.Patt)
happyIn24 :: (Core.Abs.Patt) -> (HappyAbsSyn )
happyIn24 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap24 x)
{-# INLINE happyIn24 #-}
happyOut24 :: (HappyAbsSyn ) -> HappyWrap24
happyOut24 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut24 #-}
newtype HappyWrap25 = HappyWrap25 (Core.Abs.Summand)
happyIn25 :: (Core.Abs.Summand) -> (HappyAbsSyn )
happyIn25 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap25 x)
{-# INLINE happyIn25 #-}
happyOut25 :: (HappyAbsSyn ) -> HappyWrap25
happyOut25 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut25 #-}
newtype HappyWrap26 = HappyWrap26 ([Core.Abs.Summand])
happyIn26 :: ([Core.Abs.Summand]) -> (HappyAbsSyn )
happyIn26 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap26 x)
{-# INLINE happyIn26 #-}
happyOut26 :: (HappyAbsSyn ) -> HappyWrap26
happyOut26 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut26 #-}
newtype HappyWrap27 = HappyWrap27 (Core.Abs.Branch)
happyIn27 :: (Core.Abs.Branch) -> (HappyAbsSyn )
happyIn27 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap27 x)
{-# INLINE happyIn27 #-}
happyOut27 :: (HappyAbsSyn ) -> HappyWrap27
happyOut27 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut27 #-}
newtype HappyWrap28 = HappyWrap28 ([Core.Abs.Branch])
happyIn28 :: ([Core.Abs.Branch]) -> (HappyAbsSyn )
happyIn28 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap28 x)
{-# INLINE happyIn28 #-}
happyOut28 :: (HappyAbsSyn ) -> HappyWrap28
happyOut28 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut28 #-}
newtype HappyWrap29 = HappyWrap29 ([Core.Abs.Ident])
happyIn29 :: ([Core.Abs.Ident]) -> (HappyAbsSyn )
happyIn29 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap29 x)
{-# INLINE happyIn29 #-}
happyOut29 :: (HappyAbsSyn ) -> HappyWrap29
happyOut29 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut29 #-}
happyInTok :: (Token) -> (HappyAbsSyn )
happyInTok x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyInTok #-}
happyOutTok :: (HappyAbsSyn ) -> (Token)
happyOutTok x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOutTok #-}


happyExpList :: HappyAddr
happyExpList = HappyA# "\x00\x00\x00\x60\xc0\xf8\xed\x00\x00\x00\x80\x80\x91\x41\x00\x00\x00\x80\x01\xe3\xb7\x03\x00\x00\x00\x03\x46\x06\x01\x00\x00\x00\x00\x00\xc0\x00\x00\x00\x00\x08\x00\x40\x04\x00\x00\x00\x10\x00\x80\x08\x00\x00\x00\x00\x00\x00\x10\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00\x00\x00\x00\x40\x00\x00\x00\x00\x00\x00\x80\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x08\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x04\x8c\x0c\x02\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x88\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x40\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x20\x00\x00\x11\x00\x00\x00\x40\x00\x00\x22\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xc0\x00\x00\x00\x00\x00\x00\x02\x46\x06\x01\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x0c\x18\xbf\x1d\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00\x00\x00\x00\x40\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xa0\x62\x64\x10\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x80\x00\x00\x44\x00\x00\x00\x00\x01\x00\x88\x00\x00\x00\x00\x02\x00\x10\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x0c\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00\x00\x00\x00\x00\x08\x00\x00\x00\x00\x00\x00\x10\x00\x00\x00\x00\x00\x0c\x18\xbf\x1d\x00\x00\x00\x00\x0c\x00\x00\x00\x00\x00\x30\x60\xfc\x76\x00\x00\x00\x60\xc0\xf8\xed\x00\x00\x00\xc0\x80\xf1\xdb\x01\x00\x00\x00\x00\x00\x80\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x08\x00\x00\x00\x00\x00\x00\x08\x18\x19\x04\x00\x00\x00\x00\x40\x00\x00\x00\x00\x00\x00\x80\x00\x00\x00\x00\x00\x40\x00\x00\x22\x00\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00\x00\x00\x80\x00\x00\x00\x00\x80\x01\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x0c\x18\xbf\x1d\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x06\x8c\xdf\x0e\x00\x00\x00\x0c\x18\xbf\x1d\x00\x00\x00\x00\x0c\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x80\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x18\x30\x7e\x3b\x00\x00\x00\x30\x60\xfc\x76\x00\x00\x00\x60\xc0\xf8\xed\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00\x00\x00\x00\x40\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x60\xc0\xf8\xed\x00\x00\x00\xc0\x80\xf1\xdb\x01\x00\x00\x80\x01\xe3\xb7\x03\x00\x00\x00\x03\xc6\x6f\x07\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00"#

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_pExp1","%start_pExp3","%start_pExp","%start_pExp2","%start_pDecl","%start_pPatt","%start_pPatt1","%start_pSummand","%start_pListSummand","%start_pBranch","%start_pListBranch","%start_pListIdent","Ident","CaseTk","DataTk","Exp1","Exp3","Exp","Exp2","Decl","Patt","Patt1","Summand","ListSummand","Branch","ListBranch","ListIdent","'$'","'('","')'","'*'","','","'->'","'.'","'.1'","'.2'","'0'","'1'","':'","';'","'='","'PN'","'Pi'","'Sig'","'U'","'Void'","'\\\\'","'_'","'let'","'letrec'","'|'","L_Ident","L_CaseTk","L_DataTk","%eof"]
        bit_start = st Prelude.* 57
        bit_end = (st Prelude.+ 1) Prelude.* 57
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..56]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

happyActOffsets :: HappyAddr
happyActOffsets = HappyA# "\x01\x00\x3c\x00\x01\x00\x1f\x00\xf1\xff\x04\x00\x04\x00\xe8\xff\xe8\xff\xe8\xff\xe8\xff\xe8\xff\xe8\xff\x00\x00\xe8\xff\xee\xff\xfe\xff\xf5\xff\x08\x00\x08\x00\x3c\x00\x1c\x00\x10\x00\x10\x00\x00\x00\x10\x00\x04\x00\x00\x00\x10\x00\x35\x00\x4b\x00\x04\x00\x04\x00\x00\x00\x39\x00\x14\x00\x34\x00\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x59\x00\x76\x00\x72\x00\x5e\x00\x31\x00\xfb\x00\x04\x00\x04\x00\x04\x00\x00\x00\x00\x00\x06\x00\x7f\x00\x00\x00\x00\x00\x9c\x00\x9f\x00\xa7\x00\x01\x00\x39\x00\x01\x00\x01\x00\x01\x00\xa2\x00\xa2\x00\xc0\x00\x3c\x00\xbf\x00\xc7\x00\x04\x00\xd8\x00\xca\x00\x39\x00\xca\x00\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x01\x00\x39\x00\x00\x00\xe8\x00\xf0\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x01\x00\x01\x00\x00\x00\xf4\x00\x02\x01\x00\x00\x00\x00\xfd\x00\xff\x00\x01\x00\x01\x00\x01\x00\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00"#

happyGotoOffsets :: HappyAddr
happyGotoOffsets = HappyA# "\x96\x00\x05\x00\x7e\x00\x75\x00\x05\x01\x62\x00\x3f\x00\x25\x00\x54\x00\x3d\x00\x45\x00\x28\x00\x00\x00\x00\x00\x2b\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x53\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x66\x00\x00\x00\x00\x00\x00\x00\x00\x00\x63\x00\x69\x00\x00\x00\x00\x00\x03\x01\x0e\x01\x86\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x03\x01\x00\x00\x6d\x00\x73\x00\x74\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x9e\x00\x00\x00\xa6\x00\xae\x00\x8e\x00\x56\x00\x4c\x00\x00\x00\x06\x01\x00\x00\x00\x00\x68\x00\x00\x00\x5a\x00\x00\x00\x50\x00\xb6\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xbe\x00\xc6\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xce\x00\xd6\x00\xde\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xe6\x00\xee\x00\xf6\x00\xfe\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00"#

happyAdjustOffset :: Happy_GHC_Exts.Int# -> Happy_GHC_Exts.Int#
happyAdjustOffset off = off

happyDefActions :: HappyAddr
happyDefActions = HappyA# "\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xd1\xff\x00\x00\xcd\xff\x00\x00\x00\x00\xf3\xff\xca\xff\x00\x00\x00\x00\xcc\xff\x00\x00\x00\x00\x00\x00\xd0\xff\x00\x00\x00\x00\xd4\xff\x00\x00\x00\x00\xd5\xff\x00\x00\xd6\xff\x00\x00\x00\x00\x00\x00\xe2\xff\xda\xff\x00\x00\x00\x00\x00\x00\xe5\xff\xe6\xff\xe0\xff\xe7\xff\xe1\xff\x00\x00\x00\x00\xdd\xff\x00\x00\xe8\xff\x00\x00\x00\x00\x00\x00\x00\x00\xf2\xff\xf1\xff\x00\x00\x00\x00\xe4\xff\xe3\xff\x00\x00\x00\x00\x00\x00\x00\x00\xdb\xff\x00\x00\x00\x00\x00\x00\xd1\xff\xcd\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xd1\xff\xd2\xff\xcd\xff\x00\x00\xc9\xff\xce\xff\xcb\xff\xcf\xff\xd3\xff\xd7\xff\x00\x00\x00\x00\xdc\xff\xdf\xff\x00\x00\x00\x00\xde\xff\xea\xff\xe9\xff\xeb\xff\x00\x00\x00\x00\x00\x00\xf0\xff\x00\x00\x00\x00\xed\xff\xec\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xee\xff\xef\xff\xd8\xff\xd9\xff"#

happyCheck :: HappyAddr
happyCheck = HappyA# "\xff\xff\x19\x00\x01\x00\x02\x00\x06\x00\x00\x00\x02\x00\x16\x00\x17\x00\x04\x00\x1c\x00\x0a\x00\x0b\x00\x18\x00\x08\x00\x09\x00\x0f\x00\x10\x00\x11\x00\x12\x00\x13\x00\x14\x00\x02\x00\x16\x00\x17\x00\x15\x00\x19\x00\x1a\x00\x1b\x00\x19\x00\x0a\x00\x0b\x00\x01\x00\x02\x00\x1c\x00\x0f\x00\x1c\x00\x00\x00\x12\x00\x13\x00\x00\x00\x0a\x00\x0b\x00\x00\x00\x1c\x00\x19\x00\x0f\x00\x0a\x00\x1c\x00\x12\x00\x13\x00\x02\x00\x18\x00\x04\x00\x0e\x00\x06\x00\x19\x00\x0e\x00\x05\x00\x0a\x00\x0b\x00\x00\x00\x02\x00\x00\x00\x0f\x00\x08\x00\x09\x00\x12\x00\x13\x00\x00\x00\x0a\x00\x0b\x00\x09\x00\x0c\x00\x19\x00\x0f\x00\x00\x00\x19\x00\x12\x00\x13\x00\x00\x00\x0c\x00\x0d\x00\x00\x00\x00\x00\x19\x00\x00\x00\x04\x00\x0c\x00\x0d\x00\x00\x00\x02\x00\x0c\x00\x0d\x00\x0a\x00\x0b\x00\x0a\x00\x0b\x00\x00\x00\x00\x00\x0a\x00\x0b\x00\x00\x00\x1c\x00\x00\x00\x00\x00\x08\x00\x09\x00\x09\x00\x00\x00\x08\x00\x09\x00\x08\x00\x09\x00\x09\x00\x00\x00\x00\x00\x00\x00\x09\x00\x05\x00\x02\x00\x04\x00\x1c\x00\x06\x00\x09\x00\x09\x00\x00\x00\x01\x00\x02\x00\x03\x00\x04\x00\x05\x00\x06\x00\x07\x00\x00\x00\x01\x00\x02\x00\x03\x00\x04\x00\x05\x00\x06\x00\x07\x00\x00\x00\x01\x00\x02\x00\x03\x00\x04\x00\x05\x00\x06\x00\x07\x00\x00\x00\x01\x00\x02\x00\x03\x00\x04\x00\x1c\x00\x06\x00\x07\x00\x00\x00\x01\x00\x02\x00\x03\x00\x04\x00\x07\x00\x06\x00\x07\x00\x00\x00\x01\x00\x02\x00\x03\x00\x04\x00\x0c\x00\x06\x00\x07\x00\x00\x00\x01\x00\x02\x00\x03\x00\x04\x00\x0c\x00\x06\x00\x07\x00\x00\x00\x01\x00\x02\x00\x03\x00\x04\x00\x19\x00\x06\x00\x07\x00\x00\x00\x01\x00\x02\x00\x03\x00\x04\x00\x03\x00\x06\x00\x07\x00\x00\x00\x01\x00\x02\x00\x03\x00\x04\x00\x0c\x00\x06\x00\x07\x00\x00\x00\x01\x00\x02\x00\x03\x00\x04\x00\x0c\x00\x06\x00\x07\x00\x00\x00\x01\x00\x02\x00\x03\x00\x04\x00\x03\x00\x06\x00\x07\x00\x00\x00\x01\x00\x02\x00\x03\x00\x04\x00\x19\x00\x06\x00\x07\x00\x00\x00\x01\x00\x02\x00\x03\x00\x04\x00\x03\x00\x06\x00\x07\x00\x00\x00\x01\x00\x02\x00\x03\x00\x04\x00\x03\x00\x06\x00\x07\x00\x00\x00\x01\x00\x02\x00\x03\x00\x04\x00\x07\x00\x06\x00\x07\x00\x00\x00\x01\x00\x02\x00\x03\x00\x04\x00\x00\x00\x06\x00\x07\x00\x00\x00\x04\x00\x0d\x00\x07\x00\x04\x00\x0e\x00\x07\x00\x0e\x00\x00\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff"#

happyTable :: HappyAddr
happyTable = HappyA# "\x00\x00\x0e\x00\x25\x00\x26\x00\x4e\x00\x21\x00\x1b\x00\x20\x00\x21\x00\x36\x00\xff\xff\x27\x00\x28\x00\x4d\x00\x39\x00\x3a\x00\x29\x00\x32\x00\x33\x00\x2a\x00\x2b\x00\x34\x00\x26\x00\x20\x00\x21\x00\x1c\x00\x0e\x00\x35\x00\x36\x00\x0e\x00\x27\x00\x28\x00\x25\x00\x26\x00\xff\xff\x29\x00\xff\xff\x14\x00\x2a\x00\x2b\x00\x0e\x00\x27\x00\x28\x00\x0e\x00\xff\xff\x0e\x00\x29\x00\x17\x00\xff\xff\x2a\x00\x2b\x00\x26\x00\x4b\x00\x40\x00\x0f\x00\x41\x00\x0e\x00\x4e\x00\x49\x00\x27\x00\x28\x00\x10\x00\x26\x00\x18\x00\x29\x00\x39\x00\x3a\x00\x2a\x00\x2b\x00\x10\x00\x27\x00\x28\x00\x19\x00\x13\x00\x0e\x00\x29\x00\x10\x00\x0e\x00\x2a\x00\x2b\x00\x10\x00\x11\x00\x12\x00\x21\x00\x14\x00\x0e\x00\x14\x00\x4b\x00\x11\x00\x58\x00\x14\x00\x44\x00\x11\x00\x50\x00\x15\x00\x16\x00\x15\x00\x59\x00\x18\x00\x18\x00\x15\x00\x51\x00\x18\x00\xff\xff\x18\x00\x18\x00\x1c\x00\x1d\x00\x47\x00\x18\x00\x49\x00\x1d\x00\x53\x00\x1d\x00\x46\x00\x18\x00\x18\x00\x21\x00\x3c\x00\x42\x00\x43\x00\x22\x00\xff\xff\x23\x00\x3b\x00\x3a\x00\x21\x00\x2b\x00\x2c\x00\x2d\x00\x22\x00\x2e\x00\x2f\x00\x30\x00\x21\x00\x2b\x00\x2c\x00\x2d\x00\x22\x00\x44\x00\x2f\x00\x30\x00\x21\x00\x2b\x00\x2c\x00\x2d\x00\x22\x00\x5a\x00\x2f\x00\x30\x00\x21\x00\x2b\x00\x2c\x00\x37\x00\x22\x00\xff\xff\x2f\x00\x30\x00\x21\x00\x2b\x00\x2c\x00\x5d\x00\x22\x00\x61\x00\x2f\x00\x30\x00\x21\x00\x2b\x00\x2c\x00\x5c\x00\x22\x00\x60\x00\x2f\x00\x30\x00\x21\x00\x2b\x00\x2c\x00\x5b\x00\x22\x00\x5f\x00\x2f\x00\x30\x00\x21\x00\x2b\x00\x2c\x00\x4f\x00\x22\x00\x0e\x00\x2f\x00\x30\x00\x21\x00\x2b\x00\x2c\x00\x67\x00\x22\x00\x58\x00\x2f\x00\x30\x00\x21\x00\x2b\x00\x2c\x00\x66\x00\x22\x00\x56\x00\x2f\x00\x30\x00\x21\x00\x2b\x00\x2c\x00\x63\x00\x22\x00\x55\x00\x2f\x00\x30\x00\x21\x00\x2b\x00\x2c\x00\x62\x00\x22\x00\x53\x00\x2f\x00\x30\x00\x21\x00\x2b\x00\x2c\x00\x61\x00\x22\x00\x0e\x00\x2f\x00\x30\x00\x21\x00\x2b\x00\x2c\x00\x6f\x00\x22\x00\x66\x00\x2f\x00\x30\x00\x21\x00\x2b\x00\x2c\x00\x6e\x00\x22\x00\x65\x00\x2f\x00\x30\x00\x21\x00\x2b\x00\x2c\x00\x6d\x00\x22\x00\x6c\x00\x2f\x00\x30\x00\x21\x00\x2b\x00\x2c\x00\x6c\x00\x22\x00\x21\x00\x2f\x00\x30\x00\x21\x00\x3e\x00\x3e\x00\x6b\x00\x56\x00\x6a\x00\x1e\x00\x69\x00\x45\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00"#

happyReduceArr = Happy_Data_Array.array (12, 54) [
	(12 , happyReduce_12),
	(13 , happyReduce_13),
	(14 , happyReduce_14),
	(15 , happyReduce_15),
	(16 , happyReduce_16),
	(17 , happyReduce_17),
	(18 , happyReduce_18),
	(19 , happyReduce_19),
	(20 , happyReduce_20),
	(21 , happyReduce_21),
	(22 , happyReduce_22),
	(23 , happyReduce_23),
	(24 , happyReduce_24),
	(25 , happyReduce_25),
	(26 , happyReduce_26),
	(27 , happyReduce_27),
	(28 , happyReduce_28),
	(29 , happyReduce_29),
	(30 , happyReduce_30),
	(31 , happyReduce_31),
	(32 , happyReduce_32),
	(33 , happyReduce_33),
	(34 , happyReduce_34),
	(35 , happyReduce_35),
	(36 , happyReduce_36),
	(37 , happyReduce_37),
	(38 , happyReduce_38),
	(39 , happyReduce_39),
	(40 , happyReduce_40),
	(41 , happyReduce_41),
	(42 , happyReduce_42),
	(43 , happyReduce_43),
	(44 , happyReduce_44),
	(45 , happyReduce_45),
	(46 , happyReduce_46),
	(47 , happyReduce_47),
	(48 , happyReduce_48),
	(49 , happyReduce_49),
	(50 , happyReduce_50),
	(51 , happyReduce_51),
	(52 , happyReduce_52),
	(53 , happyReduce_53),
	(54 , happyReduce_54)
	]

happy_n_terms = 29 :: Prelude.Int
happy_n_nonterms = 15 :: Prelude.Int

happyReduce_12 = happySpecReduce_1  0# happyReduction_12
happyReduction_12 happy_x_1
	 =  case happyOutTok happy_x_1 of { (PT _ (TV happy_var_1)) -> 
	happyIn15
		 (Core.Abs.Ident happy_var_1
	)}

happyReduce_13 = happySpecReduce_1  1# happyReduction_13
happyReduction_13 happy_x_1
	 =  case happyOutTok happy_x_1 of { happy_var_1 -> 
	happyIn16
		 (Core.Abs.CaseTk (mkPosToken happy_var_1)
	)}

happyReduce_14 = happySpecReduce_1  2# happyReduction_14
happyReduction_14 happy_x_1
	 =  case happyOutTok happy_x_1 of { happy_var_1 -> 
	happyIn17
		 (Core.Abs.DataTk (mkPosToken happy_var_1)
	)}

happyReduce_15 = happyReduce 4# 3# happyReduction_15
happyReduction_15 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut24 happy_x_2 of { (HappyWrap24 happy_var_2) -> 
	case happyOut18 happy_x_4 of { (HappyWrap18 happy_var_4) -> 
	happyIn18
		 (Core.Abs.ELam happy_var_2 happy_var_4
	) `HappyStk` happyRest}}

happyReduce_16 = happyReduce 6# 3# happyReduction_16
happyReduction_16 (happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut24 happy_x_2 of { (HappyWrap24 happy_var_2) -> 
	case happyOut18 happy_x_4 of { (HappyWrap18 happy_var_4) -> 
	case happyOut18 happy_x_6 of { (HappyWrap18 happy_var_6) -> 
	happyIn18
		 (Core.Abs.EPi happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest}}}

happyReduce_17 = happyReduce 6# 3# happyReduction_17
happyReduction_17 (happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut24 happy_x_2 of { (HappyWrap24 happy_var_2) -> 
	case happyOut18 happy_x_4 of { (HappyWrap18 happy_var_4) -> 
	case happyOut18 happy_x_6 of { (HappyWrap18 happy_var_6) -> 
	happyIn18
		 (Core.Abs.ESig happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest}}}

happyReduce_18 = happyReduce 4# 3# happyReduction_18
happyReduction_18 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut17 happy_x_1 of { (HappyWrap17 happy_var_1) -> 
	case happyOut26 happy_x_3 of { (HappyWrap26 happy_var_3) -> 
	happyIn18
		 (Core.Abs.EData happy_var_1 happy_var_3
	) `HappyStk` happyRest}}

happyReduce_19 = happyReduce 4# 3# happyReduction_19
happyReduction_19 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut16 happy_x_1 of { (HappyWrap16 happy_var_1) -> 
	case happyOut28 happy_x_3 of { (HappyWrap28 happy_var_3) -> 
	happyIn18
		 (Core.Abs.ECase happy_var_1 happy_var_3
	) `HappyStk` happyRest}}

happyReduce_20 = happySpecReduce_3  3# happyReduction_20
happyReduction_20 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut22 happy_x_1 of { (HappyWrap22 happy_var_1) -> 
	case happyOut18 happy_x_3 of { (HappyWrap18 happy_var_3) -> 
	happyIn18
		 (Core.Abs.EDec happy_var_1 happy_var_3
	)}}

happyReduce_21 = happySpecReduce_3  3# happyReduction_21
happyReduction_21 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut21 happy_x_1 of { (HappyWrap21 happy_var_1) -> 
	case happyOut18 happy_x_3 of { (HappyWrap18 happy_var_3) -> 
	happyIn18
		 (Core.Abs.eArrow happy_var_1 happy_var_3
	)}}

happyReduce_22 = happySpecReduce_3  3# happyReduction_22
happyReduction_22 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut21 happy_x_1 of { (HappyWrap21 happy_var_1) -> 
	case happyOut18 happy_x_3 of { (HappyWrap18 happy_var_3) -> 
	happyIn18
		 (Core.Abs.eTimes happy_var_1 happy_var_3
	)}}

happyReduce_23 = happySpecReduce_1  3# happyReduction_23
happyReduction_23 happy_x_1
	 =  case happyOut21 happy_x_1 of { (HappyWrap21 happy_var_1) -> 
	happyIn18
		 (happy_var_1
	)}

happyReduce_24 = happySpecReduce_1  4# happyReduction_24
happyReduction_24 happy_x_1
	 =  happyIn19
		 (Core.Abs.ESet
	)

happyReduce_25 = happySpecReduce_1  4# happyReduction_25
happyReduction_25 happy_x_1
	 =  happyIn19
		 (Core.Abs.EOne
	)

happyReduce_26 = happySpecReduce_1  4# happyReduction_26
happyReduction_26 happy_x_1
	 =  happyIn19
		 (Core.Abs.Eunit
	)

happyReduce_27 = happySpecReduce_2  4# happyReduction_27
happyReduction_27 happy_x_2
	happy_x_1
	 =  case happyOut19 happy_x_1 of { (HappyWrap19 happy_var_1) -> 
	happyIn19
		 (Core.Abs.EFst happy_var_1
	)}

happyReduce_28 = happySpecReduce_2  4# happyReduction_28
happyReduction_28 happy_x_2
	happy_x_1
	 =  case happyOut19 happy_x_1 of { (HappyWrap19 happy_var_1) -> 
	happyIn19
		 (Core.Abs.ESnd happy_var_1
	)}

happyReduce_29 = happySpecReduce_1  4# happyReduction_29
happyReduction_29 happy_x_1
	 =  case happyOut15 happy_x_1 of { (HappyWrap15 happy_var_1) -> 
	happyIn19
		 (Core.Abs.EVar happy_var_1
	)}

happyReduce_30 = happySpecReduce_1  4# happyReduction_30
happyReduction_30 happy_x_1
	 =  happyIn19
		 (Core.Abs.EVoid
	)

happyReduce_31 = happySpecReduce_1  4# happyReduction_31
happyReduction_31 happy_x_1
	 =  happyIn19
		 (Core.Abs.EPN
	)

happyReduce_32 = happySpecReduce_3  4# happyReduction_32
happyReduction_32 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut20 happy_x_2 of { (HappyWrap20 happy_var_2) -> 
	happyIn19
		 (happy_var_2
	)}

happyReduce_33 = happySpecReduce_3  5# happyReduction_33
happyReduction_33 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut18 happy_x_1 of { (HappyWrap18 happy_var_1) -> 
	case happyOut20 happy_x_3 of { (HappyWrap20 happy_var_3) -> 
	happyIn20
		 (Core.Abs.EPair happy_var_1 happy_var_3
	)}}

happyReduce_34 = happySpecReduce_1  5# happyReduction_34
happyReduction_34 happy_x_1
	 =  case happyOut18 happy_x_1 of { (HappyWrap18 happy_var_1) -> 
	happyIn20
		 (happy_var_1
	)}

happyReduce_35 = happySpecReduce_3  6# happyReduction_35
happyReduction_35 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut15 happy_x_2 of { (HappyWrap15 happy_var_2) -> 
	case happyOut19 happy_x_3 of { (HappyWrap19 happy_var_3) -> 
	happyIn21
		 (Core.Abs.ECon happy_var_2 happy_var_3
	)}}

happyReduce_36 = happySpecReduce_2  6# happyReduction_36
happyReduction_36 happy_x_2
	happy_x_1
	 =  case happyOut21 happy_x_1 of { (HappyWrap21 happy_var_1) -> 
	case happyOut19 happy_x_2 of { (HappyWrap19 happy_var_2) -> 
	happyIn21
		 (Core.Abs.EApp happy_var_1 happy_var_2
	)}}

happyReduce_37 = happySpecReduce_1  6# happyReduction_37
happyReduction_37 happy_x_1
	 =  case happyOut19 happy_x_1 of { (HappyWrap19 happy_var_1) -> 
	happyIn21
		 (happy_var_1
	)}

happyReduce_38 = happyReduce 6# 7# happyReduction_38
happyReduction_38 (happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut24 happy_x_2 of { (HappyWrap24 happy_var_2) -> 
	case happyOut18 happy_x_4 of { (HappyWrap18 happy_var_4) -> 
	case happyOut18 happy_x_6 of { (HappyWrap18 happy_var_6) -> 
	happyIn22
		 (Core.Abs.Def happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest}}}

happyReduce_39 = happyReduce 6# 7# happyReduction_39
happyReduction_39 (happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut24 happy_x_2 of { (HappyWrap24 happy_var_2) -> 
	case happyOut18 happy_x_4 of { (HappyWrap18 happy_var_4) -> 
	case happyOut18 happy_x_6 of { (HappyWrap18 happy_var_6) -> 
	happyIn22
		 (Core.Abs.Drec happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest}}}

happyReduce_40 = happySpecReduce_3  8# happyReduction_40
happyReduction_40 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut24 happy_x_1 of { (HappyWrap24 happy_var_1) -> 
	case happyOut23 happy_x_3 of { (HappyWrap23 happy_var_3) -> 
	happyIn23
		 (Core.Abs.PPair happy_var_1 happy_var_3
	)}}

happyReduce_41 = happySpecReduce_1  8# happyReduction_41
happyReduction_41 happy_x_1
	 =  case happyOut24 happy_x_1 of { (HappyWrap24 happy_var_1) -> 
	happyIn23
		 (happy_var_1
	)}

happyReduce_42 = happySpecReduce_1  9# happyReduction_42
happyReduction_42 happy_x_1
	 =  happyIn24
		 (Core.Abs.Punit
	)

happyReduce_43 = happySpecReduce_1  9# happyReduction_43
happyReduction_43 happy_x_1
	 =  case happyOut15 happy_x_1 of { (HappyWrap15 happy_var_1) -> 
	happyIn24
		 (Core.Abs.PVar happy_var_1
	)}

happyReduce_44 = happySpecReduce_3  9# happyReduction_44
happyReduction_44 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut23 happy_x_2 of { (HappyWrap23 happy_var_2) -> 
	happyIn24
		 (happy_var_2
	)}

happyReduce_45 = happySpecReduce_2  10# happyReduction_45
happyReduction_45 happy_x_2
	happy_x_1
	 =  case happyOut15 happy_x_1 of { (HappyWrap15 happy_var_1) -> 
	case happyOut19 happy_x_2 of { (HappyWrap19 happy_var_2) -> 
	happyIn25
		 (Core.Abs.Summand happy_var_1 happy_var_2
	)}}

happyReduce_46 = happySpecReduce_0  11# happyReduction_46
happyReduction_46  =  happyIn26
		 ([]
	)

happyReduce_47 = happySpecReduce_1  11# happyReduction_47
happyReduction_47 happy_x_1
	 =  case happyOut25 happy_x_1 of { (HappyWrap25 happy_var_1) -> 
	happyIn26
		 ((:[]) happy_var_1
	)}

happyReduce_48 = happySpecReduce_3  11# happyReduction_48
happyReduction_48 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut25 happy_x_1 of { (HappyWrap25 happy_var_1) -> 
	case happyOut26 happy_x_3 of { (HappyWrap26 happy_var_3) -> 
	happyIn26
		 ((:) happy_var_1 happy_var_3
	)}}

happyReduce_49 = happySpecReduce_3  12# happyReduction_49
happyReduction_49 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut15 happy_x_1 of { (HappyWrap15 happy_var_1) -> 
	case happyOut18 happy_x_3 of { (HappyWrap18 happy_var_3) -> 
	happyIn27
		 (Core.Abs.Branch happy_var_1 happy_var_3
	)}}

happyReduce_50 = happySpecReduce_0  13# happyReduction_50
happyReduction_50  =  happyIn28
		 ([]
	)

happyReduce_51 = happySpecReduce_1  13# happyReduction_51
happyReduction_51 happy_x_1
	 =  case happyOut27 happy_x_1 of { (HappyWrap27 happy_var_1) -> 
	happyIn28
		 ((:[]) happy_var_1
	)}

happyReduce_52 = happySpecReduce_3  13# happyReduction_52
happyReduction_52 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut27 happy_x_1 of { (HappyWrap27 happy_var_1) -> 
	case happyOut28 happy_x_3 of { (HappyWrap28 happy_var_3) -> 
	happyIn28
		 ((:) happy_var_1 happy_var_3
	)}}

happyReduce_53 = happySpecReduce_1  14# happyReduction_53
happyReduction_53 happy_x_1
	 =  case happyOut15 happy_x_1 of { (HappyWrap15 happy_var_1) -> 
	happyIn29
		 ((:[]) happy_var_1
	)}

happyReduce_54 = happySpecReduce_2  14# happyReduction_54
happyReduction_54 happy_x_2
	happy_x_1
	 =  case happyOut15 happy_x_1 of { (HappyWrap15 happy_var_1) -> 
	case happyOut29 happy_x_2 of { (HappyWrap29 happy_var_2) -> 
	happyIn29
		 ((:) happy_var_1 happy_var_2
	)}}

happyNewToken action sts stk [] =
	happyDoAction 28# notHappyAtAll action sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = happyDoAction i tk action sts stk tks in
	case tk of {
	PT _ (TS _ 1) -> cont 1#;
	PT _ (TS _ 2) -> cont 2#;
	PT _ (TS _ 3) -> cont 3#;
	PT _ (TS _ 4) -> cont 4#;
	PT _ (TS _ 5) -> cont 5#;
	PT _ (TS _ 6) -> cont 6#;
	PT _ (TS _ 7) -> cont 7#;
	PT _ (TS _ 8) -> cont 8#;
	PT _ (TS _ 9) -> cont 9#;
	PT _ (TS _ 10) -> cont 10#;
	PT _ (TS _ 11) -> cont 11#;
	PT _ (TS _ 12) -> cont 12#;
	PT _ (TS _ 13) -> cont 13#;
	PT _ (TS _ 14) -> cont 14#;
	PT _ (TS _ 15) -> cont 15#;
	PT _ (TS _ 16) -> cont 16#;
	PT _ (TS _ 17) -> cont 17#;
	PT _ (TS _ 18) -> cont 18#;
	PT _ (TS _ 19) -> cont 19#;
	PT _ (TS _ 20) -> cont 20#;
	PT _ (TS _ 21) -> cont 21#;
	PT _ (TS _ 22) -> cont 22#;
	PT _ (TS _ 23) -> cont 23#;
	PT _ (TS _ 24) -> cont 24#;
	PT _ (TV happy_dollar_dollar) -> cont 25#;
	PT _ (T_CaseTk _) -> cont 26#;
	PT _ (T_DataTk _) -> cont 27#;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 28# tk tks = happyError' (tks, explist)
happyError_ explist _ tk tks = happyError' ((tk:tks), explist)

happyThen :: () => Either String a -> (a -> Either String b) -> Either String b
happyThen = ((>>=))
happyReturn :: () => a -> Either String a
happyReturn = (return)
happyThen1 m k tks = ((>>=)) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> Either String a
happyReturn1 = \a tks -> (return) a
happyError' :: () => ([(Token)], [Prelude.String]) -> Either String a
happyError' = (\(tokens, _) -> happyError tokens)
pExp1 tks = happySomeParser where
 happySomeParser = happyThen (happyParse 0# tks) (\x -> happyReturn (let {(HappyWrap18 x') = happyOut18 x} in x'))

pExp3 tks = happySomeParser where
 happySomeParser = happyThen (happyParse 1# tks) (\x -> happyReturn (let {(HappyWrap19 x') = happyOut19 x} in x'))

pExp tks = happySomeParser where
 happySomeParser = happyThen (happyParse 2# tks) (\x -> happyReturn (let {(HappyWrap20 x') = happyOut20 x} in x'))

pExp2 tks = happySomeParser where
 happySomeParser = happyThen (happyParse 3# tks) (\x -> happyReturn (let {(HappyWrap21 x') = happyOut21 x} in x'))

pDecl tks = happySomeParser where
 happySomeParser = happyThen (happyParse 4# tks) (\x -> happyReturn (let {(HappyWrap22 x') = happyOut22 x} in x'))

pPatt tks = happySomeParser where
 happySomeParser = happyThen (happyParse 5# tks) (\x -> happyReturn (let {(HappyWrap23 x') = happyOut23 x} in x'))

pPatt1 tks = happySomeParser where
 happySomeParser = happyThen (happyParse 6# tks) (\x -> happyReturn (let {(HappyWrap24 x') = happyOut24 x} in x'))

pSummand tks = happySomeParser where
 happySomeParser = happyThen (happyParse 7# tks) (\x -> happyReturn (let {(HappyWrap25 x') = happyOut25 x} in x'))

pListSummand tks = happySomeParser where
 happySomeParser = happyThen (happyParse 8# tks) (\x -> happyReturn (let {(HappyWrap26 x') = happyOut26 x} in x'))

pBranch tks = happySomeParser where
 happySomeParser = happyThen (happyParse 9# tks) (\x -> happyReturn (let {(HappyWrap27 x') = happyOut27 x} in x'))

pListBranch tks = happySomeParser where
 happySomeParser = happyThen (happyParse 10# tks) (\x -> happyReturn (let {(HappyWrap28 x') = happyOut28 x} in x'))

pListIdent tks = happySomeParser where
 happySomeParser = happyThen (happyParse 11# tks) (\x -> happyReturn (let {(HappyWrap29 x') = happyOut29 x} in x'))

happySeq = happyDontSeq


happyError :: [Token] -> Either String a
happyError ts = Left $
  "syntax error at " ++ tokenPos ts ++
  case ts of
    []      -> []
    [Err _] -> " due to lexer error"
    t:_     -> " before `" ++ (prToken t) ++ "'"

myLexer = tokens
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- $Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp $













-- Do not remove this comment. Required to fix CPP parsing when using GCC and a clang-compiled alex.
#if __GLASGOW_HASKELL__ > 706
#define LT(n,m) ((Happy_GHC_Exts.tagToEnum# (n Happy_GHC_Exts.<# m)) :: Prelude.Bool)
#define GTE(n,m) ((Happy_GHC_Exts.tagToEnum# (n Happy_GHC_Exts.>=# m)) :: Prelude.Bool)
#define EQ(n,m) ((Happy_GHC_Exts.tagToEnum# (n Happy_GHC_Exts.==# m)) :: Prelude.Bool)
#else
#define LT(n,m) (n Happy_GHC_Exts.<# m)
#define GTE(n,m) (n Happy_GHC_Exts.>=# m)
#define EQ(n,m) (n Happy_GHC_Exts.==# m)
#endif



















data Happy_IntList = HappyCons Happy_GHC_Exts.Int# Happy_IntList








































infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is ERROR_TOK, it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept 0# tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
        (happyTcHack j (happyTcHack st)) (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action



happyDoAction i tk st
        = {- nothing -}
          case action of
                0#           -> {- nothing -}
                                     happyFail (happyExpListPerState ((Happy_GHC_Exts.I# (st)) :: Prelude.Int)) i tk st
                -1#          -> {- nothing -}
                                     happyAccept i tk st
                n | LT(n,(0# :: Happy_GHC_Exts.Int#)) -> {- nothing -}
                                                   (happyReduceArr Happy_Data_Array.! rule) i tk st
                                                   where rule = (Happy_GHC_Exts.I# ((Happy_GHC_Exts.negateInt# ((n Happy_GHC_Exts.+# (1# :: Happy_GHC_Exts.Int#))))))
                n                 -> {- nothing -}
                                     happyShift new_state i tk st
                                     where new_state = (n Happy_GHC_Exts.-# (1# :: Happy_GHC_Exts.Int#))
   where off    = happyAdjustOffset (indexShortOffAddr happyActOffsets st)
         off_i  = (off Happy_GHC_Exts.+# i)
         check  = if GTE(off_i,(0# :: Happy_GHC_Exts.Int#))
                  then EQ(indexShortOffAddr happyCheck off_i, i)
                  else Prelude.False
         action
          | check     = indexShortOffAddr happyTable off_i
          | Prelude.otherwise = indexShortOffAddr happyDefActions st




indexShortOffAddr (HappyA# arr) off =
        Happy_GHC_Exts.narrow16Int# i
  where
        i = Happy_GHC_Exts.word2Int# (Happy_GHC_Exts.or# (Happy_GHC_Exts.uncheckedShiftL# high 8#) low)
        high = Happy_GHC_Exts.int2Word# (Happy_GHC_Exts.ord# (Happy_GHC_Exts.indexCharOffAddr# arr (off' Happy_GHC_Exts.+# 1#)))
        low  = Happy_GHC_Exts.int2Word# (Happy_GHC_Exts.ord# (Happy_GHC_Exts.indexCharOffAddr# arr off'))
        off' = off Happy_GHC_Exts.*# 2#




{-# INLINE happyLt #-}
happyLt x y = LT(x,y)


readArrayBit arr bit =
    Bits.testBit (Happy_GHC_Exts.I# (indexShortOffAddr arr ((unbox_int bit) `Happy_GHC_Exts.iShiftRA#` 4#))) (bit `Prelude.mod` 16)
  where unbox_int (Happy_GHC_Exts.I# x) = x






data HappyAddr = HappyA# Happy_GHC_Exts.Addr#


-----------------------------------------------------------------------------
-- HappyState data type (not arrays)













-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state 0# tk st sts stk@(x `HappyStk` _) =
     let i = (case Happy_GHC_Exts.unsafeCoerce# x of { (Happy_GHC_Exts.I# (i)) -> i }) in
--     trace "shifting the error token" $
     happyDoAction i tk new_state (HappyCons (st) (sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state (HappyCons (st) (sts)) ((happyInTok (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happySpecReduce_0 nt fn j tk st@((action)) sts stk
     = happyGoto nt j tk st (HappyCons (st) (sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@((HappyCons (st@(action)) (_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (happyGoto nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happySpecReduce_2 nt fn j tk _ (HappyCons (_) (sts@((HappyCons (st@(action)) (_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (happyGoto nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happySpecReduce_3 nt fn j tk _ (HappyCons (_) ((HappyCons (_) (sts@((HappyCons (st@(action)) (_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (happyGoto nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k Happy_GHC_Exts.-# (1# :: Happy_GHC_Exts.Int#)) sts of
         sts1@((HappyCons (st1@(action)) (_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (happyGoto nt j tk st1 sts1 r)

happyMonadReduce k nt fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k (HappyCons (st) (sts)) of
        sts1@((HappyCons (st1@(action)) (_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> happyGoto nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k (HappyCons (st) (sts)) of
        sts1@((HappyCons (st1@(action)) (_))) ->
         let drop_stk = happyDropStk k stk

             off = happyAdjustOffset (indexShortOffAddr happyGotoOffsets st1)
             off_i = (off Happy_GHC_Exts.+# nt)
             new_state = indexShortOffAddr happyTable off_i




          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop 0# l = l
happyDrop n (HappyCons (_) (t)) = happyDrop (n Happy_GHC_Exts.-# (1# :: Happy_GHC_Exts.Int#)) t

happyDropStk 0# l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n Happy_GHC_Exts.-# (1#::Happy_GHC_Exts.Int#)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction


happyGoto nt j tk st = 
   {- nothing -}
   happyDoAction j tk new_state
   where off = happyAdjustOffset (indexShortOffAddr happyGotoOffsets st)
         off_i = (off Happy_GHC_Exts.+# nt)
         new_state = indexShortOffAddr happyTable off_i




-----------------------------------------------------------------------------
-- Error recovery (ERROR_TOK is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist 0# tk old_st _ stk@(x `HappyStk` _) =
     let i = (case Happy_GHC_Exts.unsafeCoerce# x of { (Happy_GHC_Exts.I# (i)) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  ERROR_TOK tk old_st CONS(HAPPYSTATE(action),sts) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        DO_ACTION(action,ERROR_TOK,tk,sts,(saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (action) sts stk =
--      trace "entering error recovery" $
        happyDoAction 0# tk action sts ((Happy_GHC_Exts.unsafeCoerce# (Happy_GHC_Exts.I# (i))) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = Prelude.error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions


happyTcHack :: Happy_GHC_Exts.Int# -> a -> a
happyTcHack x y = y
{-# INLINE happyTcHack #-}


-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `Prelude.seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.


{-# NOINLINE happyDoAction #-}
{-# NOINLINE happyTable #-}
{-# NOINLINE happyCheck #-}
{-# NOINLINE happyActOffsets #-}
{-# NOINLINE happyGotoOffsets #-}
{-# NOINLINE happyDefActions #-}

{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
