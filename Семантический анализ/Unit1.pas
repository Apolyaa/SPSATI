unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    OpenDialog1: TOpenDialog;
    Button1: TButton;
    Label1: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    ListBox4: TListBox;
    Label6: TLabel;
    Edit3: TEdit;
    Label7: TLabel;
    Button5: TButton;
    Edit4: TEdit;
    Label8: TLabel;
    Panel1: TPanel;
    Label2: TLabel;
    Memo2: TMemo;
    Edit5: TEdit;
    Edit6: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Edit7: TEdit;
    Label11: TLabel;
    Edit8: TEdit;
    Label12: TLabel;
    Button10: TButton;
    Button11: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

Const Ks=50000; // количество слов
      NameFRAT='Res.sat'; // файл результатов аналица текстов

Type
    Ta=array[1..Ks] of string[50];

    Tzw=record
    ms,ns:array [1..10] of string[50];
    end;

    Tzs=record
    w:string[50]; //слово
    c:char;       // первая буква
    n:word;       // номер -  в целом идентификатор смысла
    end;
    Tms=array[1..Ks] of Tzs;//семантический словарь в массиве
    Tw=string[50];
    Tids=string[6];

    Tps=array[1..Ks] of Tids; //для подсчета статистики
    pt=^rec;  rec=record c:Tids; k:word; ptr:pt; end;

    frec=record c:Tids; k:word; end;
    Trat=record    //структура записи файла БД результатов
         Inf:string[100]; //общая информация об анализируемом файле txt
         Namefile:string[100];
         m:array [1..100] of frec; //массив результатов анализа
         all:word; //всего слов в файле txt
         raspoz:word; //кол-во распознанных по семантическому словарю слов

         end;

  var
  Form1: TForm1;
  fname,San,s:string;
  ft:textfile;
  ftan:textfile;
  www,kkk,rrr,LLL:word; // количество слов
  a:Ta;     // массив слов исходного текста
  ftp: file of tzw; // семантический словарь
  zap:tzw;
  Mark,Markp,i,j:integer;
  setch:set of char;
  ch,cc:char;
  Fnam:string;
  Ss:Tms; //семантический словарь в маасиве
  Sb:Tzs;
  Ps:Tps;
  Mrec:array[1..Ks] of frec;
  brec:frec;
  FRAT:file of Trat; // файл результатов аналица
  DRAT:file of Trat; // для удаления
  ZRAT,NZRAT,ZRATP:Trat;
  FOPENR:boolean;
  POM:word;//кол-во помеченных

implementation

{$R *.dfm}

procedure Stat;
Var s,p:pt;  f:pointer;
    fl:boolean; {признак того,что запись уже вставлена}
    L,i,j:integer;
    Ds:string;
Begin
Form1.Listbox4.Clear;
if rrr>0 then
begin  //создаем первый элемент
    L:=length(Ps[1]);
    if L>0 then begin
      new(s); f:=s; i:=1;
      s^.ptr:=nil; s^.c:=Ps[i]; s^.k:=1;
    end;
while i<rrr do
begin
 i:=i+1; s:=f; fl:=false;
 while (s<>nil) and (not fl) do
     begin
     if Ps[i]=s^.c then begin s^.k:=s^.k+1; fl:=true end
     else
     if s^.ptr=nil then
     begin new(p); s^.ptr:=p; p^.c:=Ps[i]; p^.k:=1; p^.ptr:=nil;fl:=true end
     else s:=s^.ptr;
     end;
end;
end;
LLL:=0;  s:=f; { устанавливаем на первую запись }
     while s<>nil do
         begin
         LLL:=LLL+1;
         Mrec[LLL].c:=s^.c;
         Mrec[LLL].k:=s^.k;
         p:=s;  s:=s^.ptr;
         dispose(p);   {освобождаем память}
         end;
// сортировка по убыванию массива статистики
for i:=1 to LLL do
for j:=1 to LLL-1 do
if Mrec[j].k<Mrec[j+1].k then
begin brec:=Mrec[j]; Mrec[j]:=Mrec[j+1]; Mrec[j+1]:=brec; end;

for i:=1 to LLL do
Form1.ListBox4.Items.Append(Mrec[i].c +'-'+inttostr(Mrec[i].k));
end;




