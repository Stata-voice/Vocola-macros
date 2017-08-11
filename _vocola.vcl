#Global voice commands

### Ideas from various languages: 
### https://docs.google.com/spreadsheets/d/1pk2gwTFbMebgYSsrxIFsZ-QvpEPWCybF8ypdeBvfBsg/pubhtml
### commands in ALL CAPS are from the language VoiceCode (https://github.com/VoiceCode/docs/wiki/Commands-Overview)

include "string.vch";
include "URLs.vch";
include "keys.vch";
include "usernames.vch";

#View of Application/text
SHAMAN 				= {Ctrl+-};
SHOMPLA 			= {Ctrl++};

### Miscellaneous
repeat command 			= {Up} {Enter};
MARCO <_anything> 		= {Ctrl+f} Wait(100) $1 {Enter}; # finds words "anything"
KEEPER <_anything> 		= $1; # writes out words "anything"


# ---------------------------------------------------------------------------
# Text Editing

<direction>  := Left | Right | Up | Down;
<left_right> := Left | Right;
<up_down> := Up | Down;
<start_end> := (Start={Home} | End={End});

### Characters 

CRIMP			       	= {Left};  # moving left
CRIMP <n>	        	= {Left_$1};  # moving left 
CHRIS			       	= {Right};  # moving right 
CHRIS <n>	        	= {Right_$1};  # moving right 

SPUNK				= {Del}; # deletes a character to the right
SPUNK <n> 	             	= {Del_$1}; # 

JUNK	        		= {Backspace};
JUNK <n>	       		= {Backspace_$1};

Copy <direction> <n>        	= {Shift+$1_$2}{Ctrl+c};


### Words

FAME	 		 	= {Ctrl+Left}; # move one word to the left
FAME <n> 			= {Ctrl+Left_$1};
FISH 	 		 	= {Ctrl+Right}; # move one word to the right
FISH <n> 			= {Ctrl+right_$1};

TROUGH 				= {Ctrl+Shift+Left}{Del}; # delete one word to the left
TROUGH <n>			= {Ctrl+Shift+Left_$1}{Del}; 
KITE				= {Ctrl+Shift+Right}{Del}; # delete one word to the right
KITE <n>			= {Ctrl+Shift+Right_$1}{Del}; 

WORD NECK 			= {Ctrl+Shift+Right}; 
WORD PREEV			= {Ctrl+Shift+Left};

Copy <direction> [One] Word	= {Ctrl+Shift+$1}{Ctrl+c};
Copy <direction> <n> Words     	= {Ctrl+Shift+$1_$2}{Ctrl+c};

### Lines

JEEP				= {Up}; # moving down a line
JEEP <n>		       	= {Up_$1}; 
DOOM				= {Down}; # moving down a line
DOOM <n>		       	= {Down_$1}; 

New Line             		= {Enter};
Line Here            		= {Enter}{Left};
Copy Line           		= {home}{Shift+Down}{Shift+Home}{Ctrl+c};

SNIP LINE			= {home}{Shift+Down}{Shift+Home}{Del};
Kill Up Line       		= {home}{Shift+Up}  {Shift+Home}{Del};
Kill Up <n> Lines  		= {home}{Shift+Up_$1}  {Shift+Home}{Del};
Kill <n> Lines       		= {home}{Shift+Down_$1}{Shift+Home}{Del};
Kill Down (1|One) [Line]       	= {End}{Shift+Down}{Shift+Home}{Del};
Kill Down <n> Lines       	= {End}{Shift+Down_$1}{Shift+Home}{Del};

Duplicate Line       		= {home}{Shift+Down}{Shift+Home}{Ctrl+c}{Home}{Ctrl+v};
Insert line (after|down) 	= {end}{Enter};
Insert line (before|up) 	= {home}{Enter} {Up};

