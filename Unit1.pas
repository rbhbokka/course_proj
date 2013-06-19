unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Menus;

type
  TForm1 = class(TForm)
    Memo2: TMemo;
    Memo1: TMemo;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    MainMenu1: TMainMenu;
    file1: TMenuItem;
    open1: TMenuItem;
    rle1: TMenuItem;
    openfile1: TMenuItem;
    exit1: TMenuItem;
    texttorle1: TMenuItem;
    rletotext1: TMenuItem;
    Lzwdecompress1: TMenuItem;
    clear1: TMenuItem;
    rletotext2: TMenuItem;
    ext1: TMenuItem;
    rletofile1: TMenuItem;
    N1: TMenuItem;
    Rle2: TMenuItem;





    procedure open1Click(Sender: TObject);
    procedure openfile1Click(Sender: TObject);
    procedure exit1Click(Sender: TObject);
    procedure texttorle1Click(Sender: TObject);
    procedure rletotext1Click(Sender: TObject);

    procedure Lzwdecompress1Click(Sender: TObject);

    procedure clear1Click(Sender: TObject);

    procedure rletotext2Click(Sender: TObject);
    procedure rletofile1Click(Sender: TObject);
    procedure Rle2Click(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Time1,Time2 : integer;
  inFile,lzwFile: string;



implementation

{$R *.dfm}

//-----------------------------------rle---------------------------------------
function encode(s:string):string;
var i,j:integer;
    newS:string;
begin
  i:=1;
  while i <= length(s) do
  begin
    j:=i;
    while (j<length(s))and(s[i] = s[j+1]) do inc(j);
    if (j-i = 0) or (j-i = 1) then
    begin
      newS := newS + s[i];
      inc(i);
    end else
    begin
      newS := newS + inttostr(j-i+1) + s[i];
      inc(i,j-i+1);
    end;
  end;
  result:= newS;
end;

function decode(s:string):string;
var i,j,c:integer;
    newS:string;
begin
//time1 := Form1.GetCPUTick;
i:=1;
while i <= length(s) do
  begin
    j:=i;
    while s[j] in ['0'..'9'] do inc(j);
    if j-i > 0 then
    begin
      for c:=1 to strtoint(copy(s,i,j-i)) do newS := newS + s[j];
      delete(s,i,j-i+1);
    end else
    begin
      newS := newS + s[i];
      inc(i);
    end;
  end;
  result:= newS;
// time2 := GetCPUTick;
end;

{function GetCPUTick: int64; assembler;
asm
db 0fh,31h; //rdtsc
end;}
//---------------------------------rle_end---------------------------------------


//---------------------------------lzw_compress_procedures-------------------------------------
  Type FType1=0..4095;
     FType2=256..4095;
     Kodi=record
        Kod1:FType1;                   {код1-элеме­т т блицы}
        Kod2:byte;                     {код2-элеме­т кот приб вл. к коду1}
     End;

  Var
    Table1:array[byte] of byte;     {Т блиц  кодов от 0 до 255}
    Table2:array[FType2] of kodi; {Т блиц  кодов от 256 до 4095}
    FileIn :File of byte;          {Вход­ой ф йл}
    FileLzw:File of FType1;       {Уп ков ­­ый ф йл}
    FL1:FType2;

    FL2:FType1;
    Flag:boolean;
    Stroka:Kodi;
    Symbol:byte;
    i:FType2;
    Del,Kolvo:Longint;

  Procedure InitTable1;   {и­ици лиз т блицы состоящей из цепочек по од­ому символу}
Var i:byte;
Begin
  For i:=0 to 255 do Table1[i]:=i;
End;

Procedure InitTable2;   {и­ици лиз т блицы состоящей из цепочек ­еск. символов}
Var i:FType2;
Begin
  For i:=256 to 4094 do Table2[i].Kod1:=4095;
End;
//---------------------------------------------------------------------------------------------------
Procedure Coder(St1:FType1;St2:byte); {Проверяет, есть ли St1+St2 в т блице}
var i:FType2;
Begin                                 {FL2-код подстроки St1}
   FL2:=St1;                          {FL1-код строки St1+St2}
   Flag:=False;
   For i:=256 to 4094 do   {проверяем есть ли в т бл. код строки1 и код строки2}
   if (Table2[i].Kod1=St1) and (Table2[i].Kod2=St2) then
   Begin
      FL2:=FL1; Flag:=True; FL1:=i;
      Break;
   End;
End;
//--------------------------------lzw_compr_end----------------------------------

//--------------------------------lzw_decompr-------------------------------------

 Type //FType1=0..4095;
     //FType2=256..4095;
     FType3=0..3840;
     //kodi=record
       // Kod1:FType1;
        //Kod2:byte;
Var
    //Table1:array[byte]of byte;
    //Table2:array[FType2]of Kodi;
    //FileLzw:File of FType1;
    FileOut:File of byte;
    //FL1:FType2;
    //FL2:FType1;
    myFile:File of char;
    StrokaKodi:array[0..3840]of byte;
    j,Index,k:FType3;
    SymbolOld,SymbolNew:FType1;
    Symb:byte;
    //i:FType2;
    //Kolvo:Longint;


//------------------------------------------------------------------------------------------------------
Procedure Trans(Kod:FType1); {Переводит код в цепочку символов(б йт)}
Var  F:boolean;
    j1:FType3;
Begin
   Index:=0;
   For j1:=0 to 3840 do StrokaKodi[j1]:=0;
       if (Kod<=255) then
   Begin
        StrokaKodi[0]:=Kod;
        Exit;
   End;
   F:=True;  j1:=0;
   Repeat
     StrokaKodi[j1]:=Table2[Kod].Kod2; {присв полслед б йт ­ ш цепочке}
     Inc(Index);
     inc(j1);
     If Table2[Kod].Kod1<=255 then   {если код пред подстроки 255, те подстрок  сост из 1 симв}
     begin
     StrokaKodi[j1]:=Table2[Kod].Kod1;   {в м ссив з пис этот символ}
     F:=False end
              else kod:=Table2[KOd].Kod1;  {и­ че з пис. код подстроки сост. из ­еск. симв.}
   Until F=False;
End;
//-------------------------------lzw_decompr-------------------------------
Procedure lzw_decompress();
begin
   InitTable1; InitTable2;
   AssignFile(FileLzw, lzwFile);
   AssignFile(FileOut, inFile);
   {$I-}Reset(FileLzw);{$I+}
   If IoResult<>0 then Form1.Memo2.Lines.Add('ошибка ввода/вывода');
   Rewrite(FileOut);
   i:=256;
   Read(FileLzw,SymbolOld);
   Symb:=SymbolOld;
   Write(FileOut,Symb);
   While Not EOF(FileLzw) do
   Begin
      Read(FileLzw,SymbolNew);
      If (SymbolNew)>=i Then
      Begin
         Trans(SymbolOld);
         Inc(Index);
         for k:=Index downto 0 do StrokaKodi[k+1]:=StrokaKodi[k];
         StrokaKodi[0]:=Symb;
      End
      Else Trans(SymbolNew);
   For j:=Index downto 0 do Write(FileOut,StrokaKodi[j]); {з пис строчку в обр т порядке}
   Symb:=StrokaKodi[Index];  {перв. эл-т цепочки присв б йту}
   Table2[i].Kod1:=SymbolOld; {з водим в т бл. ­ов.элеме­т, пред. эл-т}
   Table2[i].Kod2:=Symb;      {доб к ­ему символ}
   SymbolOld:=SymbolNew;    {­ йд. пред. эл-т з писыв ем в считыв емый}
   If i<4094 then Inc(i) else     {выч и­декс с к ким будет доб вле­ след. эл-т}
      Begin                          {если т блиц  перепол­е­ , то очищ ем ее}
         InitTable2;
         i:=256;
      End;

   End;
   Form1.Memo2.Lines.Clear;
    Form1.Memo2.Lines.Add('Размер сжатого файла: '+IntToStr(Filesize(FileLzw))+' байт');
    Form1.Memo2.Lines.Add('Размер несжатого файла: '+IntToStr(Filesize(FileOut))+' байт');
    Form1.Memo2.Lines.Add('Выгода: '+IntToStr((Filesize(FileOut)-Filesize(FileLzw)))+' байт');
    Close(FileLzw);
    Close(FileOut);
end;

procedure lzw_compression();
 begin
   InitTable1;InitTable2;
   AssignFile(FileIn, inFile);
   AssignFile(FileLzw, lzwFile);
   {$I-}Reset(FileIn);{$I+}
   if IoResult<>0 then Form1.Memo2.Lines.Add('ошибка ввода/вывода');
   Rewrite(FileLzw);

   i:=256;
   Read(FileIn,Symbol);  {считыв ем б йт}
   Stroka.Kod1:=Symbol;  {з писыв ем в код1 з­ че­ие счит. б йл }
   While Not EOF(FileIn) do  {продолж ем то тех пор пок  ­е ко­ец ф йл }
   Begin
      Read(FileIn,Symbol);   {счит. след. б йт}
      Stroka.Kod2:=Symbol;   {з пис счит б йт в код2}
      Coder(Stroka.Kod1,Stroka.Kod2); {провер есть ли в т блице эл-т р в­ый строке }
      If Flag=True           {есть в т блице}
         Then Stroka.Kod1:=FL1  {строке присв ив. ­ йд элеме­т т блицы}
              Else              {и­ че}
      Begin
         Write(FileLzw,FL2);     {з писыв ем в выход­ой ф йл код пред. элеме­т }
         Table2[i].Kod1:=FL2;    {доб вляем в т блицу код пред элеме­т}
         Table2[i].Kod2:=Stroka.Kod2; {доб элем кот приб к пред ­ йд эл}
         If i<4094 then Inc(i) else   {выч. и­декс для след. эл-т  т блицы}
         Begin
            InitTable2;               {если о­ = 4095}
            i:=256;                   {очищ ем т блицу, код очистки = 256}
         End;
         Stroka.Kod1:=Stroka.Kod2;    {код р ве­ послед. счит б йту}
      End;

    End;

    Form1.Memo2.Lines.Clear;
    Form1.Memo2.Lines.Add('Размер сжатого файла: '+IntToStr(Filesize(FileLzw))+' байт');
    Form1.Memo2.Lines.Add('Размер несжатого файла: '+IntToStr(Filesize(FileIn))+' байт');
    Form1.Memo2.Lines.Add('Выгода: '+IntToStr((Filesize(FileIn)-Filesize(FileLzw)))+' байт');
    Coder(Stroka.Kod1,Stroka.Kod2);    {проверяем ост вшуюся цепочку, ищем ее код}
    Write(FileLzw,FL2);                {з пис. код в выход­ой ф йл}
    CloseFile(FileIn);
    CloseFile(FileLzw);
  end;
//---------------------------------lzw_end---------------------------------------

procedure TForm1.clear1Click(Sender: TObject);

begin
{$I-}
  Memo1.Clear;
  Memo2.Clear;
  CloseFile(FileIn);
  CloseFile(FileLzw);
  Memo2.Lines.Add('Очищено');
  DeleteFile('decompressed_temp.txt')  {$I+}
end;


procedure TForm1.exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.Lzwdecompress1Click(Sender: TObject);
var starttime,endtime,q:int64;
begin
      if OpenDialog1.Execute then
      lzwFile := Form1.OpenDialog1.FileName;
      if SaveDialog1.Execute then
      inFile := Form1.SaveDialog1.FileName;
      starttime:=GetTickCount;
      lzw_decompress ;

      Memo1.Lines.Clear;
      Memo1.Lines.Add('сжатый файл не является строковым, не содержит читаемого текста');
      Memo1.Lines.Add('поэтому показывать что-то не имеет смысла');
      endtime:=GetTickCount; q:=endtime-starttime;
      Memo2.Lines.Add('время выполнения: ~'+IntToStr(q)+' мс');

end;



procedure TForm1.open1Click(Sender: TObject);

    var starttime,endtime,q:int64;
begin
   starttime:=GetTickCount;
   Memo1.Lines.SaveToFile('decompressed.txt');
   inFile := 'decompressed.txt';
   if SaveDialog1.Execute then
      lzwFile := Form1.SaveDialog1.FileName;
   lzw_compression;
   Memo1.Lines.Clear;
   endtime:=GetTickCount; q:=endtime-starttime;
   Memo2.Lines.Add('время выполнения: ~'+IntToStr(q)+' мс');
end;

procedure TForm1.openfile1Click(Sender: TObject);
 var
    Output:string;
    starttime,endtime,q:int64;
 begin
  starttime:=GetTickCount;
  Memo2.Lines.Clear;
  Memo2.Lines.Add('Длина текста до: '+ IntToStr(length(Memo1.text)));
  Memo1.Text := encode(Memo1.Text) ;
  Memo2.Lines.Add('Длина текста после: '+ IntToStr(length(Memo1.text)));

  endtime:=GetTickCount; q:=endtime-starttime;
  Memo2.Lines.Add('время выполнения: ~'+IntToStr(q)+' мс');
 end;

procedure TForm1.Rle2Click(Sender: TObject);
var
    Output:string;
    starttime,endtime,q:int64;
 begin
  starttime:=GetTickCount;
  Memo2.Lines.Clear;
  Memo2.Lines.Add('Длина текста до: '+ IntToStr(length(Memo1.text)));
  Memo1.Text := encode(Memo1.Text) ;
  endtime:=GetTickCount; q:=endtime-starttime;
  with SaveDialog1, Memo1 do
      if Execute then
        begin
           Lines.SaveToFile(FileName);
           OpenDialog1.FileName:=FileName;
        end;
  Memo2.Lines.Add('Длина текста после: '+ IntToStr(length(Memo1.text)));


  Memo2.Lines.Add('время выполнения: ~'+IntToStr(q)+' мс');
 end;

procedure TForm1.rletofile1Click(Sender: TObject);
 var
    Output:string;
    starttime,endtime,q:int64;
 begin
  starttime:=GetTickCount;
  Memo2.Lines.Clear;
  Memo2.Lines.Add('Длина текста до: '+ IntToStr(length(Memo1.text)));
  Memo1.Text := decode(Memo1.Text) ;
  with SaveDialog1, Memo1 do
      if Execute then
        begin
           Lines.SaveToFile(FileName);
           OpenDialog1.FileName:=FileName; // Чтобы исправленный текст не затёр источник
        end;
  Memo2.Lines.Add('Длина текста после: '+ IntToStr(length(Memo1.text)));


  endtime:=GetTickCount; q:=endtime-starttime;
  Memo2.Lines.Add('время выполнения: ~'+IntToStr(q)+' мс');
 end;

procedure TForm1.rletotext1Click(Sender: TObject);
var starttime,endtime,q:int64;
begin
      if OpenDialog1.Execute then
      inFile := Form1.OpenDialog1.FileName;
      if SaveDialog1.Execute then
      lzwFile := Form1.SaveDialog1.FileName;
      starttime:=GetTickCount;
      lzw_compression;

      Memo1.Lines.Clear;
      //Memo1.Lines.Add('сжатый файл не является строковым, не содержит читаемого текста');
      //Memo1.Lines.Add('поэтому показывать что-то не имеет смысла');
      endtime:=GetTickCount; q:=endtime-starttime;
      Memo2.Lines.Add('время выполнения: ~'+IntToStr(q)+' мс');
end;

procedure TForm1.rletotext2Click(Sender: TObject);
  var starttime,endtime,q:int64;
begin
  starttime:=GetTickCount;
  Memo2.Lines.Add('Длина текста до: '+ IntToStr(length(Memo1.text)));
  Memo1.Text := decode(Memo1.Text);
   Memo2.Lines.Add('Длина текста после: '+ IntToStr(length(Memo1.text)));
  endtime:=GetTickCount; q:=endtime-starttime;
  Memo2.Lines.Add('время выполнения: '+IntToStr(q)+' мс');
end;


procedure TForm1.texttorle1Click(Sender: TObject);

   var starttime,endtime,q:int64;
begin
  if OpenDialog1.Execute then
      lzwFile := Form1.OpenDialog1.FileName;
  inFile := 'decompressed_temp.txt';
  starttime:=GetTickCount;
  lzw_decompress;
  Memo1.Lines.LoadFromFile('decompressed_temp.txt');
  endtime:=GetTickCount; q:=endtime-starttime;
  Memo2.Lines.Add('время выполнения: ~'+IntToStr(q)+' мс');
end;

end.
