unit typeView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids,
  Data.DB, Vcl.Imaging.jpeg, Vcl.ExtCtrls;

type
  TfrmTypeView = class(TForm)
    ImgBack: TImage;
    Label1: TLabel;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Button5: TButton;
    Label2: TLabel;
    radMovie: TRadioButton;
    radSeries: TRadioButton;
    radAmv: TRadioButton;
    radClip: TRadioButton;
    radOva: TRadioButton;
    radOther: TRadioButton;
    procedure Button5Click(Sender: TObject);
    procedure radSeriesClick(Sender: TObject);
    procedure radMovieClick(Sender: TObject);
    procedure radAmvClick(Sender: TObject);
    procedure radClipClick(Sender: TObject);
    procedure radOvaClick(Sender: TObject);
    procedure radOtherClick(Sender: TObject);
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
  frmTypeView: TfrmTypeView;

implementation

{$R *.dfm}

uses data;

procedure TfrmTypeView.Button5Click(Sender: TObject);
begin
  close;
end;

procedure TfrmTypeView.filterQuery(value: string);
begin
  Datamodule1.qType.active := false;
  Datamodule1.qType.Parameters.ParamByName('value').Value := value;
  Datamodule1.qType.Active := true;
  DBGrid1.Refresh;
end;

procedure TfrmTypeView.FormCreate(Sender: TObject);
begin
  filterQuery('Movie');
end;

procedure TfrmTypeView.FormMouseDown(Sender: TObject; Button: TMouseButton;
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

procedure TfrmTypeView.ImgBackMouseDown(Sender: TObject; Button: TMouseButton;
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

procedure TfrmTypeView.radAmvClick(Sender: TObject);
begin
  filterQuery('AMV');
end;

procedure TfrmTypeView.radClipClick(Sender: TObject);
begin
  filterQuery('Clip');
end;

procedure TfrmTypeView.radMovieClick(Sender: TObject);
begin
  filterQuery('Movie');
end;

procedure TfrmTypeView.radOtherClick(Sender: TObject);
begin
  filterQuery('Other');
end;

procedure TfrmTypeView.radOvaClick(Sender: TObject);
begin
  filterQuery('OVA');
end;

procedure TfrmTypeView.radSeriesClick(Sender: TObject);
begin
  filterQuery('Series');
end;

end.
