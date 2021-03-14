unit data;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB;

type
  TDataModule1 = class(TDataModule)
    ADOConnection1: TADOConnection;
    tbCollection: TADOTable;
    qWholeCollection: TADOQuery;
    tbCollectionID: TAutoIncField;
    tbCollectionNamed: TWideStringField;
    tbCollectionType: TWideStringField;
    tbCollectionEpisodes: TWideStringField;
    tbCollectionTotal_Episodes: TWideStringField;
    tbCollectionEpisodes_Missing: TWideStringField;
    tbCollectionStatus: TWideStringField;
    tbCollectionPicture: TWideStringField;
    qWholeCollectionID: TAutoIncField;
    qWholeCollectionNamed: TWideStringField;
    qWholeCollectionType: TWideStringField;
    qWholeCollectionEpisodes: TWideStringField;
    qWholeCollectionTotal_Episodes: TWideStringField;
    qWholeCollectionEpisodes_Missing: TWideStringField;
    qWholeCollectionStatus: TWideStringField;
    qWholeCollectionPicture: TWideStringField;
    qAlpha: TADOQuery;
    qAlphaID: TAutoIncField;
    qAlphaNamed: TWideStringField;
    qAlphaType: TWideStringField;
    qAlphaEpisodes: TWideStringField;
    qAlphaTotal_Episodes: TWideStringField;
    qAlphaEpisodes_Missing: TWideStringField;
    qAlphaStatus: TWideStringField;
    qAlphaPicture: TWideStringField;
    qStatus: TADOQuery;
    qType: TADOQuery;
    qStatusID: TAutoIncField;
    qStatusNamed: TWideStringField;
    qStatusType: TWideStringField;
    qStatusEpisodes: TWideStringField;
    qStatusTotal_Episodes: TWideStringField;
    qStatusEpisodes_Missing: TWideStringField;
    qStatusStatus: TWideStringField;
    qStatusPicture: TWideStringField;
    qTypeID: TAutoIncField;
    qTypeNamed: TWideStringField;
    qTypeType: TWideStringField;
    qTypeEpisodes: TWideStringField;
    qTypeTotal_Episodes: TWideStringField;
    qTypeEpisodes_Missing: TWideStringField;
    qTypeStatus: TWideStringField;
    qTypePicture: TWideStringField;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure refreshTables();
  end;

var
  DataModule1: TDataModule1;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

procedure TDatamodule1.refreshTables;
begin
  Datamodule1.ADOConnection1.Connected := false;
  Datamodule1.ADOConnection1.Connected := true;
  tbCollection.Active := false;
  tbCollection.Active := true;
end;

end.
