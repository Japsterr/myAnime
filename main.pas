unit main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.jpeg, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Buttons;

type
  TfrmMain = class(TForm)
    ImgBack: TImage;
    Label1: TLabel;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button1: TButton;
    Button5: TButton;
    lblInfo: TLabel;
    Timer1: TTimer;
    procedure ImgBackMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Button1Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button2MouseEnter(Sender: TObject);
    procedure Button2MouseLeave(Sender: TObject);
    procedure Button3MouseEnter(Sender: TObject);
    procedure Button3MouseLeave(Sender: TObject);
    procedure Button4MouseEnter(Sender: TObject);
    procedure Button4MouseLeave(Sender: TObject);
    procedure Button1MouseEnter(Sender: TObject);
    procedure Button1MouseLeave(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses insert, delete, edit, view, splash, data;

procedure TfrmMain.Button1Click(Sender: TObject);
begin
   frmView := TfrmView.Create(self);
   frmView.ShowModal;
   frmView.Free;
end;

procedure TfrmMain.Button1MouseEnter(Sender: TObject);
begin
  lblInfo.Caption := 'Click Button to View Anime Collection';
  lblInfo.Visible := true;
end;

procedure TfrmMain.Button1MouseLeave(Sender: TObject);
begin
  lblInfo.Caption := '';
  lblInfo.Visible := true;
end;

procedure TfrmMain.Button2Click(Sender: TObject);
begin
  frmInsert := TfrmInsert.Create(self);
  frmInsert.ShowModal;
  frmInsert.Free;
end;

procedure TfrmMain.Button2MouseEnter(Sender: TObject);
begin
  lblInfo.Caption := 'Click Button to Insert New Series or Movie';
  lblInfo.Visible := true;

end;

procedure TfrmMain.Button2MouseLeave(Sender: TObject);
begin
  lblInfo.Caption := '';
  lblInfo.Visible := false;
end;

procedure TfrmMain.Button3Click(Sender: TObject);
begin
  frmEdit := TfrmEdit.Create(self);
  frmEdit.ShowModal;
  frmEdit.Free;
end;

procedure TfrmMain.Button3MouseEnter(Sender: TObject);
begin
  lblInfo.Caption := 'Click Button to Edit a Series or Movie';
  lblInfo.Visible := true;
end;

procedure TfrmMain.Button3MouseLeave(Sender: TObject);
begin
  lblInfo.Caption := '';
  lblInfo.Visible := false;
end;

procedure TfrmMain.Button4Click(Sender: TObject);
begin
  frmDelete := TfrmDelete.Create(self);
  frmDelete.ShowModal;
  frmDelete.free;
end;

procedure TfrmMain.Button4MouseEnter(Sender: TObject);
begin
  lblInfo.Caption := 'Click Button to Delete Series or Movie';
  lblInfo.Visible := true;
end;

procedure TfrmMain.Button4MouseLeave(Sender: TObject);
begin
  lblInfo.Caption := '';
  lblInfo.Visible := false;
end;

procedure TfrmMain.Button5Click(Sender: TObject);
begin
  close;
end;

procedure TfrmMain.ImgBackMouseDown(Sender: TObject; Button: TMouseButton;
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

procedure TfrmMain.Timer1Timer(Sender: TObject);
begin
  frmMain.Visible := true;
  Timer1.Enabled := false;
end;

end.