procedure poisk(w:Tw;var ids:Tids);
var n:integer;
begin
n:=1; ids:='?';
n:=0;  //последовательный метод поиска, а можно дихотомический
while n<kkk do
begin
inc(n);
if ss[n].w=w then
   begin
   ids:=floattostr(ss[n].n) + ss[n].c;
   n:=kkk;
   end;

end;


end;


procedure masword (e:string); //разбираем на слова
const
 c=[' ','.',',',':',';','-','+','=',
    '>','<','!','(',')','[',']','{',
    '}','*','?','#','/','\'];
var s:string;
    p,j,i,L,n1,n2:integer;
begin
  s:=' ' + e + ' ';
  L:=length(s);
   p:=1;
   while p<L do
   begin
    if (s[p] in c) and (not (s[p+1] in c)) then
      begin
      j:=p+1; while not(s[j+1] in c) do inc(j);
      www:=www+1;
      a[www]:=copy(s,p+1,j-p);
      p:=j;
      end;
      inc(p);
   end;
end;

procedure Analiz;
var ids:Tids;
begin
RRR:=0;
for i:=1 to www do
begin
poisk(a[i],ids);

if ids<>'?' then
begin
RRR:=RRR+1; // подсчет распознанных по словарю
Ps[rrr]:=ids;
end;

end;
Form1.Edit2.Text:=inttostr(RRR);

end;




//загрузка текста
procedure TForm1.Button1Click(Sender: TObject);
var i: word;
Ss,z :string;
setc:set of char;
begin
setc:=['а'..'я'];
Memo1.Clear; Memo2.Clear; 
OpenDialog1.Title :='Открыть файл'; OpenDialog1.FileName :='*.*';
if not OpenDialog1.Execute then exit;
Fname:=OpenDialog1.FileName;
Edit3.Text:=Fname;
Assignfile(Ft,Fname); //связывает файловую переменную с именем файла
 reset(Ft); //открываем файл для чтения
 for i:=1 to Ks do a[i]:='';

 WWW:=0; // кол. слов текста
  While not eof(Ft) do
   begin
   readln(Ft,S);
   masword(s);//разбираем на слова СОЗДАЕМ МАССИВ А
   end;
   closefile(Ft);
   i:=1;
   if a[i]<>'' then
   while a[i]<>'' do
   begin
   memo1.Text:= memo1.Text+a[i]+#13#10;
   i:=i+1;
   end;
  Edit1.Text:=inttostr(www);
  Analiz;
   stat;
end;

procedure SortSem;
var i,j:integer; s1,s2:string;
begin
// сортировка по смыслу по двум полям
for i:=1 to kkk do
for j:=1 to kkk-1 do
begin
s1:=ss[j].c + inttostr(ss[j].n);
s2:=ss[j+1].c + inttostr(ss[j+1].n);
if s1>s2 then
begin sb:=ss[j]; ss[j]:=ss[j+1]; ss[j+1]:=sb; end;
end;
for i:=1 to kkk do //вывод массива семантического словаря
begin
s:=Ss[i].c+ inttostr(Ss[i].n)+'-'+Ss[i].w;
//Form1.ListBox2.Items.Append(S);
end;
end;

function Strout(w,mn:word;s1,s2:string):string;
var L,D,i:integer;S:string;
begin
s:=s1; L:=Length(s); D:=w-L;
if D>0 then for i:=1 to D do s:='  '+s;
if mn<=0 then begin Strout:=s;    end
else  for i:=1 to mn do s:=s+' ';
Strout:=s+s2;
end;

procedure OutZap;
begin
with Form1 do begin
Memo2.Clear;

Edit5.Text:=inttostr(Mark+1);
Edit6.Text:=inttostr(filesize(FRAT));


Memo2.Text:=Memo2.Text+'О Б Щ А Я  И Н Ф О Р М А Ц И Я'
            +#13#10+ ZRAT.Inf+#13#10+#13#10;
Memo2.Text:=Memo2.Text+'И М Я  Ф А Й Л А'
            +#13#10+ZRAT.Namefile+#13#10+#13#10;

Memo2.Text:=Memo2.Text+'Р Е З У Л Ь Т А Т Ы   А Н А Л И З А'+#13#10;
Memo2.Text:=Memo2.Text+'Всего слов: '+inttostr(ZRAT.all)+#13#10;
Memo2.Text:=Memo2.Text+'Распознано: '+inttostr(ZRAT.raspoz)+#13#10+#13#10;

Memo2.Text:=Memo2.Text+'С М Ы С Л - К О Л И Ч Е С Т В О'+#13#10;
for J:=1 to 100 do
if ZRAT.m[j].c<>'' then
begin
Memo2.Text:=Memo2.Text+Strout(6,25,ZRAT.m[j].c,
            inttostr(ZRAT.m[j].k))+#13#10;
end;
end;
end;





procedure TForm1.FormCreate(Sender: TObject);
begin
Form1.Memo1.Clear;  Form1.Memo2.Clear;
Edit7.text:=inttostr(Pom);
OutZap;
end;


//создание записи в бд
procedure TForm1.Button5Click(Sender: TObject);
var y:integer; SFN:string;
begin
if LLL>0 then begin
//Сохраняем в файле
SFN:=Fname; while pos('\',SFN)>0 do delete(SFN,1,pos('\',SFN));
// Формируем запись
ZRAT.Inf:=Edit4.Text;
ZRAT.Namefile:=SFN;
ZRAT.all:=strtoint(Edit1.Text);
ZRAT.raspoz:=strtoint(Edit2.Text);
for i:=1 to LLL do   begin   ZRAT.m[i].c:=''; ZRAT.m[i].k:=0;  end;
for i:=1 to LLL do
if i<=100 then
  begin
  ZRAT.m[i].c:=Mrec[i].c;
  ZRAT.m[i].k:=Mrec[i].k;
  end;

Mark:=0; seek(FRAT,Mark); read(FRAT,NZRAT);
if NZRAT.Inf<>'?' then Mark:=filesize(FRAT);
seek(FRAT,Mark);
write(FRAT,ZRAT);
OutZap;
end;
end;

//первая запись в бд
procedure TForm1.Button3Click(Sender: TObject);
begin
Mark:=0;
seek(FRAT,Mark);
read(FRAT,ZRAT);
OutZap;
end;
//последняя запись в бд
procedure TForm1.Button4Click(Sender: TObject);
begin
Mark:=filesize(FRAT)-1;
seek(FRAT,Mark);
read(FRAT,ZRAT);
OutZap;
end;
//предыдущая запись
procedure TForm1.Button2Click(Sender: TObject);
begin
if Mark>0 then
begin
dec(Mark);
seek(FRAT,Mark);
read(FRAT,ZRAT);
OutZap;
end;
end;
//следующая запись
procedure TForm1.Button6Click(Sender: TObject);
begin
 if Mark<filesize(FRAT)-1 then
begin
inc(Mark);
seek(FRAT,Mark);
read(FRAT,ZRAT);
OutZap;
end;
end;
//пометить записи
procedure TForm1.Button7Click(Sender: TObject);
begin
if ZRAT.Inf[1]<>'*' then
begin
if (filesize(FRAT)-Pom)>0 then begin
ZRAT.Inf:='*'+ZRAT.Inf;
OutZap;
seek(FRAT,Mark);
write(FRAT,ZRAT);
POM:=POM+1;
Edit7.text:=inttostr(Pom);
end else showmessage('Последнюю запись нельзя удалить!');

end;
end;
//снять пометку
procedure TForm1.Button9Click(Sender: TObject);
begin
if ZRAT.Inf[1]='*' then
begin
delete(ZRAT.Inf,1,1);
OutZap;
seek(FRAT,Mark);
write(FRAT,ZRAT);
POM:=POM-1;
Edit7.text:=inttostr(Pom);
end;
end;
//удалить помеченные
procedure TForm1.Button8Click(Sender: TObject);
var  ps:string; u:integer;
begin
if POM>0 then
begin
  if POM=filesize(FRAT) then
begin
 rewrite(FRAT);
 ZRAT.Inf:='?';
 ZRAT.Namefile:='';
 for u:=1 to 100 do
     begin ZRAT.m[u].c:=''; ZRAT.m[u].k:=0; end;
 Mark:=0; seek(FRAT,Mark); write(FRAT,ZRAT);
 ZRAT.all:=0;ZRAT.raspoz:=0;
 POM:=0; Edit7.text:=inttostr(Pom);
 OutZap;
end
else
begin
 ps:='P'+ NameFRAT;
 Assignfile(DRAT, ps);
 rewrite(DRAT);
 Mark:=0;
 while not eof(FRAT) do
 begin
 seek(FRAT,Mark); read(FRAT,ZRAT);
 if not(ZRAT.Inf[1]='*') then write(DRAT,ZRAT);
 inc(Mark);
 end;
 Pom:=0; Edit7.text:=inttostr(Pom);
  if filesize(DRAT)>0 then begin
  closefile(DRAT);
  closefile(FRAT);
  erase(FRAT);
  rename(DRAT,NameFRAT);
  Assignfile(FRAT, NameFRAT);
  reset(FRAT);
  Mark:=0;
  seek(FRAT,Mark);
  read(FRAT,ZRAT);
  OutZap;
  end;
  end;
end else showmessage('Помеченных на удаление нет!');
end;
//новый запрос
procedure TForm1.Button11Click(Sender: TObject);
begin
Edit8.Text:='';
end;
//поиск
procedure TForm1.Button10Click(Sender: TObject);
var sp,mes:string; flag:boolean;
k:integer;
begin
if FOPENR then
begin
sp:=edit8.Text;
if (sp<>'') and (filesize(FRAT)>1) then
begin
if button10.Caption='Найти' then Markp:=-1;
flag:=false;
while (not eof(FRAT)) and (not flag) do
begin
inc(Markp);
seek(FRAT,Markp);
read(FRAT,ZRATP);
   k:=pos(sp,ZRATP.Inf);
   if k>0 then flag:=true;
end;
if flag=false then
begin
 if button10.Caption='Найти' then begin
         mes:='С Л О В О "'+sp+'" О Т С У Т С Т В У Е Т !';
         showmessage(mes);
         seek(FRAT,Mark)
         end else
         begin
         mes:='С Л О В А "'+sp+'" Б О Л Ь Ш Е   Н Е Т !';
         showmessage(mes);
         end;
         button10.Caption:='Найти';
end
else
begin
ZRAT:=ZRATP;
Mark:=Markp;
Outzap;
button10.Caption:='Найти далее';
end;
end;
end;
end;

INITIALIZATION
www:=0;
// собираем раздельные файлы в единый массив-семантического словаря
setch:=['а'..'п','р'..'я'];
kkk:=0;
for ch:='а' to 'я' do
if ch in setch then
begin
fnam:=ch+ch+'.ss';
if filesearch(fnam,'')<>'' then
begin
Assignfile(Ftp,Fnam);
reset(ftp); Mark:=0;
while not eof(ftp) do begin
   seek(ftp,Mark);read(ftp,zap);  inc(Mark);
   cc:=zap.ms[1][1];
   for i:=1 to 10 do
      if zap.ms[i]<>'*' then
      begin
      inc(kkk); ss[kkk].w:=zap.ms[i]; ss[kkk].c:=cc; ss[kkk].n:=Mark; end;
   for i:=1 to 10 do
      if zap.ns[i]<>'*' then
      begin inc(kkk); ss[kkk].w:=zap.ns[i]; ss[kkk].c:=cc; ss[kkk].n:=Mark; end;

end;
closefile(ftp);
end;
end;

// сортировка семантического словаря
for i:=1 to kkk do
for j:=1 to kkk-1 do
if ss[j].w>ss[j+1].w then
begin sb:=ss[j]; ss[j]:=ss[j+1]; ss[j+1]:=sb; end;


FOPENR:=false;
Assignfile(FRAT, NameFRAT);  Mark:=0;
if filesearch(NameFRAT,'')<>'' then
begin
reset(FRAT);Pom:=0;
while not eof(FRAT)do
begin
read(FRAT,ZRAT);
if ZRAT.Inf[1]='*' then inc(Pom);
end;
seek(FRAT,Mark);
read(FRAT,ZRAT);
end
else begin
 rewrite(FRAT);
 ZRAT.Inf:='?';
 write(FRAT,ZRAT);
end;
FOPENR:=true;


FINALIZATION
if   FOPENR then closefile(FRAT);



end.




