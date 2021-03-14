unit alphaView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids,
  Data.DB, Vcl.Imaging.jpeg, Vcl.ExtCtrls;

type
  TfrmAlphaView = class(TForm)
    ImgBack: TImage;
    Label1: TLabel;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Button5: TButton;
    radA: TRadioButton;
    radB: TRadioButton;
    radC: TRadioButton;
    radD: TRadioButton;
    radE: TRadioButton;
    radF: TRadioButton;
    radG: TRadioButton;
    radH: TRadioButton;
    radI: TRadioButton;
    radJ: TRadioButton;
    radK: TRadioButton;
    radL: TRadioButton;
    radM: TRadioButton;
    radN: TRadioButton;
    radO: TRadioButton;
    radP: TRadioButton;
    radQ: TRadioButton;
    radR: TRadioButton;
    radS: TRadioButton;
    radT: TRadioButton;
    radU: TRadioButton;
    radV: TRadioButton;
    radW: TRadioButton;
    radX: TRadioButton;
    radY: TRadioButton;
    radZ: TRadioButton;
    rad0: TRadioButton;
    rad1: TRadioButton;
    rad2: TRadioButton;
    rad3: TRadioButton;
    rad4: TRadioButton;
    rad5: TRadioButton;
    rad6: TRadioButton;
    rad7: TRadioButton;
    rad8: TRadioButton;
    rad9: TRadioButton;
    Label2: TLabel;
    procedure Button5Click(Sender: TObject);
    procedure radAClick(Sender: TObject);
    procedure radBClick(Sender: TObject);
    procedure radCClick(Sender: TObject);
    procedure radDClick(Sender: TObject);
    procedure radEClick(Sender: TObject);
    procedure radFClick(Sender: TObject);
    procedure radGClick(Sender: TObject);
    procedure radHClick(Sender: TObject);
    procedure radIClick(Sender: TObject);
    procedure radJClick(Sender: TObject);
    procedure radKClick(Sender: TObject);
    procedure radLClick(Sender: TObject);
    procedure radMClick(Sender: TObject);
    procedure radNClick(Sender: TObject);
    procedure radOClick(Sender: TObject);
    procedure radPClick(Sender: TObject);
    procedure radQClick(Sender: TObject);
    procedure radRClick(Sender: TObject);
    procedure radSClick(Sender: TObject);
    procedure radTClick(Sender: TObject);
    procedure radVClick(Sender: TObject);
    procedure radWClick(Sender: TObject);
    procedure radXClick(Sender: TObject);
    procedure radYClick(Sender: TObject);
    procedure radZClick(Sender: TObject);
    procedure rad0Click(Sender: TObject);
    procedure rad1Click(Sender: TObject);
    procedure rad2Click(Sender: TObject);
    procedure rad3Click(Sender: TObject);
    procedure rad4Click(Sender: TObject);
    procedure rad5Click(Sender: TObject);
    procedure rad6Click(Sender: TObject);
    procedure rad7Click(Sender: TObject);
    procedure rad8Click(Sender: TObject);
    procedure rad9Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ImgBackMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure filterQuery(first, second: String);
  end;

var
  frmAlphaView: TfrmAlphaView;

implementation

{$R *.dfm}

uses data;

procedure TfrmAlphaView.Button5Click(Sender: TObject);
begin
  close;
end;

procedure TfrmAlphaView.filterQuery(first, second: string);
begin
  DataModule1.qAlpha.Active := false;
  Datamodule1.qAlpha.Parameters.ParamByName('value1').Value := first;
  Datamodule1.qAlpha.Parameters.ParamByName('value2').Value := second;
  Datamodule1.qAlpha.Active := true;
  DBGrid1.Refresh;
end;

procedure TfrmAlphaView.FormCreate(Sender: TObject);
begin
  filterQuery('A', 'B');
end;

