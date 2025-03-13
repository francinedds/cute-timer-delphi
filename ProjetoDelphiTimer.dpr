program ProjetoDelphiTimer;

uses
  Vcl.Forms,
  view.timer in 'views\view.timer.pas' {ViewTimer};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TViewTimer, ViewTimer);
  Application.Run;
end.
