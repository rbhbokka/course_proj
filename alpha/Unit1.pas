unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Memo2: TMemo;
    Button3: TButton;
    Button4: TButton;
    Memo1: TMemo;
    Button5: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;


implementation

{$R *.dfm}


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
end;

procedure TForm1.Button2Click(Sender: TObject);
  var
    Output:string;
 begin
  Memo1.Text := encode(Memo1.Text) ;

end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  Memo1.Text := decode(Memo1.Text);
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  Memo1.Clear;
end;

end.
