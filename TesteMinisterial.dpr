program TesteMinisterial;

uses
  Forms,
  Uteste in 'Uteste.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'TesteMinisterial';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
