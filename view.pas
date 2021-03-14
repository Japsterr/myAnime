unit view;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.jpeg, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Data.DB, RpCon, RpConDS, RpBase,
  RpSystem, RpDefine, RpRave;

type
  TfrmView = class(TForm)
    ImgBack: TImage;
    Button5: TButton;
    Label1: TLabel;
    Label2: TLabel;
    rad1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    RvProject1: TRvProject;
    RvSystem1: TRvSystem;
    RvDataSetConnection1: TRvDataSetConnection;
    Button1: TButton;
    procedure Button5Click(Sender: TObject);
    procedure DBGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ImgBackMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure RadioButton4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmView: TfrmView;

implementation

{$R *.dfm}

uses data, alphaView, statusView, typeView;

procedure TfrmView.Button1Click(Sender: TObject);
begin
  RvProject1.Open;
  RvPRoject1.Execute;
  RvProject1.Close;
end;

procedure TfrmView.Button5Click(Sender: TObject);
begin
  close;
end;

procedure TfrmView.DBGrid1MouseDown(Sender: TObject; Button: TMouseButton;
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

procedure TfrmView.FormCreate(Sender: TObject);
begin
  Datamodule1.qWholeCollection.Active := true;
end;

procedure TfrmView.ImgBackMouseDown(Sender: TObject; Button: TMouseButton;
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

procedure TfrmView.RadioButton2Click(Sender: TObject);
begin
  frmAlphaView := TfrmAlphaView.Create(self);
  frmAlphaView.ShowModal;
  frmAlphaView.Free;

  rad1.Checked := true;
end;

procedure TfrmView.RadioButton3Click(Sender: TObject);
begin
  frmTypeView := TfrmTypeView.Create(self);
  frmTypeView.ShowModal;
  frmTypeView.Free;

  rad1.Checked := true;
end;

procedure TfrmView.RadioButton4Click(Sender: TObject);
begin
  frmStatusView := TfrmStatusView.Create(self);
  frmStatusView.ShowModal;
  frmStatusView.Free;

  rad1.Checked := true;
end;

end.
