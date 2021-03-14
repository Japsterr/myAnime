object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 664
  Width = 1090
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;User ID=Admin;Data Source=C:\my' +
      'Anime\Data.mdb;Mode=Share Deny None;Persist Security Info=False;' +
      'Jet OLEDB:System database="";Jet OLEDB:Registry Path="";Jet OLED' +
      'B:Database Password="";Jet OLEDB:Engine Type=5;Jet OLEDB:Databas' +
      'e Locking Mode=1;Jet OLEDB:Global Partial Bulk Ops=2;Jet OLEDB:G' +
      'lobal Bulk Transactions=1;Jet OLEDB:New Database Password="";Jet' +
      ' OLEDB:Create System Database=False;Jet OLEDB:Encrypt Database=F' +
      'alse;Jet OLEDB:Don'#39't Copy Locale on Compact=False;Jet OLEDB:Comp' +
      'act Without Replica Repair=False;Jet OLEDB:SFP=False'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 40
    Top = 32
  end
  object tbCollection: TADOTable
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'Colletion'
    Left = 40
    Top = 96
    object tbCollectionID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object tbCollectionNamed: TWideStringField
      FieldName = 'Named'
      Size = 150
    end
    object tbCollectionType: TWideStringField
      FieldName = 'Type'
      Size = 10
    end
    object tbCollectionEpisodes: TWideStringField
      FieldName = 'Episodes'
      Size = 50
    end
    object tbCollectionTotal_Episodes: TWideStringField
      FieldName = 'Total_Episodes'
      Size = 3
    end
    object tbCollectionEpisodes_Missing: TWideStringField
      FieldName = 'Episodes_Missing'
      Size = 100
    end
    object tbCollectionStatus: TWideStringField
      FieldName = 'Status'
      Size = 50
    end
    object tbCollectionPicture: TWideStringField
      FieldName = 'Picture'
      Size = 100
    end
  end
  object qWholeCollection: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT*'
      'FROM Colletion'
      'ORDER BY named;')
    Left = 40
    Top = 224
    object qWholeCollectionID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object qWholeCollectionNamed: TWideStringField
      FieldName = 'Named'
      Size = 150
    end
    object qWholeCollectionType: TWideStringField
      FieldName = 'Type'
      Size = 10
    end
    object qWholeCollectionEpisodes: TWideStringField
      FieldName = 'Episodes'
      Size = 50
    end
    object qWholeCollectionTotal_Episodes: TWideStringField
      FieldName = 'Total_Episodes'
      Size = 3
    end
    object qWholeCollectionEpisodes_Missing: TWideStringField
      FieldName = 'Episodes_Missing'
      Size = 100
    end
    object qWholeCollectionStatus: TWideStringField
      FieldName = 'Status'
      Size = 50
    end
    object qWholeCollectionPicture: TWideStringField
      FieldName = 'Picture'
      Size = 100
    end
  end
  object qAlpha: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'value1'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'value2'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'SELECT*'
      'FROM Colletion'
      'WHERE named >= :value1'
      'AND named < :value2'
      'ORDER BY named;')
    Left = 40
    Top = 384
    object qAlphaID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object qAlphaNamed: TWideStringField
      FieldName = 'Named'
      Size = 150
    end
    object qAlphaType: TWideStringField
      FieldName = 'Type'
      Size = 10
    end
    object qAlphaEpisodes: TWideStringField
      FieldName = 'Episodes'
      Size = 50
    end
    object qAlphaTotal_Episodes: TWideStringField
      FieldName = 'Total_Episodes'
      Size = 3
    end
    object qAlphaEpisodes_Missing: TWideStringField
      FieldName = 'Episodes_Missing'
      Size = 100
    end
    object qAlphaStatus: TWideStringField
      FieldName = 'Status'
      Size = 50
    end
    object qAlphaPicture: TWideStringField
      FieldName = 'Picture'
      Size = 100
    end
  end
  object qStatus: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'value'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'SELECT*'
      'FROM Colletion'
      'WHERE status = :value'
      'ORDER BY named;'
      '')
    Left = 40
    Top = 272
    object qStatusID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object qStatusNamed: TWideStringField
      FieldName = 'Named'
      Size = 150
    end
    object qStatusType: TWideStringField
      FieldName = 'Type'
      Size = 10
    end
    object qStatusEpisodes: TWideStringField
      FieldName = 'Episodes'
      Size = 50
    end
    object qStatusTotal_Episodes: TWideStringField
      FieldName = 'Total_Episodes'
      Size = 3
    end
    object qStatusEpisodes_Missing: TWideStringField
      FieldName = 'Episodes_Missing'
      Size = 100
    end
    object qStatusStatus: TWideStringField
      FieldName = 'Status'
      Size = 50
    end
    object qStatusPicture: TWideStringField
      FieldName = 'Picture'
      Size = 100
    end
  end
  object qType: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'value'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'SELECT*'
      'FROM Colletion'
      'WHERE type = :value'
      'ORDER BY named;'
      '')
    Left = 40
    Top = 328
    object qTypeID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object qTypeNamed: TWideStringField
      FieldName = 'Named'
      Size = 150
    end
    object qTypeType: TWideStringField
      FieldName = 'Type'
      Size = 10
    end
    object qTypeEpisodes: TWideStringField
      FieldName = 'Episodes'
      Size = 50
    end
    object qTypeTotal_Episodes: TWideStringField
      FieldName = 'Total_Episodes'
      Size = 3
    end
    object qTypeEpisodes_Missing: TWideStringField
      FieldName = 'Episodes_Missing'
      Size = 100
    end
    object qTypeStatus: TWideStringField
      FieldName = 'Status'
      Size = 50
    end
    object qTypePicture: TWideStringField
      FieldName = 'Picture'
      Size = 100
    end
  end
end
