program SetAutoRun;

uses
  Vcl.Forms,
  SetAutoRunFrm in 'SetAutoRunFrm.pas' {frmSetAutoRun};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmSetAutoRun, frmSetAutoRun);
  Application.Run;
end.
