unit An1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    ListBox1: TListBox;
    Label1: TLabel;
    ListBox2: TListBox;
    Label2: TLabel;
    Label3: TLabel;
    Memo1: TMemo;
    Memo2: TMemo;
    ListBox3: TListBox;
    Button1: TButton;
    Label4: TLabel;
    Label5: TLabel;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure ListBox2Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;


Const
Ke=1000; // количество файлов
NameFRAT='Res.sat'; // файл результатов аналица текстов

  Type
  Tids=string[6];
  frec=record c:Tids; k:word; end;
Trat=record    //структура записи файла БД результатов
         Inf:string[100]; //общая информация об анализируемом файле txt
         Namefile:string[100];
         m:array [1..100] of frec; //массив результатов анализа
         all:word; //всего слов в файле txt
         raspoz:word; //кол-во распознанных по семантическому словарю слов
         end;
Tproc=record proc1,proc2:real; end;

Var
  MRAT:array[1..Ke] of Trat;
  Mproc:array [1..Ke] of Tproc;
  FRAT:file of Trat; // файл результатов анализа
  ZRAT,ZRAT1,ZRAT2:Trat;
  I,J,K1,K2:integer;
  MR:word; // реальное кол файлов в списке
  S:string;
implementation

{$R *.dfm}



function Strout(w,mn:word;s1,s2:string):string;
var L,D,i:integer;S:string;
begin
s:=s1; L:=Length(s); D:=w-L;
if D>0 then for i:=1 to D do s:='  '+s;
if mn<=0 then begin Strout:=s;    end
else  for i:=1 to mn do s:=s+' ';
Strout:=s+s2;
end;


procedure AnTwoText(ZRAT1,ZRAT2:Trat;var PROC1,PROC2:real);
var KSS,KSKS:word; // кол. совпадений по смыслу и смыслу и количеству
    OK1,OK2:word; // количество смыслов в первом и втором документе
begin

 KSS:=0; KSKS:=0; OK1:=0; OK2:=0;
 for I:=1 to 100 do if ZRAT1.m[I].c<>'' then OK1:=OK1+1;
 for I:=1 to 100 do if ZRAT2.m[I].c<>'' then OK2:=OK2+1;
for I:=1 to OK1 do
if ZRAT1.m[I].c<>'' then
begin
  for J:=1 to OK2 do
  if ZRAT2.m[J].c<>'' then
  begin
    if ZRAT1.m[I].c = ZRAT2.m[J].c then
    begin
    KSS:=KSS+1;
    if ZRAT1.m[I].k <= ZRAT2.m[J].k then KSKS:=KSKS+1;
    end;
  end;
end;
PROC1:=round((100/OK1)*KSS);
PROC2:=round((100/OK1)*KSKS);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
Memo1.Clear;     Memo2.Clear;
For i:=1 to MR do
begin
ListBox1.Items.Append(Mrat[I].Namefile);
ListBox2.Items.Append(Mrat[I].Namefile);
end;

end;
//одиночное сопоставление
procedure TForm1.Button1Click(Sender: TObject);
var KSS,KSKS:word; // кол. совпадений по смыслу и смыслу и количеству
    OK1,OK2:word; // количество смыслов в первом и втором документе
    PROC:real;
begin
ListBox3.Clear;
 KSS:=0; KSKS:=0; OK1:=0; OK2:=0;
 for I:=1 to 100 do if ZRAT1.m[I].c<>'' then OK1:=OK1+1;
 for I:=1 to 100 do if ZRAT2.m[I].c<>'' then OK2:=OK2+1;
if (OK1>0) and (OK2>0) then  begin
for I:=1 to OK1 do
if ZRAT1.m[I].c<>'' then
begin
  for J:=1 to OK2 do
  if ZRAT2.m[J].c<>'' then
  begin
    if ZRAT1.m[I].c = ZRAT2.m[J].c then
    begin
    KSS:=KSS+1;
    if ZRAT1.m[I].k <= ZRAT2.m[J].k then KSKS:=KSKS+1;
    end;
  end;
end;
S:='Результаты проверки файлов: '+ZRAT1.Namefile+' и '+ZRAT2.Namefile;
ListBox3.Items.Append(S);
S:='Количество совпавших по смыслу: '+ inttostr(KSS)
   +' из '+ inttostr(OK1); ListBox3.Items.Append(S);
S:='Количество входящих по смыслу и количеству: '+ inttostr(KSKS);
ListBox3.Items.Append(S);
 PROC:=round((100/OK1)*KSS);
ListBox3.Items.Append('Текст по смыслу заимствован на: '+floattostr(PROC)+'%');
PROC:=round((100/OK1)*KSKS);
ListBox3.Items.Append('Процент вхождения по смыслу и количеству: '+floattostr(PROC)+'%')
end
else showmessage('Нужно выбрать два файла для анализа!');

end;



