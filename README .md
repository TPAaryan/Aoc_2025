# Aoc_2025
This is my solution for the event Advent of Code by Jane street (In Verilog)

#Day - 1
Part -1
First thought that I have given to this problem is  to process the commands as L and R signify different signs and store what is the current dail position and add or subtract depending on which command is recieved from the puzzle  but i wanted to check if is there any possibility then i thougt of making a circullar array which contains no 0-99 and the index intitially will be on 50 and it is changed based on the commands this index itself is the current dail value so i am checking whether current val == 0 or not

Part-2 
After thinking for a while i noticed that if the magnitude is greater than index while rotating left it crosses 0,if magnitude is greater than 100-index while rotating right  it crosses 0 but this will only work if we have the magnitude restricted till 100 to do that i used %100 and i have added mag/100 to the count even if the constraint b/w index and mag is not satisfied and during this i have noticed one thin g in the left rotation if the index is 0 then the constraint is satisfied for all so i have added this part &&((index)!=0)) but where as this is not seen in the case of rhigt turn as i have checked with the both the extremities 
and aLso i have decided in middle as i have already calculated the no of times 0 occurs i just counted howmany times dail crosses 0 excluding it occurance when it is on the 0 and added both at last


BOTH THESE SOLUTIOONS ARE ON THIS SAME MODULE command_prossesor.v

   count_2 =  count;// for part 1
    count_2 = count_2 + count;// for part 2
