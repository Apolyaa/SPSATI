unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Menus, ExtCtrls;

type
  TForm1 = class(TForm)
    OpenDialog1: TOpenDialog;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    OpenDialog2: TOpenDialog;
    Panel1: TPanel;
    Button1: TButton;
    ListBox1: TListBox;
    Label1: TLabel;
    Label2: TLabel;
    Panel2: TPanel;
    ListBox2: TListBox;
    Button6: TButton;
    ListBox3: TListBox;
    Label3: TLabel;
    Label4: TLabel;
    Edit1: TEdit;
    Label5: TLabel;
    Button7: TButton;
    Edit2: TEdit;
    Edit3: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    PopupMenu1: TPopupMenu;
    N111111: TMenuItem;
    N2221: TMenuItem;
    Button16: TButton;
    SaveDialog1: TSaveDialog;
    PopupMenu2: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure N111111Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure N2221Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

 tzw=record
 ms,ns:array [1..10] of string[50];
 end;


var
  Form1: TForm1;
  fname,s,fnametp : string;
Ft:textfile;
ftp: file of tzw;
Mark, Markp:integer;

zap,zapp:tzw;
nx1,nx2:integer;
FtpOK:boolean;
flag:boolean;
implementation

uses Unit2;

{$R *.dfm}

procedure Initlist(x:byte); //??????? listbox1 ? listbox2
var i:integer;
begin
With Form1 do begin
listbox2.Clear; listbox3.Clear;
for i:=0 to x-1 do
begin
ListBox2.Items.Append('*');
ListBox3.Items.Append('*');
end;
nx1:=0; ListBox2.ItemIndex:=nx1;
nx2:=0; ListBox3.ItemIndex:=nx2;
end;
end;

procedure FormZap; //???????????? ??????
var i:integer;
begin
for i:=1 to 10 do begin  zap.ms[i]:=''; zap.ns[i]:='';  end;
for i:=1 to 10 do
begin
Zap.ms[i]:= Form1.ListBox2.Items.Strings[i-1];
Zap.ns[i]:= Form1.ListBox3.Items.Strings[i-1];
end;
end;



procedure IndZap; //????? ??????
var i:integer;
begin
for i:=0 to 9 do
begin
 Form1.listbox2.Items.Insert(i,zap.ms[i+1]);
 Form1.ListBox2.Items.Delete(i+1);
 Form1.listbox3.Items.Insert(i,zap.ns[i+1]);
 Form1.ListBox3.Items.Delete(i+1);
 end;
Form1.label8.Caption:='????: '+inttostr(Mark+1);
Form1.label9.Caption:='?????: '+inttostr(filesize(ftp));
end;


procedure TForm1.Button1Click(Sender: TObject);
var i,L,v:integer;
begin
ListBox1.Clear;
OpenDialog1.Title :='??????? ???? ???????'; OpenDialog1.FileName :='*.txt';
if not OpenDialog1.Execute then exit;

Fname:=OpenDialog1.FileName;
edit2.Text:=Fname;
Assignfile(Ft,Fname); //????????? ???????? ?????????? ? ?????? ?????
 reset(Ft); //????????? ???? ??? ??????
 v:=0;
 While not eof(Ft) do
   begin readln(Ft,S);ListBox1.Items.Append(S); inc(v); end; //????????? ???????
    label2.Caption:='?????: '+inttostr(v);
   Closefile(Ft);
 L:=length(fname);
 i:=pos('.',fname);
 fnametp:=fname;
 if i>0 then
 begin
 delete(fnametp,i+1,L-i);
 fnametp:=fnametp+'ss';
 end else  fnametp:=fnametp+'.ss';

 Edit3.Text:=fnametp;

Assignfile(Ftp,Fnametp);    //????????? ?????????????? ???? ??? ??????????????
if filesearch(fnametp,'')<>'' then
begin
  reset(ftp); FtpOk:=true;
  Mark:=0; // ????????? ?? ?????? ??????
  seek(ftp,Mark);
  read(ftp,zap);

