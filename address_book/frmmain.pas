unit frmmain;

interface

uses
  SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Dbf, Grids, DBGrids, DBCtrls, ExtCtrls, ActnList, Menus,
  StdCtrls, DBActns, StdActns,unit1,unit2,unit3;

type
  TDataSetFirst = TAction;
  TDataSetPrior = TAction;
  TDataSetNext = TAction;
  TDataSetLast = TAction;
  TDataSetInsert = TAction;
  TDataSetDelete = TAction;
  TDataSetEdit = TAction;
  TDataSetPost = TAction;
  TDataSetCancel = TAction;
  TDataSetRefresh = TAction;

  { TMainForm }

  TMainForm = class(TForm)
    Action1: TAction;
    lang: TComboBox;
    help: TMenuItem;
    hd: TMenuItem;
    about: TMenuItem;
    execu: TMenuItem;
    edittext: TMenuItem;
    todo: TMenuItem;
    tool: TMenuItem;
    shutdown: TMenuItem;
    SearchFind1: TSearchFind;
    SearchReplace1: TSearchReplace;
    updatesotf: TMenuItem;
    MMain: TMainMenu;
    MFile: TMenuItem;
    ALMain: TActionList;
    ANew: TAction;
    AOpen: TAction;
    AClose: TAction;
    AQuit: TAction;
    MINew: TMenuItem;
    MIOpen: TMenuItem;
    PTop: TPanel;
    DBNavigator1: TDBNavigator;
    GDBA: TDBGrid;
    PBottom: TPanel;
    DBA: TDbf;
    SDDBA: TSaveDialog;
    ODDBA: TOpenDialog;
    DSAddress: TDataSource;
    ELastName: TDBEdit;
    EFirstName: TDBEdit;
    EStreet: TDBEdit;
    EZip: TDBEdit;
    ECountry: TDBEdit;
    EWWW: TDBEdit;
    ETelephone: TDBEdit;
    Efax: TDBEdit;
    Efb: TDBEdit;
    EEmail: TDBEdit;
    ETown: TDBEdit;
    LELastName: TLabel;
    LEFirstName: TLabel;
    LEStreet: TLabel;
    LEZip: TLabel;
    LETown: TLabel;
    LETelephone: TLabel;
    LEjob: TLabel;
    LEfax: TLabel;
    LEfb: TLabel;
    LEEmail: TLabel;
    LEWWW: TLabel;
    MIClose: TMenuItem;
    N1: TMenuItem;
    MIQuit: TMenuItem;
    AFirst: TDataSetFirst;
    APrior: TDataSetPrior;
    ANext: TDataSetNext;
    ALast: TDataSetLast;
    AInsert: TDataSetInsert;
    ADelete: TDataSetDelete;
    AEdit: TDataSetEdit;
    APost: TDataSetPost;
    ACancel: TDataSetCancel;
    Record1: TMenuItem;
    MIFirst: TMenuItem;
    MILAst: TMenuItem;
    MIPrior: TMenuItem;
    MINext: TMenuItem;
    N2: TMenuItem;
    MIEdit: TMenuItem;
    MIDelete: TMenuItem;
    MIPost: TMenuItem;
    MICancel: TMenuItem;
    MIRefresh: TMenuItem;
    MIInsert: TMenuItem;
    procedure aboutClick(Sender: TObject);
    procedure ANewExecute(Sender: TObject);
    procedure AOpenExecute(Sender: TObject);
    procedure ACloseExecute(Sender: TObject);
    procedure ACloseUpdate(Sender: TObject);
    procedure AQuitExecute(Sender: TObject);
    procedure DataOpen(Sender: TObject);
    procedure DBNavigator1Click(Sender: TObject; Button: TDBNavButtonType);
    procedure DoDataAction(Sender: TObject);
    procedure DSAddressDataChange(Sender: TObject; Field: TField);
    procedure edittextClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure DBAAfterInsert(DataSet: TDataSet);
    procedure HaveDataNotEmpty(Sender: TObject);
    procedure InEditMode(Sender: TObject);
    procedure helpClick(Sender: TObject);
    procedure hdClick(Sender: TObject);
    procedure langChange(Sender: TObject);
    procedure shutdownClick(Sender: TObject);
    procedure toolClick(Sender: TObject);
    procedure updatesotfClick(Sender: TObject);
  private
    procedure CreateTable(AFileName : String);
    procedure OpenTable(AFileName: String);
    procedure CloseTable;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.lfm}

resourcestring
  SSaveData = 'Bạn chưa lưu cơ sở dữ liệu. Lưu ?';

{ Action  handlers }

