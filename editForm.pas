unit editForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.jpeg,
  Vcl.ExtCtrls, Data.DB;

type
  TfrmEditForm = class(TForm)
    ImgBack: TImage;
    Label1: TLabel;
    btnCancel: TButton;
    btnSave: TButton;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    edtStatus: TComboBox;
    edtMissing: TEdit;
    edtCollection: TEdit;
    edtNumber: TEdit;
    edtType: TComboBox;
    Label4: TLabel;
    lblWarning: TLabel;
    edtName: TEdit;
    Label3: TLabel;
    Button5: TButton;
    DataSource1: TDataSource;
    procedure Button5Click(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure ImgBackMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure edtNameKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnSaveClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    currentName: String;
  public
    { Public declarations }
    procedure display();
    procedure edit();
    function find():Boolean;
    procedure warningOn();
    procedure warningOff();
  end;

var
  frmEditForm: TfrmEditForm;

implementation

{$R *.dfm}

uses data;

procedure TfrmEditForm.btnCancelClick(Sender: TObject);
begin
  close;
end;

procedure TfrmEditForm.btnSaveClick(Sender: TObject);
begin
  edit();
  Showmessage('The series or movie has been successfully changed.');
  close;
end;

procedure TfrmEditForm.Button5Click(Sender: TObject);
begin
  close;
end;

procedure TfrmEditForm.ImgBackMouseDown(Sender: TObject; Button: TMouseButton;
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

procedure TfrmEditForm.display;
begin
  edtName.Text := Datamodule1.qWholeCollectionNamed.Value;
  edtType.Text := Datamodule1.qWholeCollectionType.Value;
  edtNumber.Text := Datamodule1.qWholeCollectionEpisodes.Value;
  edtCollection.Text := Datamodule1.qWholeCollectionTotal_Episodes.Value;
  edtMissing.Text := Datamodule1.qWholeCollectionEpisodes_Missing.Value;
  edtStatus.Text := Datamodule1.qWholeCollectionStatus.Value;
end;

procedure TfrmEditForm.edit;
begin
  Datamodule1.qWholeCollection.Edit;
  Datamodule1.qWholeCollectionNamed.Value := edtName.Text;
  Datamodule1.qWholeCollectionType.Value := edtType.Text;
  Datamodule1.qWholeCollectionEpisodes.Value := edtNumber.Text;
  Datamodule1.qWholeCollectionTotal_Episodes.Value := edtCollection.Text;
  Datamodule1.qWholeCollectionEpisodes_Missing.Value := edtMissing.Text;
  Datamodule1.qWholeCollectionStatus.Value := edtStatus.Text;
  Datamodule1.qWholeCollection.Post;
end;

procedure TfrmEditForm.edtNameKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (find) AND not(currentName = edtName.Text) then
    warningOn
  else
    warningOff;
end;

procedure TfrmEditForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Datamodule1.refreshTables;
end;

procedure TfrmEditForm.FormCreate(Sender: TObject);
begin
  display();
  currentName := edtName.Text;
end;

function TfrmEditForm.find;
var name : String;
    SearchOptions : TLocateOptions;
begin
  name := edtName.Text;
  SearchOptions := [loCaseInsensitive];
  result := DataModule1.tbCollection.Locate('Named', name, SearchOptions);
end;

procedure TfrmEditForm.warningOn;
begin
  lblWarning.Visible := true;
  btnSave.Enabled := false;
end;

procedure TfrmEditForm.warningOff;
begin
  lblWarning.Visible := false;
  btnSave.Enabled := true;
end;

end.
