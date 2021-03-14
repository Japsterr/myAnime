unit insert;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.jpeg, Vcl.ExtCtrls,
  Vcl.StdCtrls, Data.DB;

type
  TfrmInsert = class(TForm)
    ImgBack: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label4: TLabel;
    edtName: TEdit;
    edtType: TComboBox;
    edtNumber: TEdit;
    edtCollection: TEdit;
    edtMissing: TEdit;
    edtStatus: TComboBox;
    Button5: TButton;
    btnSave: TButton;
    btnCancel: TButton;
    DataSource1: TDataSource;
    lblWarning: TLabel;
    procedure ImgBackMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Button5Click(Sender: TObject);
    procedure edtNameKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnSaveClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure insert();
    function find():Boolean;
    procedure warningOn();
    procedure warningOff();
    procedure clearFields();
  end;

var
  frmInsert: TfrmInsert;

implementation

{$R *.dfm}

uses data;

procedure TfrmInsert.insert;
begin
  Datamodule1.tbCollection.Insert;
  Datamodule1.tbCollectionNamed.Value := edtName.Text;
  Datamodule1.tbCollectionType.Value := edtType.Text;
  Datamodule1.tbCollectionEpisodes.Value := edtNumber.Text;
  Datamodule1.tbCollectionTotal_Episodes.Value := edtCollection.Text;
  Datamodule1.tbCollectionEpisodes_Missing.Value := edtMissing.Text;
  Datamodule1.tbCollectionStatus.Value := edtStatus.Text;
  Datamodule1.tbCollection.Post;
end;

procedure TfrmInsert.edtNameKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if find then
    warningOn
  else
    warningOff;
end;

function TfrmInsert.find;
var name : String;
    SearchOptions : TLocateOptions;
begin
  name := edtName.Text;
  SearchOptions := [loCaseInsensitive];
  result := DataModule1.tbCollection.Locate('Named', name, SearchOptions);
end;

procedure TfrmInsert.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Datamodule1.refreshTables;
end;

procedure TfrmInsert.btnCancelClick(Sender: TObject);
begin
  clearFields;
end;

procedure TfrmInsert.btnSaveClick(Sender: TObject);
begin
  insert();
  Showmessage('The Series or Movie was successfully saved.');
  clearFields;
end;

procedure TfrmInsert.Button5Click(Sender: TObject);
begin
  close;
end;

procedure TfrmInsert.ImgBackMouseDown(Sender: TObject; Button: TMouseButton;
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

procedure TfrmInsert.warningOn;
begin
  lblWarning.Visible := true;
  btnSave.Enabled := false;
end;

procedure TfrmInsert.clearFields;
begin
  edtName.Clear;
  warningOff;
  edtType.ItemIndex := 0;
  edtNumber.clear;
  edtCollection.Clear;
  edtMissing.Clear;
  edtStatus.ItemIndex := 0;
  btnSave.Enabled := false;
end;

procedure TfrmInsert.warningOff;
begin
  lblWarning.Visible := false;
  btnSave.Enabled := true;
end;

end.