procedure TfrmAlphaView.FormMouseDown(Sender: TObject; Button: TMouseButton;
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

procedure TfrmAlphaView.ImgBackMouseDown(Sender: TObject; Button: TMouseButton;
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

procedure TfrmAlphaView.rad0Click(Sender: TObject);
begin
  filterQuery('0', '1');
end;

procedure TfrmAlphaView.rad1Click(Sender: TObject);
begin
  filterQuery('1', '2');
end;

procedure TfrmAlphaView.rad2Click(Sender: TObject);
begin
  filterQuery('2', '3');
end;

procedure TfrmAlphaView.rad3Click(Sender: TObject);
begin
  filterQuery('3', '4');
end;

procedure TfrmAlphaView.rad4Click(Sender: TObject);
begin
  filterQuery('4', '5');
end;

procedure TfrmAlphaView.rad5Click(Sender: TObject);
begin
  filterQuery('5', '6');
end;

procedure TfrmAlphaView.rad6Click(Sender: TObject);
begin
  filterQuery('6', '7');
end;

procedure TfrmAlphaView.rad7Click(Sender: TObject);
begin
  filterQuery('7', '8');
end;

procedure TfrmAlphaView.rad8Click(Sender: TObject);
begin
  filterQuery('8', '9');
end;

procedure TfrmAlphaView.rad9Click(Sender: TObject);
begin
  filterQuery('9', ':');
end;

procedure TfrmAlphaView.radAClick(Sender: TObject);
begin
  filterQuery('A', 'B');
end;

procedure TfrmAlphaView.radBClick(Sender: TObject);
begin
  filterQuery('B', 'C');
end;

procedure TfrmAlphaView.radCClick(Sender: TObject);
begin
  filterQuery('C', 'D');
end;

procedure TfrmAlphaView.radDClick(Sender: TObject);
begin
  filterQuery('D', 'E');
end;

procedure TfrmAlphaView.radEClick(Sender: TObject);
begin
  filterQuery('E', 'F');
end;

procedure TfrmAlphaView.radFClick(Sender: TObject);
begin
  filterQuery('F', 'G');
end;

procedure TfrmAlphaView.radGClick(Sender: TObject);
begin
  filterQuery('G', 'H');
end;

procedure TfrmAlphaView.radHClick(Sender: TObject);
begin
  filterQuery('H', 'I');
end;

procedure TfrmAlphaView.radIClick(Sender: TObject);
begin
  filterQuery('I', 'J');
end;

procedure TfrmAlphaView.radJClick(Sender: TObject);
begin
  filterQuery('J', 'K');
end;

procedure TfrmAlphaView.radKClick(Sender: TObject);
begin
  filterQuery('K', 'L');
end;

procedure TfrmAlphaView.radLClick(Sender: TObject);
begin
  filterQuery('L', 'M');
end;

procedure TfrmAlphaView.radMClick(Sender: TObject);
begin
  filterQuery('M', 'N');
end;

procedure TfrmAlphaView.radNClick(Sender: TObject);
begin
  filterQuery('N', 'O');
end;

procedure TfrmAlphaView.radOClick(Sender: TObject);
begin
  filterQuery('O', 'P');
end;

procedure TfrmAlphaView.radPClick(Sender: TObject);
begin
  filterQuery('P', 'Q');
end;

procedure TfrmAlphaView.radQClick(Sender: TObject);
begin
  filterQuery('Q', 'R');
end;

procedure TfrmAlphaView.radRClick(Sender: TObject);
begin
  filterQuery('R', 'S');
end;

procedure TfrmAlphaView.radSClick(Sender: TObject);
begin
  filterQuery('S', 'T');
end;

procedure TfrmAlphaView.radTClick(Sender: TObject);
begin
  filterQuery('T', 'U');
end;

procedure TfrmAlphaView.radVClick(Sender: TObject);
begin
  filterQuery('V', 'W');
end;

procedure TfrmAlphaView.radWClick(Sender: TObject);
begin
  filterQuery('W', 'X');
end;

procedure TfrmAlphaView.radXClick(Sender: TObject);
begin
  filterQuery('X', 'Y');
end;

procedure TfrmAlphaView.radYClick(Sender: TObject);
begin
  filterQuery('Y', 'Z');
end;

procedure TfrmAlphaView.radZClick(Sender: TObject);
begin
  filterQuery('Z', '[');
end;

end.
