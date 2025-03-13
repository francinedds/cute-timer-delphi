unit view.timer;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, ExtCtrls,
  Vcl.Buttons, System.ImageList, Vcl.ImgList, Vcl.Imaging.jpeg,
  Vcl.Imaging.pngimage;

type
  TViewTimer = class(TForm)
    Timer: TTimer;
    header: TPanel;
    btnFechar: TSpeedButton;
    btnMinimizar: TSpeedButton;
    Icones: TImageList;
    pnlBackground: TPanel;
    lblTimer: TLabel;
    background: TImage;
    pnlBtnToggle: TPanel;
    btnToggle: TSpeedButton;
    lblTitle: TLabel;
    Image: TImage;
    procedure TimerTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnToggleClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnMinimizarClick(Sender: TObject);
  private
     FCounter: Integer;
  public
    { Public declarations }
  end;

var
  ViewTimer: TViewTimer;

implementation

{$R *.dfm}

{ TForm2 }

procedure TViewTimer.btnFecharClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TViewTimer.btnMinimizarClick(Sender: TObject);
begin
  Application.Minimize;
end;

procedure TViewTimer.FormCreate(Sender: TObject);
begin
  FCounter := 0;

  // define o intervalo do timer
  Timer.Interval := 1000;  // 1000 = 1s
  Timer.Enabled := False;
end;

procedure TViewTimer.btnToggleClick(Sender: TObject);
begin
  if Timer.Enabled then
  begin
    Timer.Enabled := False;  // desabilita o Timer
    btnToggle.Caption := 'Start';
  end
  else
  begin
    Timer.Enabled := True;  // habilita o Timer
    FCounter := 0;  // Reseta o contador
    btnToggle.Caption := 'Stop';
  end;
end;

procedure TViewTimer.TimerTimer(Sender: TObject);
begin
  // incrementa o contador a cada 1 segundo
  Inc(FCounter);

  // atualiza o label com o tempo restante (em minutos e segundos)
  lblTimer.Caption := Format('%.2d:%.2d', [FCounter div 60, FCounter mod 60]);

  // verifica se 5 minutos se passaram
  if FCounter >= 300 then
  begin
    lblTimer.Enabled := False;
    btnToggle.Caption := 'Start';  // reseta o texto do botão
    ShowMessage('5 minutos se passaram!');
  end;
end;

end.
