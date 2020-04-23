program PrNatural;

uses
  Forms,
  UMain in 'UMain.pas' {Form1},
  UWork in 'UWork.pas',
  UFile in 'UFile.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
