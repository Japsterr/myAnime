unit edit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.jpeg, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Data.DB;

type
  TfrmEdit = class(TForm)
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
    Button1: TButton;
    procedure Button5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Button1Click(Sender: TObject);
    procedure DBGrid1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ImgBackMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure display;
  end;

var
  frmEdit: TfrmEdit;

implementation

{$R *.dfm}

uses data, editForm;

procedure TfrmEdit.Button1Click(Sender: TObject);
begin
  frmEditForm := TfrmEditForm.Create(self);
  frmEditForm.ShowModal;
  frmEditForm.Free;
  DBGrid1.Refresh;
  display;
end;

procedure TfrmEdit.Button5Click(Sender: TObject);
begin
  close;
end;

procedure TfrmEdit.DBGrid1CellClick(Column: TColumn);
begin
  display();
end;

procedure TfrmEdit.DBGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  display;
end;

procedure TfrmEdit.display;
begin
  lblName.Caption := 'Name: ' + Datamodule1.qWholeCollectionNamed.Value;
  lblType.Caption := 'Type: ' + Datamodule1.qWholeCollectionType.Value;
  lblNumber.Caption := 'Number of Episodes in Series: ' + Datamodule1.qWholeCollectionEpisodes.Value;
  lblCollection.Caption := 'Number of Episodes in your Collection: ' + Datamodule1.qWholeCollectionTotal_Episodes.Value;
  lblMissing.Caption := 'Number of Episodes Missing: ' + Datamodule1.qWholeCollectionEpisodes_Missing.Value;
  lblStatus.Caption := 'Status: ' + Datamodule1.qWholeCollectionStatus.Value;
end;

procedure TfrmEdit.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Datamodule1.qWholeCollection.Active := false;
end;

procedure TfrmEdit.FormCreate(Sender: TObject);
begin
  Datamodule1.qWholeCollection.Active := true;
  DBGrid1.Refresh;
  Display();
end;

procedure TfrmEdit.ImgBackMouseDown(Sender: TObject; Button: TMouseButton;
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

end.
