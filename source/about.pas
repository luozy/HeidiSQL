unit About;


// -------------------------------------
// About-box
// -------------------------------------


interface

uses
  Windows, Classes, Graphics, Forms, Controls, StdCtrls, ExtCtrls, SysUtils, ComCtrls, GIFImg;


type
  TAboutBox = class(TForm)
    PanelLogos: TPanel;
    ImageMysql: TImage;
    ButtonClose: TButton;
    PanelMain: TPanel;
    ProductName: TLabel;
    LabelVersion: TLabel;
    LabelCompiled: TLabel;
    LabelWebpage: TLabel;
    PageControlTexts: TPageControl;
    tabAuthors: TTabSheet;
    ButtonBoard: TButton;
    ImageHeidisql: TImage;
    MemoThanks: TMemo;
    tabThanks: TTabSheet;
    MemoAuthors: TMemo;
    ImageDonate: TImage;
    btnUpdateCheck: TButton;
    procedure OpenURL(Sender: TObject);
    procedure MouseOver(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }

  public
    { Public declarations }
  end;


  procedure AboutWindow( AOwner: TComponent );

// -----------------------------------------------------------------------------
implementation


uses
  main, helpers;


{$R *.DFM}


procedure AboutWindow( AOwner: TComponent );
var
  f    : TAboutBox;
begin
  f := TAboutBox.Create( AOwner );
  f.ShowModal(); // don't care about result
  FreeAndNil(f);
end;


procedure TAboutBox.OpenURL(Sender: TObject);
begin
  ShellExec( TControl(Sender).Hint );
end;


procedure TAboutBox.MouseOver(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  LabelWebpage.Font.Color := clBlue;
  if (Sender is TLabel) then
  begin
    TLabel(Sender).Font.Color := clRed;
  end;
end;


procedure TAboutBox.FormShow(Sender: TObject);
var
//  CompiledInt    : Integer;
  Compiled       : TDateTime;
begin
  // Define the current cursor like a clock
  Screen.Cursor := crHourGlass;

  InheritFont(Font);
  InheritFont(ProductName.Font);
  ProductName.Font.Size := 14;
  InheritFont(LabelWebpage.Font);

  // Avoid scroll by removing blank line outside visible area in Authors text box
  MemoAuthors.Text := TrimRight(MemoAuthors.Text);

  // App-Version
  LabelVersion.Caption := 'Version '+AppVersion;

  // Compile-date
  FileAge(ParamStr(0), Compiled);
  LabelCompiled.Caption := 'Compiled on: ' + DateTimeToStr( Compiled );

  // Define the current cursor like a pointer (default)
  Screen.Cursor := crDefault;
end;


end.

