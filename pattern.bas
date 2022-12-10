10 rem pattern matching concept game
20 rem initialize size and start position
30 dim bp(16)
35 printchr$(147):ai=1:sm=1024:cm=55296:r=4:c=4:w=4:h=3:sp=(6-w)+((6-h)*40)
50 rem draw a matrix of random blocks
100 for b=0 to r-1:for i=1 to c:for l=0 to h:for p=0 to w
130 o =(i*(w+2))+sp+p+(40*l)+(40*b*(h+2)):pOsm+o,102:pOcm+o,int(rnd(1)*4)
150 next p,l:bp(ai)=o:ai=ai+1:next i,b
200 rem random selections of which blocks to equalize
210 f=int(rnd(1)*16)+1: s=int(rnd(1)*16)+1:if f=s then goto 210
250 rem mark first block
270 tl=f:gosub 800:co=1:rem gosub 400 :rem only for debug
280 rem copy color to second block and mark block
310 tl=s:gosub 800:co=3:gosub 400 :gosub 600
320 rem end of program
325 poke214,22:print:poke211,5:print"press a key to see the answer"
340 poke 198,0: wait 198,1 : rem wait on key pressed
350 rem disclosure other block
360 tl=f:gosub 800:co=1:gosub 400
362 poke214,22:print:poke211,5:print"press a key to play again"
365 poke 198,0: wait 198,1: goto 35 :rem again again
370 end
400 rem mark a tile use passed tile id
410 for m=0 to w+2:pokesm+lc-1+m,67:pokecm+lc-1+m,co:next m
420 for m=0 to w+2:pokesm+bc-1+m,67:pokecm+bc-1+m,co:next m
430 for m=0 to h+2:pokesm+lc-1+(m*40),66:pokecm+lc-1+(m*40),co:next m
440 for m=0 to h+2:pokesm+lc+w+1+(m*40),66:pokecm+lc+w+1+(m*40),co:next m
450 pokesm+lc-1,85:pokesm+bc-1,74:pokesm+lc+w+1,73:pokesm+bc+w+1,75
500 return
600 rem copy tile colours to from first to second tile
610 tl=f:gosub 800:fc=lc:tl=s:gosub 800
620 for i=1 to h+1:for j=0 to w: poke cm+lc+j+(i*40),peek(cm+fc+j+(i*40))
650 next j,i : return
800 rem set determine left corner en bottom corner
810 lc = (bp(tl)-((h+1)*40)-w): rem left corner top
820 bc = (bp(tl)-w)+40: rem bottom corner
830 return