LEFTY 				= {Home}; # go to beginning of the line
LECKSY				= {Shift+Home}; # select all text back through beginning of line
Copy (Ghin|Beginning) [of] line = {Shift+Home}{Ctrl+c};
Cut (Ghin|Beginning) [of] line 	= {Shift+Home}{Ctrl+X};
SNIPPLE				= {Shift+Home}{Backspace}; # crop line to the left

RICKY 				= {End}; # go to the end of the line
RICKSY 				= {Shift+End}; # select all text through end of line
Copy (end | rest) [of] line	= {Shift+End}{Ctrl+c};
Cut (end | rest) [of] line	= {Shift+End}{Ctrl+x};
SNIPPER 			= {Shift+End}{Backspace}; # crop line to the right

End line with <_anything>	= {End} $1;
              
### Paragraphs        
Para Start          		= {Ctrl+Up}{Right}{Home};
Para End            		= {Ctrl+Down}{Left_2}{End};
(Paragraph|Para) Here 		= {Enter}{Enter}{Left}{Left};
Open (Paragraph|Para|Line)    	= {Enter}{Enter}{Left};
Copy (Paragraph|Para)           = {Ctrl+Down}{Shift+Ctrl+Up}{Ctrl+c};
Kill (Paragraph|Para)           = {Ctrl+Down}{Shift+Ctrl+Up}{Del};
Insert (Paragraph|Para) after [this] 	= {end}{Enter}{Enter};
Insert (Paragraph|Para) before [this] 	= {home}{Enter}{Enter};
Duplicate (Paragraph|Para)     	= {Ctrl+Down}{Shift+Ctrl+Up}{Ctrl+c}{Home}{Ctrl+v};
                    
### Entire "Flow"   
JEEP WAY			= {Ctrl+Home};
DOOM WAY			= {Ctrl+End};
Copy All             		= {Ctrl+a}{Ctrl+c};
(Cut|Kill) All       		= {Ctrl+a}{Ctrl+x};
Kill Flow Here       		= {Ctrl+Shift+End} {Ctrl+x};
Kill Back Flow Here  		= {Ctrl+Shift+Home}{Ctrl+x};
Replace All          		= {Ctrl+a}{Del}{Ctrl+v};

                    
### Selection         
OLLY				= {Ctrl+a}; 
STOOSH				= {Ctrl+c}; copy
SNATCH				= {Ctrl+x}; cute
SPARK				= {Ctrl+v}; # paste
Paste Here           		= ButtonClick() {Ctrl+v};
Duplicate That       		= {Ctrl+c}{Left}{Ctrl+v};
Keep That            		= {Ctrl+c}{Ctrl+a}{Del}{Ctrl+v};
Copy and paste that 		= {Ctrl+c} Wait(0) {Ctrl+v};
space paste that 		= " " HeardWord(paste, that);


### General Commands 
DIZZLE 				= {Ctrl+z}; # undo
DIZZLE <n> 			= {Ctrl+z_$1};
RIZZLE 				= {Ctrl+y}; # redo

### Editing
print that			= {Ctrl+p};
SAGE				= {Ctrl+s};

### Formatting
(CHAMP | Cap) <n> 		= {Shift+Right_$2} HeardWord(\All-Caps,That); 
bullet list 			= "* ";
numbered list 			= "1. ";

### Punctuation
CLAMOR				= "!";
Hashtag 			= "#";
PREX				= "()" {Left};


# ---------------------------------------------------------------------------

# Web Browsing

### Opening browser
[search] Google for <_anything> = AppBringUp("chrome") {Alt+g}$1{Enter} ;


