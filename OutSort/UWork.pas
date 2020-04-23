unit UWork;

interface

uses
  UFile, StdCtrls, sysutils;


procedure PrintToMemo(s: string; Memo: TMemo);
procedure MakeRndFile(s: string; len: integer);
procedure MakeReverseFile(s: string; len: integer);
function CheckFile(s: string; var len: integer): boolean;
procedure SortFile(s: string; var see: integer);

implementation

procedure PrintToMemo(s: string; Memo: TMemo);
var
  f: file of integer;
  zn: integer;

begin
  Memo.Clear;
  assignfile(f,s);
  reset(f);
  Memo.Lines.Add('� ����� '+inttostr(filesize(f))+' ���������:');
  while not eof(f) do
  begin
    read(f,zn);
    Memo.Lines.Add(inttostr(zn));
  end;
  closefile(f);
end;

procedure SortFile(s: string; var see: integer);
var
  sourse: array [1 .. 2] of TFile;
  dest: array [1 .. 2] of TFile;
  idest, sumsec: integer; // ����� ���������� �����
  buf: TFile;
  f: file of TElem;

  procedure WriteSec(Dest: TFile);
  begin
    Sourse[1].NextSec;
    Sourse[2].NextSec;
    while (not Sourse[1].EOSec) and (not Sourse[2].EOSec) do
    begin
      inc(see);
      if Sourse[1].Last<Sourse[2].Last then
        Sourse[1].Copy(Dest)
      else
        Sourse[2].Copy(Dest);
    end;
    Sourse[1].CopySec(Dest);
    Sourse[2].CopySec(Dest);
  end;

  function FindMinElem: integer;
  begin
    result := MaxInt;
    see:=see+2;
    if (sourse[1].Last < result) and (not sourse[1].EOSec) then
      result := sourse[1].Last;
    if (sourse[2].Last < result) and (not sourse[2].EOSec) then
      result := sourse[2].Last;
  end;

begin
  see := 0;
  Sourse[1]:=TFile.Create(s);
  Sourse[1].RenameFile('_temp1.tmp');

  assignfile(f,'_temp2.tmp');
  rewrite(f);
  closefile(f);
  sourse[2]:=TFile.Create('_temp2.tmp');

  dest[1]:=TFile.Create('_temp3.tmp');

  dest[2]:=TFile.Create('_temp4.tmp');

  //sumsec:=2;
  repeat//while (sumsec>1) do
    sourse[1].OpenRead;
    sourse[2].OpenRead;
    dest[1].OpenWrite;
    dest[2].OpenWrite;
    idest := 1;
    sumsec:=0;
    if (not sourse[1].EOFile) or (not sourse[2].EOFile) then
    begin
      WriteSec(Dest[1]);
      inc(sumsec);
    end;
    if (not sourse[1].EOFile) or (not sourse[2].EOFile) then
    begin
      WriteSec(Dest[2]);
      inc(sumsec);
    end;
    while (not sourse[1].EOFile) or (not sourse[2].EOFile) do
    begin
      if FindMinElem>=Dest[idest].Last then WriteSec(Dest[idest]);
      WriteSec(Dest[idest]);   //�������� ���� ��������� ������������������
      inc(sumsec);
      idest:=3-idest;
    end;
    sourse[1].CloseTFile;
    sourse[2].CloseTFile;
    dest[1].CloseTFile;
    dest[2].CloseTFile;

    buf:=sourse[1];
    sourse[1]:=dest[1];
    dest[1]:=buf;

    buf:=sourse[2];
    sourse[2]:=dest[2];
    dest[2]:=buf;

  until sumsec<=1;
  Sourse[1].RenameFile(s);
  Sourse[2].DeleteTFile;
  Dest[1].DeleteTFile;
  Dest[2].DeleteTFile;

  Sourse[1].Destroy;
  Sourse[2].Destroy;
  Dest[1].Destroy;
  Dest[2].Destroy;
end;

procedure MakeRndFile(s: string; len: integer);
var
  f: file of integer;
  zn, i: integer;

begin
  assignfile(f, s);
  rewrite(f);
  for i := 1 to len do
  begin
    zn := Random(200000) - 100000;
    write(f, zn);
  end;
  closefile(f);
end;

procedure MakeReverseFile(s: string; len: integer);
var
  f: file of integer;
  i: integer;

begin
  assignfile(f, s);
  rewrite(f);
  for i := len downto 1 do
    write(f, i);
  closefile(f);
end;

function CheckFile(s: string; var len: integer): boolean;
var
  f: file of integer;
  prev, cur: integer;

begin
  result := true;
  assign(f,s);
  reset(f);
  len := filesize(f);
  read(f, prev);
  while (not eof(f)) and result do
  begin
    read(f, cur);
    if prev > cur then
      result := false;
  end;
  closefile(f);
end;

initialization

begin
  Randomize;
end;

end.