label8.Caption:='????: '+inttostr(Mark+1);
label9.Caption:='?????: '+inttostr(filesize(ftp));
for i:=0 to 9 do
begin
 listbox2.Items.Insert(i,zap.ms[i+1]); //????????? ?????????????? ????
 ListBox2.Items.Delete(i+1);
end;
 end
else   // ???? ?? ??????
begin
rewrite(ftp); FtpOk:=true;
initlist(10);
FormZap;
write(ftp,zap);
closefile(ftp);
reset(ftp);
end;
nx1:=0; ListBox2.ItemIndex:=nx1;
nx2:=0; ListBox3.ItemIndex:=nx2;
end;


procedure TForm1.Button2Click(Sender: TObject);
   var sv:string;
   i:integer;
begin
 if ListBox1.ItemIndex>=0 then
begin
if nx1<10 then begin
Sv:=ListBox1.Items.Strings[ListBox1.ItemIndex];
 repeat // ??????? ???????
 i:=pos(' ',Sv);  if i>0 then delete(Sv,i,1);  until i=0;
if Sv<>'-----' then
 begin
 nx1:=ListBox2.ItemIndex;
 listbox2.Items.Insert(nx1,Sv); //????????? ?????????? ???? ? listbox2
 ListBox2.Items.Delete(nx1+1); //??????? *
 ListBox1.Items.Strings[ListBox1.ItemIndex]:='-----'; //????????? ???????? ?????? ?????
 if nx1<9 then begin inc(nx1); ListBox2.ItemIndex:=nx1; end;

end else showmessage('????? ???????? ?????!');
end;
end;
end;

procedure TForm1.Button3Click(Sender: TObject);
var Sv,St:string;
n,n1: integer;
begin
n:=ListBox1.ItemIndex;
n1:=ListBox2.ItemIndex;
if (n>=0) and (n1>=0) then
begin

Sv:=ListBox2.Items.Strings[ListBox2.ItemIndex];
St:=ListBox1.Items.Strings[ListBox1.ItemIndex];
 listbox1.Items.Insert(n+1,Sv); //????????? ??????????? ????? ? listbox1
 ListBox1.Items.Delete(n);//??????? ????????
  ListBox2.Items.Delete(n1); //??????? ??????????? ?????
  ListBox2.Items.Append('*');//????????? *
  if nx1>1 then dec(nx1);
     end else showmessage('????? ???????? 2 ?????!');
  end;

procedure TForm1.Button4Click(Sender: TObject);
var sv:string;  i:integer;
begin
 if ListBox1.ItemIndex>=0 then
begin
if nx2<10 then begin
Sv:=ListBox1.Items.Strings[ListBox1.ItemIndex];
 repeat // ??????? ???????
 i:=pos(' ',Sv);  if i>0 then delete(Sv,i,1);  until i=0;
 if Sv<>'-----' then
  begin
 nx2:=ListBox3.ItemIndex;
 listbox3.Items.Insert(nx2,Sv);//????????? ??????????? ????? ? listbox3
 ListBox3.Items.Delete(nx2+1); //??????? ????? ?? listbox3
 ListBox1.Items.Strings[ListBox1.ItemIndex]:='-----';//????????? ??????? ?????? ?????
 if nx2<9 then begin inc(nx2); ListBox3.ItemIndex:=nx2; end;
end else showmessage('????? ???????? ?????!');
end;
end;
end;

procedure TForm1.Button5Click(Sender: TObject);
var Sv,St:string;
n,n1: integer;
begin
n:=ListBox1.ItemIndex;
n1:=ListBox3.ItemIndex;
if (n>=0) and (n1>=0) then
begin
Sv:=ListBox3.Items.Strings[ListBox3.ItemIndex];
St:=ListBox1.Items.Strings[ListBox1.ItemIndex];
n:=ListBox1.ItemIndex;
n1:=ListBox3.ItemIndex;
ListBox1.Items.Insert(n+1,Sv);//?????????  ??????????? ????? ? listbox1
 ListBox1.Items.Delete(n);//??????? ???????
  ListBox3.Items.Delete(n1);//??????? ?????
  if nx2>1 then dec(nx2);
