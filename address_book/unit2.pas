unit Unit2;

{$mode objfpc}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, LazHelpHTML;

type

  { Taboutform }

  Taboutform = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    procedure Label7Click(Sender: TObject);
    procedure Label7MouseLeave(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  aboutform: Taboutform;

implementation

{$R *.lfm}

{ Taboutform }

procedure Taboutform.Label7MouseLeave(Sender: TObject);
begin
  Label7.Cursor:=crHandPoint;
end;

procedure Taboutform.Label7Click(Sender: TObject);
begin

end;

end.

