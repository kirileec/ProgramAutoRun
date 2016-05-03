unit SetAutoRunFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmSetAutoRun = class(TForm)
    flpndlg1: TFileOpenDialog;
    edtFilePath: TEdit;
    btnSelFile: TButton;
    btnSetAutoRun: TButton;
    btnTestAutoRun: TButton;
    mmoLog: TMemo;
    btnCancelAutoRun: TButton;
    procedure btnSetAutoRunClick(Sender: TObject);
    procedure btnCancelAutoRunClick(Sender: TObject);
    procedure btnTestAutoRunClick(Sender: TObject);
    procedure btnSelFileClick(Sender: TObject);
  private
    { Private declarations }
    procedure SetAutoRun(ItemName: string; ok: boolean; FilePath: WideString);
    function CheckFilePath(FilePath: WideString): Boolean;
    procedure GetPrivilege;

  public
    { Public declarations }
  end;

var
  frmSetAutoRun: TfrmSetAutoRun;

implementation

uses
  System.Win.Registry;

{$R *.dfm}
procedure TfrmSetAutoRun.btnCancelAutoRunClick(Sender: TObject);
begin
  if CheckFilePath(edtFilePath.Text) then
    SetAutoRun(ExtractFileName(edtFilePath.Text), False, edtFilePath.Text)
  else
    ShowMessage('文件不存在或路径不正确');
end;

procedure TfrmSetAutoRun.btnSelFileClick(Sender: TObject);
begin
  if flpndlg1.Execute then
  begin
    edtFilePath.Text := flpndlg1.FileName;
  end;
end;

procedure TfrmSetAutoRun.btnSetAutoRunClick(Sender: TObject);
begin
  if CheckFilePath(edtFilePath.Text) then
    SetAutoRun(ExtractFileName(edtFilePath.Text), True, edtFilePath.Text)
  else
    ShowMessage('文件不存在或路径不正确');
end;

procedure TfrmSetAutoRun.btnTestAutoRunClick(Sender: TObject);
begin
  GetPrivilege;
  ExitWindowsEx(EWX_LOGOFF, 0);
end;

function TfrmSetAutoRun.CheckFilePath(FilePath: WideString): Boolean;
begin
  Result := False;
  Result := FileExists(FilePath);
end;

procedure TfrmSetAutoRun.GetPrivilege;
var
  NewState:       TTokenPrivileges;
  lpLuid:         Int64;
  ReturnLength:   DWord;
  ToKenHandle:    THandle;
begin
  OpenProcessToken(GetCurrentProcess,
                   TOKEN_ADJUST_PRIVILEGES
                   OR TOKEN_ALL_ACCESS
                   OR STANDARD_RIGHTS_REQUIRED
                   OR TOKEN_QUERY,ToKenHandle);
  LookupPrivilegeValue(nil,'SeShutdownPrivilege',lpLuid);
  NewState.PrivilegeCount:=1;
  NewState.Privileges[0].Luid:=lpLuid;
  NewState.Privileges[0].Attributes:=SE_PRIVILEGE_ENABLED;
  ReturnLength:=0;
  AdjustTokenPrivileges(ToKenHandle,False,NewState,0,nil,ReturnLength);
end;

procedure TfrmSetAutoRun.SetAutoRun(ItemName: string; ok: boolean; FilePath: WideString);
var
  Reg: TRegistry; //首先定义一个TRegistry类型的变量Reg

begin
  Reg := TRegistry.Create;
  try //创建一个新键
    Reg.RootKey := HKEY_LOCAL_MACHINE; //将根键设置为HKEY_LOCAL_MACHINE
    Reg.OpenKey('Software\Microsoft\Windows\CurrentVersion\Run', true); //打开一个键
    if ok then
    begin
      Reg.WriteString(ItemName, FilePath); //在Reg这个键中写入数据名称和数据数值
      ShowMessage('注册成功！');
    end
    else
    begin
      reg.DeleteValue(ItemName);
      ShowMessage('删除成功！')
    end;
    Reg.CloseKey; //关闭键
  finally
    Reg.Free;
  end;
end;

end.

