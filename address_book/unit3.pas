unit Unit3;

{$mode objfpc}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Calendar,
  Spin, StdCtrls, Buttons, ExtCtrls;

type

  { Ttimeshut }

  Ttimeshut = class(TForm)
    BitBtn1: TBitBtn;
    Calendar1: TCalendar;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    h: TSpinEdit;
    m: TSpinEdit;
    s: TSpinEdit;
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  timeshut: Ttimeshut;

implementation

{$R *.lfm}

end.