procedure TForm1.ListBox1Click(Sender: TObject);
begin
Memo1.Clear;
K1:=Listbox1.ItemIndex+1;
//Memo1.Text:=inttostr(K1);
Memo1.Text:=Memo1.Text+'О Б Щ А Я  И Н Ф О Р М А Ц И Я'
            +#13#10+Mrat[K1].Inf+#13#10+#13#10;
Memo1.Text:=Memo1.Text+'И М Я  Ф А Й Л А'
            +#13#10+Mrat[K1].Namefile+#13#10+#13#10;

Memo1.Text:=Memo1.Text+'Р Е З У Л Ь Т А Т Ы   А Н А Л И З А'+#13#10;
Memo1.Text:=Memo1.Text+'Всего слов: '+inttostr(Mrat[K1].all)+#13#10;
Memo1.Text:=Memo1.Text+'Распознано: '+inttostr(Mrat[K1].raspoz)+#13#10+#13#10;


Memo1.Text:=Memo1.Text+'С М Ы С Л - К О Л И Ч Е С Т В О'+#13#10;
for J:=1 to 100 do
if Mrat[K1].m[j].c<>'' then
begin
Memo1.Text:=Memo1.Text+Strout(6,25,Mrat[K1].m[j].c,
            inttostr(Mrat[K1].m[j].k))+#13#10;
end;
ZRAT1:=Mrat[K1];

end;

procedure TForm1.ListBox2Click(Sender: TObject);
begin
Memo2.Clear;
K2:=Listbox2.ItemIndex+1;
//Memo2.Text:=inttostr(K2);
Memo2.Text:=Memo2.Text+'О Б Щ А Я  И Н Ф О Р М А Ц И Я'
            +#13#10+Mrat[K2].Inf+#13#10+#13#10;
Memo2.Text:=Memo2.Text+'И М Я  Ф А Й Л А'
            +#13#10+Mrat[K2].Namefile+#13#10+#13#10;

Memo2.Text:=Memo2.Text+'Р Е З У Л Ь Т А Т Ы   А Н А Л И З А'+#13#10;
Memo2.text:=Memo2.Text+'Всего слов: '+inttostr(Mrat[K2].all)+#13#10;
Memo2.Text:=Memo2.Text+'Распознано: '+inttostr(Mrat[K2].raspoz)+#13#10+#13#10;
Memo2.Text:=Memo2.Text+'С М Ы С Л - К О Л И Ч Е С Т В О'+#13#10;
for J:=1 to 100 do
if Mrat[K2].m[j].c<>'' then
begin
Memo2.Text:=Memo2.Text+Strout(6,25,Mrat[K2].m[j].c,
            inttostr(Mrat[K2].m[j].k))+#13#10;
end;

ZRAT2:=Mrat[K2];
end;
//множественное сравнение
procedure TForm1.Button2Click(Sender: TObject);
var PROC1,PROC2:real;
k,p:integer;
c:Tproc;
begin
Listbox3.Clear;
if ZRAT1.m[1].c<>'' then begin

for k:=1 to Mr do
if ZRAT1.Namefile<>Mrat[k].Namefile then
begin
AnTwoText(ZRAT1,MRAT[k],PROC1,PROC2);
Mproc[k].proc1:=PROC1;
Mproc[k].proc2:=PROC2;
end else begin Mproc[k].proc1:=0;
Mproc[k].proc2:=0;
 end;


for k:=1 to Mr do
 for p:=1 to Mr-1 do
  if Mproc[p].proc2<=Mproc[p+1].proc2 then
  begin
  c:=Mproc[p];  Mproc[p]:=Mproc[p+1]; Mproc[p+1]:=c;
  end;
ListBox3.Items.Append('АНАЛИЗ ТЕКСТА: '+ZRAT1.Namefile);

for k:=1 to Mr do
if Mproc[k].proc1<>0 then begin
ListBox3.Items.Append('По отношению к файлу: '+Mrat[k].Namefile);
ListBox3.Items.Append('Текст по смыслу заимствован на: '
 +floattostr(Mproc[k].PROC1)+'%');
ListBox3.Items.Append('Процент вхождения по смыслу и количеству: '
 +floattostr(Mproc[k].PROC2)+'%')

end;

end else showmessage('Нужно выбрать файл в первом окне для анализа!');;
end;

INITIALIZATION

Assignfile(FRAT,NameFRAT);


for I:=1 to Ke do  // обнуляем массив
begin   Mrat[I].Inf:=''; Mrat[I].Namefile:='';
for J:=1 to 100 do begin Mrat[I].m[j].c:=''; Mrat[I].m[j].k:=0; end;
end;

if filesearch(NameFRAT,'')<>'' then
begin
reset(FRAT);
MR:=0;
while not eof(FRAT) do
begin
read(FRAT,ZRAT);
inc(MR); Mrat[MR]:=ZRAT;
end;
closefile(FRAT)
end
else showmessage('Отсутствует файл: '+NameFRAT);



end.