<website> := ( GitHub = https://github.com/
	     | Gmail = https://mail.google.com
	     | Facebook = www.Facebook.com
	     | stack overflow = stackoverflow.com 
	     | LinkedIn = LinkedIn.com
	     | Google drive = https://drive.google.com/drive/u/0/my-drive
	     | Vocola = http://vocola.net/v2/LanguageTutorial.asp);

(Navigate|Go) to <website> 		= ShellExecute("chrome.exe $1");	
(Navigate|go) to <_anything> .com	= ShellExecute("chrome.exe $1.com");	

# ---------------------------------------------------------------------------

### Switch applications, windows, and panels

File Explorer			= AppBringUp("explorer");  # Opens File Explorer

SWICK				= SendSystemKeys( {Alt+Tab} );
Copy and Switch  		= {Ctrl+a}{Ctrl+c} SendSystemKeys( {Alt+Tab} );
Close Here 			= ButtonClick(2,1) Wait(100) c;
Close Window 			= {Alt+F4}; # close window 
TOTCH				= {Ctrl+w}; # close tab 
PEACH 				= {Ctrl+t}; # open new tab

GO NECK				= {Ctrl+Tab};
(Switch|Next) View <n> 		= {Ctrl+Tab_$2};
GO PREEV			= {Ctrl+Shift+Tab};
Previous View <n> 		= {Ctrl+Shift+Tab_$1};

Tab Back     			= {Shift+Tab};
Tab Back <n> 			= {Shift+Tab_$1};


### Open/Close a drop-down list
(Expand={Alt+ExtDown} | Collapse={Alt+ExtUp}) That = SendSystemKeys($1);


### NatSpeak
Dragon Menu              	= SendSystemKeys( {NumKey*} );
(Edit=v | Train=t) Words 	= SendSystemKeys( {NumKey*} ) Wait(100) w $1;
Save Speech Files        	= SendSystemKeys( {NumKey*} ) Wait(100) ff;
Exit NatSpeak            	= SendSystemKeys( {NumKey*} ) Wait(100) e;


# ---------------------------------------------------------------------------
# Mouse Handling

Click Mouse   			= ButtonClick();
Hit Double 			= ButtonClick(1,2);
(Shift=1 | Control=2 | Alt=3) Click = ShiftKey($1) ButtonClick();
Hit Start [Menu] 		= SendSystemKeys( {Ctrl+Esc} );

### Straight mouse grid commands. (See documentation in utilities.vch)

include utilities.vch;
<n> := 0..99;

<n> <n> Go    			= moveTo($2, $1);
<n> <n> Touch 			= touch($2, $1);
<n> <n> Drag  			= dragTo($2, $1);
<n> <n> Paste 			= touch($2, $1) {Ctrl+v};

<upDown>    := (  Up='-' |  Down='');
<leftRight> := (Left='-' | Right='');

Drag <n> <upDown>    		= dragBy(0, $2$1);
Drag <n> <leftRight> 		= dragBy($2$1, 0);


### Move and resize windows

<edge> := (Top=n | Bottom=s | Left=w | Right=e);

[Move] Window <n> <upDown>   	= moveNearEdge(n,0,1) dragBy(0, $2$1);
[Move] Window <n> <leftRight> 	= moveNearEdge(n,0,1) dragBy($2$1, 0);
[Move] Window Northwest 	= moveNearEdge(nw,2,1) dragTo(2,1);
[Move] Window Northeast 	= moveNearEdge(ne,-5,1) dragTo(95,1);

[Size] Window <edge> <n> <upDown>    = moveToEdge($1) dragBy(0, $3$2);
[Size] Window <edge> <n> <leftRight> = moveToEdge($1) dragBy($3$2, 0);


Tile Windows     		= tileWindows(0);
Tile Windows <n> 		= tileWindows($1);  
   # Edge is <n> units right of center


# ---------------------------------------------------------------------------
# Context-Sensitive Commands

include folders.vch;

### Commands for "file browse" dialog boxes

Open | New | Save | File | Attachment | Browse | Directory:
  Folder <folder> 		= $1\{Enter};
  Go Up 			= ..{Enter};
  Go Up <n> 			= Repeat($1, ..\) {Enter};
  Folder List 			= {Shift+Tab_2}{Down}{PgUp};
  Choose <n> 			= {Down_$1}{Enter}{Esc};
