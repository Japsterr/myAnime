unit delete;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.jpeg, Vcl.ExtCtrls,
  Vcl.StdCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TfrmDelete = class(TForm)
    ImgBack: TImage;
    Button5: TButton;
    Label1: TLabel;
    Label2: TLabel;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    lblName: TLabel;
    lblType: TLabel;
    lblNumber: TLabel;
    lblCollection: TLabel;
    lblMissing: TLabel;
    lblStatus: TLabel;
    btnDelete: TButton;
    procedure Button5Click(Sender: TObject);
    procedure ImgBackMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnDeleteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure display();
  end;

var
  frmDelete: TfrmDelete;

implementation

{$R *.dfm}

uses data;

procedure TfrmDelete.btnDeleteClick(Sender: TObject);
begin
  if MessageDlg('Are you sure you want to delete this series or movie?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  Begin
    DataModule1.qWholeCollection.Delete;
    DBGrid1.Refresh;
    display();
  End;
end;

procedure TfrmDelete.Button5Click(Sender: TObject);
begin
  close;
end;

procedure TfrmDelete.ImgBackMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
const
  SC_DRAGMOVE = $F012;
begin
  if Button = mbLeft then
  begin
    ReleaseCapture;
    Perform(WM_SYSCOMMAND, SC_DRAGMOVE, 0);
  end;
end;

procedure TfrmDelete.DBGrid1CellClick(Column: TColumn);
begin
  display();
end;

procedure TfrmDelete.DBGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  display();
end;

procedure TfrmDelete.display;
begin
  lblName.Caption := 'Name: ' + Datamodule1.qWholeCollectionNamed.Value;
  lblType.Caption := 'Type: ' + Datamodule1.qWholeCollectionType.Value;
  lblNumber.Caption := 'Number of Episodes in Series: ' + Datamodule1.qWholeCollectionEpisodes.Value;
  lblCollection.Caption := 'Number of Episodes in your Collection: ' + Datamodule1.qWholeCollectionTotal_Episodes.Value;
  lblMissing.Caption := 'Number of Episodes Missing: ' + Datamodule1.qWholeCollectionEpisodes_Missing.Value;
  lblStatus.Caption := 'Status: ' + Datamodule1.qWholeCollectionStatus.Value;
end;

procedure TfrmDelete.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Datamodule1.qWholeCollection.Active := false;
end;

procedure TfrmDelete.FormCreate(Sender: TObject);
begin
  Datamodule1.qWholeCollection.Active := true;
  DBGrid1.Refresh;
  display;
end;

end.
