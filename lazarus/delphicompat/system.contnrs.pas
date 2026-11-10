{
 *****************************************************************************
  ESKit - compatibilidade com o Delphi: System.Contnrs
  Gerado por tools/genvclcompat.py a partir de Contnrs.
  Não edite: rode o gerador de novo com a sua versão do Lazarus/FPC.

  See the file COPYING.modifiedLGPL.txt, included in this distribution,
  for details about the license.
 *****************************************************************************
}
unit System.Contnrs;

{$mode objfpc}{$H+}
{$warn 5023 off}{$warn 5043 off}{$warn 5066 off}{$warn 5055 off}{$warn 5044 off}{$warn 6058 off}{$warn 5094 off}{$warn 5093 off}{$hints off}{$notes off}

interface

uses
  Contnrs;
type
  TObjectListCallback = Contnrs.TObjectListCallback;
  TObjectListStaticCallback = Contnrs.TObjectListStaticCallback;
  TFPObjectList = Contnrs.TFPObjectList;
  TObjectList = Contnrs.TObjectList;
  TComponentList = Contnrs.TComponentList;
  TClassList = Contnrs.TClassList;
  TOrderedList = Contnrs.TOrderedList;
  TStack = Contnrs.TStack;
  TObjectStack = Contnrs.TObjectStack;
  TQueue = Contnrs.TQueue;
  TObjectQueue = Contnrs.TObjectQueue;
  THashItem = Contnrs.THashItem;
  PHashItem = Contnrs.PHashItem;
  PHashItemList = Contnrs.PHashItemList;
  THashItemList = Contnrs.THashItemList;
  PHashTable = Contnrs.PHashTable;
  THashTable = Contnrs.THashTable;
  TFPHashList = Contnrs.TFPHashList;
  TFPHashObjectList = Contnrs.TFPHashObjectList;
  TFPHashObject = Contnrs.TFPHashObject;
  THashFunction = Contnrs.THashFunction;
  THTCustomNode = Contnrs.THTCustomNode;
  THTCustomNodeClass = Contnrs.THTCustomNodeClass;
  TFPCustomHashTable = Contnrs.TFPCustomHashTable;
  THTDataNode = Contnrs.THTDataNode;
  TDataIteratorMethod = Contnrs.TDataIteratorMethod;
  TDataIteratorCallBack = Contnrs.TDataIteratorCallBack;
  TFPDataHashTable = Contnrs.TFPDataHashTable;
  THTStringNode = Contnrs.THTStringNode;
  TStringIteratorMethod = Contnrs.TStringIteratorMethod;
  TStringIteratorCallback = Contnrs.TStringIteratorCallback;
  TFPStringHashTable = Contnrs.TFPStringHashTable;
  THTObjectNode = Contnrs.THTObjectNode;
  THTOwnedObjectNode = Contnrs.THTOwnedObjectNode;
  TObjectIteratorMethod = Contnrs.TObjectIteratorMethod;
  TObjectIteratorCallback = Contnrs.TObjectIteratorCallback;
  TFPObjectHashTable = Contnrs.TFPObjectHashTable;
  EDuplicate = Contnrs.EDuplicate;
  EKeyNotFound = Contnrs.EKeyNotFound;
  TBucketItem = Contnrs.TBucketItem;
  TBucketItemArray = Contnrs.TBucketItemArray;
  TBucket = Contnrs.TBucket;
  PBucket = Contnrs.PBucket;
  TBucketArray = Contnrs.TBucketArray;
  TBucketProc = Contnrs.TBucketProc;
  TBucketProcObject = Contnrs.TBucketProcObject;
  TCustomBucketList = Contnrs.TCustomBucketList;
  TBucketListSizes = Contnrs.TBucketListSizes;
  TBucketList = Contnrs.TBucketList;
  TObjectBucketList = Contnrs.TObjectBucketList;
  THTNode = Contnrs.THTNode;
  TIteratorMethod = Contnrs.TIteratorMethod;
const
  bl2 = Contnrs.bl2;
  bl4 = Contnrs.bl4;
  bl8 = Contnrs.bl8;
  bl16 = Contnrs.bl16;
  bl32 = Contnrs.bl32;
  bl64 = Contnrs.bl64;
  bl128 = Contnrs.bl128;
  bl256 = Contnrs.bl256;
  MaxHashListSize = Contnrs.MaxHashListSize;
  MaxHashStrSize = Contnrs.MaxHashStrSize;
  MaxHashTableSize = Contnrs.MaxHashTableSize;
  MaxItemsPerHash = Contnrs.MaxItemsPerHash;
Function RSHash(const S: string; const TableSize: Longword): Longword; inline;

implementation

Function RSHash(const S: string; const TableSize: Longword): Longword;
begin
  Result := Contnrs.RSHash(S, TableSize);
end;

end.