end else showmessage('????? ???????? 2 ?????!');
end;

// ??????? ????
procedure TForm1.Button6Click(Sender: TObject);
var i:integer;
begin
Initlist(10);
OpenDialog2.Title :='??????? ???? ?????????????? ???????';
OpenDialog2.FileName :='*.ss';
if not OpenDialog2.Execute then exit;
Fnametp:=OpenDialog2.FileName;
Edit3.Text:=Fnametp;
if FtpOk then closefile(ftp);
Assignfile(Ftp,Fnametp);
if filesearch(fnametp,'')<>'' then
begin
  FtpOk:=true;
  reset(ftp);
  Mark:=0;
  seek(ftp,Mark);
  read(ftp,zap);
IndZap;
nx1:=0; ListBox2.ItemIndex:=nx1;
nx2:=0; ListBox3.ItemIndex:=nx2;
end;
end;

//??????? ??? ?? listbox2
procedure TForm1.Button14Click(Sender: TObject);
var i:integer;
begin  Form1.listbox2.Clear;
for i:=0 to 9 do Form1.ListBox2.Items.Append('*');
nx1:=0;  ListBox2.ItemIndex:=nx1;
end;

//??????? ??? ?? listbox3
procedure TForm1.Button15Click(Sender: TObject);
var i:integer;
begin Form1.listbox3.Clear;
for i:=0 to 9 do Form1.ListBox3.Items.Append('*');
nx2:=0; ListBox3.ItemIndex:=nx2;
end;

procedure TForm1.N111111Click(Sender: TObject);
var n:integer;
begin
if ftpok then
begin
n:=ListBox2.ItemIndex;
if n>=0 then
begin
//n:=ListBox2.ItemIndex;
ListBox2.Items.Delete(n);
listbox2.Items.Insert(n,'*');
end;
end else showmessage('????? ??????? ???? !');
end;

//?????????
procedure TForm1.Button9Click(Sender: TObject);
var i: integer;
begin
if FtpOK then
begin // ???? ???? ??????
FormZap;
seek(ftp,Mark); write(ftp,zap);
label8.Caption:='????: '+inttostr(Mark+1);
label9.Caption:='?????: '+inttostr(filesize(ftp));
end else showmessage('????? ??????? ???? !');
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
initlist(10);
end;

//???????? ?????????????? ???????
procedure TForm1.Button8Click(Sender: TObject);
begin
  SaveDialog1.Title := '??????? ????????????? ???????';
 SaveDialog1.FileName:='*.ss';
 if not SaveDialog1.Execute then exit;
 Fnametp:=SaveDialog1.FileName;
 Assignfile(Ftp,Fnametp);
 Mark:=0;
 rewrite(ftp);
 FtpOk:=true;
initlist(10);
FormZap;
 zap.ms[1]:='1 ??????';
write(ftp,zap);
closefile(ftp);
reset(ftp);
Indzap;
Form1.Edit3.Text:=Fnametp;
end;

//??????? ?? ????????? ??????
procedure TForm1.Button10Click(Sender: TObject);
begin
if ftpok then
begin
nx1:=0; ListBox2.ItemIndex:=nx1;
nx2:=0; ListBox3.ItemIndex:=nx2;
if (Mark<filesize(ftp)-1) then
begin
inc(Mark); seek(ftp,Mark); read(ftp,zap); Indzap;
end;
end;
end;

//??????? ?? ?????????? ??????
procedure TForm1.Button11Click(Sender: TObject);
begin
      if ftpok then
      begin
      nx1:=0; ListBox2.ItemIndex:=nx1;
      nx2:=0; ListBox3.ItemIndex:=nx2;
      Mark:=filepos(ftp)-1;
