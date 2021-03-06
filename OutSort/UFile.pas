unit UFile;

interface

uses
  SysUtils;

type
  TElem=integer;

  TFile=class
  private
    f: file of TElem;
    FFName: string;
    Flast: integer;
    Feosec: boolean;
    Feofile: boolean;
  protected
  public
    Constructor Create(s: string);
    destructor Destroy; override;
    procedure OpenRead;
    procedure OpenWrite;
    function IsEmpty: boolean;
    procedure NextSec;
    procedure RenameFile(s: string);
    procedure DeleteTFile;
    procedure Copy(F2: TFile);
    procedure CopySec(F2: TFile);
    procedure CloseTFile;
    property EOSec: boolean
      read FEOSec;
    property EOFile: boolean
      read FEOFile;
    property Last: integer
      read FLast;
    property FName: string
      read FFName;
  end;

implementation

{ TFileRead }

procedure TFile.CloseTFile;
begin
  closeFile(f);
end;

procedure TFile.Copy(F2: TFile);   //�������� ���� �������
begin
  write(f2.f,FLast);
  F2.Flast:=FLast;
  FEOFile:=eof(f);
  if not Feofile then
    read(f,FLast);
  FEOsec:=FEOFile or (F2.Flast>FLast);
end;

procedure TFile.CopySec(F2: TFile);   //�������� ������������������
begin
  while not FEOsec do
    Copy(F2);
end;

constructor TFile.Create(s: string);
begin
  FFName:=s;
  assignfile(f,s);
end;

procedure TFile.DeleteTFile;
begin
  DeleteFile(FName);
end;

destructor TFile.Destroy;
begin
  //closefile(f);
  inherited;
end;

function TFile.IsEmpty: boolean;
begin
  reset(f);
  result:=filesize(f)=0;
  close(f);
end;

procedure TFile.NextSec;
begin
    FEosec:=FEofile;
end;

procedure TFile.OpenRead;
begin
  reset(f);
  FEOsec:=eof(f);
  FEOfile:=eof(f);
  if not eof(f) then
    read(f,FLast);
end;

procedure TFile.OpenWrite;
begin
  rewrite(f);
end;


procedure TFile.RenameFile(s: string);
begin
  if FileExists(s) then
    DeleteFile(s);
  rename(f,s);
  FFName:=s;
end;

end.
