# Sample JFlex Project
## Instructions
### For Windows (Eclipse)
1. Download the following file [http://jflex.de/release/jflex-1.6.1.zip](http://jflex.de/release/jflex-1.6.1.zip "Download JFlex")

2. Extract it. You will find a `jflex-1.6.1.jar` file inside the `lib` folder of the extracted file. Copy that jar file into your project folder.

3. Create a new file called `build.xml` in your project root. (Outside `src` folder). Paste the following code into `build.xml`.
    <!--lang: xml-->
        <?xml version="1.0"?>
        <project name="JLex" default="CompileLex">
            <target name="CompileLex">
                <taskdef classname="jflex.anttask.JFlexTask" name="jflex" classpath="jflex-1.6.1.jar" />
                <jflex
                    file="src/sample.flex"
                    destdir="src/"
                />
            </target>
        </project>
	
4. Create a new file called `sample.flex` inside `src` folder. Paste the following code into `sample.flex`
    <!--lang: flex-->
        import java.io.*;
        %%
        %standalone
        %class lexer    //name of the generated java file
        %public
        %line           //turn on line counting
        %column         //turn on column counting
        
        DIGIT		= [0-9]
        LETTER		= [a-zA-Z]
        WHITESPACE	= [ \t\n]      // space, tab, newline
        %%
        
        int
            { System.out.println("Keyword " + yytext()); }
        {LETTER}({LETTER}|{DIGIT})*
            { System.out.println("ID " + yytext()); }
        {DIGIT}+
            { System.out.println("Integer " + yytext()); }
        "="
            { System.out.println("ASSIGN " + yytext()); }
        {WHITESPACE}*
            { }
        .
            { System.out.println("Bad Char"); }

5.	Run the `build.xml` file. A new java file `lexer.java` will be created. (You need to refresh the file listing to view it.)
6.	Right click `lexer.java` and select `Run as > Run Configuration`.
7.	In the dialog that opens, select the `Arguments` tab (If you do not see it, you need to select the `Java Application` option on the left first).
8.	In the `Arguments` tab >  `Program arguments` box, type the name of the file you need to parse. Eg: `input.txt`. This file needs to be in the project root (Or else you need to give the absolute path).
9.	Now run the `lexer.java` file
10.	If you edit the `sample.flex` file. To run again:
    1.	Run the `build.xml` file first.
    2.	Then run the `lexer.java` file.