if (Mark>0) then
begin
dec(Mark); seek(ftp,Mark); read(ftp,zap); Indzap;
end;
end;

end;
//??????? ?? ????????? ??????
procedure TForm1.Button13Click(Sender: TObject);
begin
      if ftpok then
      begin
nx1:=0; ListBox2.ItemIndex:=nx1;
nx2:=0; ListBox3.ItemIndex:=nx2;
Mark:=filesize(ftp)-1;
seek(ftp,Mark);
read(ftp,zap);
Indzap;
end;
end;
//???????? ??????
procedure TForm1.Button16Click(Sender: TObject);
begin
if FtpOk then
begin
Mark:= filesize(ftp);
 seek(ftp,Mark);
 Initlist(10);
 FormZap;
 zap.ms[1]:=inttostr(Mark+1)+' ??????';
 write(ftp,zap);
 Indzap;
end;


end;
//??????? ? ?????? ???????
procedure TForm1.Button12Click(Sender: TObject);
begin
      if ftpok then
      begin   nx1:=0; ListBox2.ItemIndex:=nx1;
nx2:=0; ListBox3.ItemIndex:=nx2;

      if (Mark>0) then
begin
Mark:=0;
seek(ftp,Mark);
read(ftp,zap);
Indzap;
end;
end;
end;
//??????? ?? ????? ?????????????? ????? ?? listbox2
procedure TForm1.N2221Click(Sender: TObject);
var n:integer;
begin
if ftpok then
begin
ListB:=2;
n:=ListBox2.ItemIndex;
if n>=0 then
begin
nitems:=n;
form2.show;
form2.Edit1.Text:=ListBox2.Items.Strings[ListBox2.ItemIndex]
end;
end else showmessage('????? ??????? ???? !');
end;
//????? ?????
procedure TForm1.Button7Click(Sender: TObject);
var sp,mes:string;
k,i:integer;
begin
if ftpok then
begin
sp:=edit1.Text;
if (sp<>'') and (filesize(ftp)>1) then
begin
if button7.Caption='?????' then Markp:=-1;
flag:=false;
while (not eof(ftp)) and (not flag) do
begin
inc(Markp);
seek(ftp,Markp);
read(ftp,zapp);
   i:=0;
   while i<10 do
   begin
   inc(i);
   k:=pos(sp,zapp.ms[i]);
   if k>0 then begin i:=11; flag:=true; end;
   end;
end;
if flag=false then
begin

 if button7.Caption='?????' then begin
         mes:='? ? ? ? ? "'+sp+'" ? ? ? ? ? ? ? ? ? ? ? !';
         showmessage(mes);
         seek(ftp,Mark)
         end else
         begin
         mes:='? ? ? ? ? "'+sp+'" ? ? ? ? ? ?   ? ? ? !';
         showmessage(mes);
         end;
         button7.Caption:='?????';
end
else
begin
zap:=zapp;
Mark:=Markp;
Indzap;
button7.Caption:='????? ?????';
end;
end;

end else showmessage('????? ??????? ???? ?????????????? ???????');
end;
//???????? ?????
procedure TForm1.N1Click(Sender: TObject);
var n:integer;
begin
if ftpok then
begin
n:=ListBox3.ItemIndex;
if n>=0 then
begin
ListBox3.Items.Delete(n);
listbox3.Items.Insert(n,'*');
end;
end else showmessage('????? ??????? ???? !');
end;
 //??????? ?? ????? ?????????????? ????? ?? listbox3
procedure TForm1.N2Click(Sender: TObject);
var n:integer;
begin
if ftpok then
begin
ListB:=3;
n:=ListBox3.ItemIndex;
if n>=0 then
begin
nitems:=n;
form2.show;
form2.Edit1.Text:=ListBox3.Items.Strings[ListBox3.ItemIndex]
end;
end else showmessage('????? ??????? ???? !');
end;


INITIALIZATION
nx1:=0;
nx2:=0;
Mark:=0;

FINALIZATION
 if ftpok then closefile(ftp);
end.



