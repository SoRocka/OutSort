unit UMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Uwork, ComCtrls, Grids, Spin;

type
  TForm1 = class(TForm)
    PageCtrl: TPageControl;
    SheetGrid: TTabSheet;
    SheetCheck: TTabSheet;
    GridMain: TStringGrid;
    MemoFile: TMemo;
    Label1: TLabel;
    SpinKolEl: TSpinEdit;
    ButRnd: TButton;
    ButReverse: TButton;
    ButSort: TButton;
    ButCheck: TButton;
    btnStart: TButton;
    procedure FormCreate(Sender: TObject);
    procedure ButRndClick(Sender: TObject);
    procedure ButSortClick(Sender: TObject);
    procedure ButCheckClick(Sender: TObject);
    procedure ButReverseClick(Sender: TObject);
    procedure btnStartClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.ButCheckClick(Sender: TObject);
var
  len: integer;

begin
  if CheckFile('_test.txt',len) then
    ShowMessage('���� ������������.')
  else
    ShowMessage('���� �� ������������.')
end;

procedure TForm1.ButReverseClick(Sender: TObject);
begin
  MakeReverseFile('_test.txt',SpinKolEl.Value);
  PrintToMemo('_test.txt',MemoFile);
  ButSort.Enabled:=true;
  ButCheck.Enabled:=false;
end;

procedure TForm1.ButRndClick(Sender: TObject);
begin
  MakeRndFile('_test.txt',SpinKolEl.Value);
  PrintToMemo('_test.txt',MemoFile);
  ButSort.Enabled:=true;
  ButCheck.Enabled:=false;
end;

procedure TForm1.ButSortClick(Sender: TObject);
var
  i: integer;

begin
  SortFile('_test.txt',i);
  PrintToMemo('_test.txt',MemoFile);
  ButCheck.Enabled:=true;
  ButSort.Enabled:=false;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  GridMain.ColWidths[0]:=130;
  GridMain.ColWidths[1]:=110;
  GridMain.ColWidths[2]:=100;
  GridMain.Cells[0,0]:='���������� ���������';
  GridMain.Cells[1,0]:='��������� ����';
  GridMain.Cells[2,0]:='�������� ����';
end;

procedure TForm1.btnStartClick(Sender: TObject);
const
  mas: array[1..6] of integer=(100,500,1000,5000,10000,20000);

var
  i: integer;
  zn: integer;

begin
  Gridmain.RowCount:=7;
  for i:=1 to 6 do
  begin
    GridMain.Cells[0,i]:=inttostr(mas[i]);
    MakeRndFile('_test.txt',mas[i]);
    SortFile('_test.txt',zn);
    GridMain.Cells[1,i]:=inttostr(zn);
    Application.ProcessMessages;

    MakeReverseFile('_test.txt',mas[i]);
    SortFile('_test.txt',zn);
    GridMain.Cells[2,i]:=inttostr(zn);
    Application.ProcessMessages;
  end;
end;

end.
