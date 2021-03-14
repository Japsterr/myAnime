program myAnime;

uses
  Vcl.Forms,
  main in 'main.pas' {frmMain},
  insert in 'insert.pas' {frmInsert},
  edit in 'edit.pas' {frmEdit},
  delete in 'delete.pas' {frmDelete},
  view in 'view.pas' {frmView},
  splash in 'splash.pas' {frmSplash},
  data in 'data.pas' {DataModule1: TDataModule},
  editForm in 'editForm.pas' {frmEditForm},
  alphaView in 'alphaView.pas' {frmAlphaView},
  typeView in 'typeView.pas' {frmTypeView},
  statusView in 'statusView.pas' {frmStatusView};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TfrmSplash, frmSplash);
  Application.ShowMainForm := False;
  frmMain.Visible := False;
  frmSplash.Visible := true;
  Application.Run;
end.
