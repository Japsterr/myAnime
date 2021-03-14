unit statusView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids,
  Data.DB, Vcl.Imaging.jpeg, Vcl.ExtCtrls;

type
  TfrmStatusView = class(TForm)
    ImgBack: TImage;
    Label1: TLabel;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Button5: TButton;
    Label2: TLabel;
    radOne: TRadioButton;
    radTwo: TRadioButton;
    radThree: TRadioButton;
    radFour: TRadioButton;
    radFive: TRadioButton;
    procedure Button5Click(Sender: TObject);
    procedure radOneClick(Sender: TObject);
    procedure radTwoClick(Sender: TObject);
    procedure radThreeClick(Sender: TObject);
    procedure radFourClick(Sender: TObject);
    procedure radFiveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ImgBackMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure filterQuery(value:string);
  end;

var
  frmStatusView: TfrmStatusView;

implementation

{$R *.dfm}

uses delete, data;

procedure TfrmStatusView.Button5Click(Sender: TObject);
begin
  close;
end;

procedure TfrmStatusView.filterQuery(value: string);
begin
  Datamodule1.qStatus.Active := false;
  Datamodule1.qStatus.Parameters.ParamByName('value').Value := value;
  Datamodule1.qStatus.Active := true;
  DBGrid1.Refresh;
end;

procedure TfrmStatusView.FormCreate(Sender: TObject);
begin
  filterQuery('Complete');
end;

procedure TfrmStatusView.FormMouseDown(Sender: TObject; Button: TMouseButton;
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

procedure TfrmStatusView.ImgBackMouseDown(Sender: TObject; Button: TMouseButton;
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

procedure TfrmStatusView.radFiveClick(Sender: TObject);
begin
  filterQuery('Dont Know');
end;

procedure TfrmStatusView.radFourClick(Sender: TObject);
begin
  filterQuery('Ongoing');
end;

procedure TfrmStatusView.radOneClick(Sender: TObject);
begin
  filterQuery('Complete');
end;

procedure TfrmStatusView.radThreeClick(Sender: TObject);
begin
  filterQuery('Incomplete but downloading');
end;

procedure TfrmStatusView.radTwoClick(Sender: TObject);
begin
  filterQuery('Incomplete');
end;

end.
