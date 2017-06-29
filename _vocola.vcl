#Global voice commands


include "string.vch";
include "URLs.vch";
#include "keys.vch";



#View of Application/text
make text smaller 		= {Ctrl+-};
make text bigger 		= {Ctrl++};

### Miscellaneous
repeat command 			= {Up} {Enter};
find text <_anything> 		= {Ctrl+f} Wait(100) $1 {Enter};
simon says <_anything> 		= $1;

# ---------------------------------------------------------------------------
# Text Editing

<direction>  := Left | Right | Up | Down;
<left_right> := Left | Right;
<up_down> := Up | Down;
<start_end> := (Start={Home} | End={End});

### Characters Finite
<direction> <n> [Lines]       	= {$1_$2};
Kill (Char | 1 | One) 		= {Del};
Kill [Left] [1]        		= {Backspace};
Kill <n>              		= {Del_$1};
[Kill] Left <n>       		= {Backspace_$1};


### Words
<left_right> [One] Word 	= {Ctrl+$1};
<left_right> <n> Words 		= {Ctrl+$1_$2};


## Need to review what these were originally, see what they are now:
#Kill [Left] Word 		= {Right_2}{Ctrl+Left}{Shift+Ctrl+Right}{Del};
#Kill <n> Words         	= {Right_2}{Ctrl+Left}{Shift+Ctrl+Right_$1}{Del};
#Kill Right Word         	= {Left}{Ctrl+Right}{Shift+Ctrl+Left}   {Del};
#Kill Left <n> Words    	= {Left}{Ctrl+Right}{Shift+Ctrl+Left_$1}{Del};

### Lines
Line <start_end>     		= $1;
New Line             		= {Enter};
Line Here            		= {Enter}{Left};
Copy Line           		= {home}{Shift+Down}{Shift+Home}{Ctrl+c};
Kill Line            		= {home}{Shift+Down}{Shift+Home}{Del};
Kill Back Line       		= {home}{Shift+Up}  {Shift+Home}{Del};
Kill <n> Lines       		= {home}{Shift+Down_$1}{Shift+Home}{Del};
Kill Back <n> Lines  		= {home}{Shift+Up_$1}  {Shift+Home}{Del};
Kill Here            		= {Shift+End}{Del};
Kill Back Here       		= {Shift+Home}{Del};
Duplicate Line       		= {home}{Shift+Down}{Shift+Home}{Ctrl+c}{Home}{Ctrl+v};
insert line after [this] 	= {end}{Enter};
insert line before [this] 	= {home}{Enter} {Up};
[go to] beginning of line 	= {Shift+Home};
copy beginning of line 		= {Shift+Home}{Ctrl+c};
cut beginning of line 		= {Shift+Home}{Ctrl+X};
[go to] end of line		= {Shift+End} {Right};
copy rest of line		= {Shift+End}{Ctrl+c};
cut rest of line		= {Shift+End} {Ctrl+x};
end line with <_anything>	= {End} $1;
              
### Paragraphs        
Para Start          		= {Ctrl+Up}{Right}{Home};
Para End            		= {Ctrl+Down}{Left_2}{End};
(Paragraph|Para) Here 		= {Enter}{Enter}{Left}{Left};
Open (Paragraph|Para|Line)    	= {Enter}{Enter}{Left};
Copy (Paragraph|Para)           = {Ctrl+Down}{Shift+Ctrl+Up}{Ctrl+c};
Kill (Paragraph|Para)           = {Ctrl+Down}{Shift+Ctrl+Up}{Del};
insert (Paragraph|Para) after [this] 	= {end}{Enter}{Enter};
insert (Paragraph|Para) before [this] 	= {home}{Enter}{Enter};
Duplicate (Paragraph|Para)     	= {Ctrl+Down}{Shift+Ctrl+Up}{Ctrl+c}{Home}{Ctrl+v};
                    