procedure TMainForm.ANewExecute(Sender: TObject);
begin
  With SDDBA do
    If Execute then
      CreateTable(FileName);
end;

procedure TMainForm.aboutClick(Sender: TObject);
begin
  aboutform.Show;
end;

procedure TMainForm.ACloseExecute(Sender: TObject);
begin
  CloseTable;
end;

procedure TMainForm.ACloseUpdate(Sender: TObject);
begin
  (Sender as Taction).Enabled:=Not (DBA.State in dsEditModes);
end;
procedure TMainForm.CreateTable(AFileName : String);

begin
  With DBA do
    begin
    Close;
    with FieldDefs do
      begin
      Clear;
      Add('FirstName',ftString,30);
      Add('LastName',ftString,30);
      Add('Street',ftString,50);
      Add('Zip',ftString,20);
      Add('Town',ftString,30);
      Add('Job',ftString,30);
      Add('Telephone',ftString,15);
      Add('fax',ftString,15);
      Add('fb',ftString,15);
      Add('Email',ftString,100);
      Add('WWW',ftString,100);
      end;
    TableName:=AFileName;
    CreateTable;
    Exclusive := true;
    Open;
    AddIndex('LastName', 'LastName', []);
    end;
end;

procedure TMainForm.AOpenExecute(Sender: TObject);
begin
  With ODDBA  do
    if Execute then
      OpenTable(FileName);
end;

procedure TMainForm.OpenTable(AFileName : String);

begin
  With DBA do
    begin
    Close;
    TableName:=AFileName;
    Open;
    end;
end;

procedure TMainForm.CloseTable;

begin
  DBA.Close;
end;

procedure TMainForm.AQuitExecute(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.DataOpen(Sender: TObject);
begin
  With DBA do
    (Sender as Taction).Enabled:=Active;
end;

procedure TMainForm.DBNavigator1Click(Sender: TObject; Button: TDBNavButtonType
  );
begin

end;

procedure TMainForm.DoDataAction(Sender: TObject);
begin
  Case (Sender as TAction).Tag of
    0 : DBA.First;
    1 : DBA.Prior;
    2 : DBA.Next;
    3 : DBA.Last;
    4 : DBA.Insert;
    5 : DBA.Delete;
    6 : DBA.Edit;
    7 : DBA.Post;
    8 : DBA.Cancel;
    9 : DBA.Refresh;
  end;
end;

procedure TMainForm.DSAddressDataChange(Sender: TObject; Field: TField);
begin

end;

procedure TMainForm.edittextClick(Sender: TObject);
begin
    edittxt.Show;
end;

procedure TMainForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose:=Not (DBA.State in dsEditModes);
  if Not CanClose then
    case MessageDlg(SSaveData,mtWarning,[mbYes,mbNo,mbCancel],0) of
      mrYes : begin
              DBA.Post;
              CanClose:=True;
              end;
      mrNo  : CanClose:=True;
    end;
end;

procedure TMainForm.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  DBA.Close;
end;

procedure TMainForm.DBAAfterInsert(DataSet: TDataSet);
begin
  ELastName.SetFocus;
end;

procedure TMainForm.HaveDataNotEmpty(Sender: TObject);
begin
  With DBA do
    (Sender as Taction).Enabled:=Active and Not (EOF and BOF);
end;

procedure TMainForm.InEditMode(Sender: TObject);
begin
  With DBA do
    (Sender As Taction).EnAbled:=State in dsEditModes;
end;

procedure TMainForm.helpClick(Sender: TObject);
begin

end;

procedure TMainForm.hdClick(Sender: TObject);
begin

end;

procedure TMainForm.langChange(Sender: TObject);
begin
  if lang.text='Tiếng Việt' then
    begin
      lefirstname.Caption:='First Name';
      lelastname.Caption:='Last Name';
      lestreet.Caption:='Street';
      lezip.Caption:='Zip';
      letown.Caption:='Town';
       lejob.Caption:='Job';
      letelephone.Caption:='Telephone';
      lefax.Caption:='Mobile';
      lefb.Caption:='Facebook';
      lewww.Caption:='Website';
      mifile.Caption:='File';
      minew.Caption:='New';
      miopen.Caption:='Open';
      miclose.Caption:='Close';
      miquit.Caption:='Quit';
      record1.Caption:=Record';
    end;
end;

procedure TMainForm.shutdownClick(Sender: TObject);
begin
  timeshut.ShowModal;
end;

procedure TMainForm.toolClick(Sender: TObject);
begin

end;

procedure TMainForm.updatesotfClick(Sender: TObject);
begin

end;

end.
