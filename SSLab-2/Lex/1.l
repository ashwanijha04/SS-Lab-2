%{
    //characters,words,spaces,lines
    #include <stdio.h>
    int chars=0,words=0,lines=0,spaces=0;    
%}

%%
// Anything other than spaces or new line is a word
// Length of the word is the number of characters

[^ \t\n]+ { chars+=yyleng;words++;}

// New line
[\n] { lines++; }

// Spaces
[ \t]+ {spaces+=yyleng;}



%%

int main()
{
    yyin = fopen("data.txt","r");
    yylex();
    printf("\nCharacters: %d",chars);
    printf("\nWords: %d",words);
    printf("\nLines: %d",lines);
    printf("\nSpaces: %d",spaces);
}
