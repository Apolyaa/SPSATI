unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm2 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;




var
  Form2: TForm2;
  nitems:integer;
  ListB:byte; //номер Listbox, который вызвал

implementation

uses Unit1;

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);

function DelProb(Sv:string):string;
var i:integer; Sout:string;
begin
Sout:=Sv;
repeat // удаляем пробелы
i:=pos(' ',Sout);  if i>0 then delete(Sout,i,1);  until i=0;
DelProb:=Sout;
end;

begin
 if edit1.Text<>'' then
begin
Case ListB of
2:begin
  form1.ListBox2.Items.Delete(nitems);
  form1.listbox2.Items.Insert(nitems,DelProb(edit1.Text));
  end;
3:begin
  form1.ListBox3.Items.Delete(nitems);
  form1.listbox3.Items.Insert(nitems,DelProb(edit1.Text));
  end;
end;
form2.Close;
end;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
 form2.Close;
end;

end.
