unit Login;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm2 = class(TForm)
    lbl1: TLabel;
    btn1: TButton;
    edt1: TEdit;
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses mainMenu;

{$R *.dfm}

procedure TForm2.btn1Click(Sender: TObject);
begin
if edt1.Text = 'admin' then
begin
Form1.mm1.Items[1].Visible:=True;
Form1.mm1.Items[2].Visible:=False;
Form1.mm1.Items[3].Visible:=False;
Form2.Close;
end else if edt1.Text = 'kasir' then
begin
Form1.mm1.Items[1].Visible:=False;
Form1.mm1.Items[2].Visible:=True;
Form1.mm1.Items[3].Visible:=False;
Form2.Close;
end else if edt1.Text = 'pemilik' then
begin
Form1.mm1.Items[1].Visible:=False;
Form1.mm1.Items[2].Visible:=False;
Form1.mm1.Items[3].Visible:=True;
Form2.Close;
end else
begin
Form1.mm1.Items[1].Visible:=False;
Form1.mm1.Items[2].Visible:=False;
Form1.mm1.Items[3].Visible:=False;
  Form2.Close;
end;
end;
end.