### Entire "Flow"   
Flow Start           		= {Ctrl+Home};
Flow End             		= {Ctrl+End};
Select All           		= {Ctrl+a};
Copy All             		= {Ctrl+a}{Ctrl+c};
(Cut|Kill) All       		= {Ctrl+a}{Ctrl+x};
Kill Flow Here       		= {Ctrl+Shift+End} {Ctrl+x};
Kill Back Flow Here  		= {Ctrl+Shift+Home}{Ctrl+x};
Replace All          		= {Ctrl+a}{Del}{Ctrl+v};

                    
### Selection         
Kill That 	     		= {Del};
Cut That             		= {Ctrl+x};
Yank That            		= {Ctrl+v};
Paste Here           		= ButtonClick() {Ctrl+v};
Duplicate That       		= {Ctrl+c}{Left}{Ctrl+v};
Keep That            		= {Ctrl+c}{Ctrl+a}{Del}{Ctrl+v};
Copy and paste that 		= {Ctrl+c} Wait(0) {Ctrl+v};
space paste that 		= " " HeardWord(paste, that);
Undo <n> 			= {Ctrl+z_$1};

### Editing
print that			= {Ctrl+p};
save (document|that)     	= {Ctrl+s};

### Formatting
start bullet list 		= "* ";
start numbered list 		= "1. ";

### Punctuation
bam 				= "!";
Hashtag 			= "#";
empty paren = "()" {Left};

### Formatting for Coding
###Functions replace and lower are unknown � ! Need to fix!
#space snake <_anything> 	= " " replace(lower($1)," ","_");
#snake <_anything> 		= replace(lower($1)," ","_");

Pascal <_anything> 		= Eval("''.join(x for x in $1.title() if not x.isspace())");
space Pascal <_anything> 	= " " Eval("''.join(x for x in $1.title() if not x.isspace())");

#uppercase <_anything> 		= Format.allcaps($1);	
(Cap | Up Case) <n> 		= {Shift+Right_$2} HeardWord(\All-Caps,That);

#space dash word <_anything> 	= " " replace(lower($1)," ","-");
#dash word <_anything> 		=  replace(lower($1)," ","-");

#studded <_anything> 		=" " replace($1," ",".");

#Camel <_anything> 		= Eval("$1[0].lower() + ''.join(x for x in $1.title() if not x.isspace())[1:]");
#space Camel <_anything> 	= " " Eval("$1[0].lower() + ''.join(x for x in $1.title() if not x.isspace())[1:]");
Camel [Case] That 		= HeardWord(\Cap,That) HeardWord(compound,that) {Ctrl+Left}
                 		   {Shift+Right} HeardWord(\No-Caps,That){Ctrl+Right};

# ---------------------------------------------------------------------------

# Web Browsing

### Opening browser
[search] Google for <_anything> = AppBringUp("chrome") {Alt+g}$1{Enter} ;
Switch to Browser 		= AppBringUp("chrome");

<website> := ( GitHub = https://github.com/
	     	| Gmail = https://mail.google.com
	     	| Facebook = www.Facebook.com
	     	| stack overflow = stackoverflow.com 
	     | LinkedIn = LinkedIn.com
	     | Google drive =https://drive.google.com/drive/u/0/my-drive);
Navigate to <website> 		= ShellExecute("chrome.exe $1");	
navigate to <_anything> .com	= ShellExecute("chrome.exe $1.com");	

# ---------------------------------------------------------------------------

### Switch applications, windows, and panels

Switch Window 			= SendSystemKeys( {Alt+Tab} );
Copy and Switch  		= {Ctrl+a}{Ctrl+c} SendSystemKeys( {Alt+Tab} );
Copy to (NatSpeak|Emacs|Composition)
   				= {Ctrl+a}{Ctrl+c} HeardWord(switch,to,$1);
Close Here 			= ButtonClick(2,1) Wait(100) c;
Close Window 			= {Alt+Space}c;

(Switch|Next) View     		= {Ctrl+Tab};
(Switch|Next) View <n> 		= {Ctrl+Tab_$2};
Previous View     		= {Ctrl+Shift+Tab};
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

Maximize Window 		= touchNearEdge(ne,-2,1);

Tile Windows     		= tileWindows(0);
Tile Windows <n> 		= tileWindows($1);  
   # Edge is <n> units right of center


# ---------------------------------------------------------------------------
# Context-Sensitive Commands

include folders.vch;

### Commands for "file browse" dialog boxes

Open | New | Save | File | Attachment | Browse | Directory:
  Folder <folder> 		= {Ctrl+c}$1\{Enter};
  Go Up 			= ..{Enter};
  Go Up <n> 			= Repeat($1, ..\) {Enter};
  Folder List 			= {Shift+Tab_2}{Down}{PgUp};
  Choose <n> 			= {Down_$1}{Enter}{Esc};
