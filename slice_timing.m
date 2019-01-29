%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  This is for generating slice timing information (order and time files) for
%%  multiband sequences 
%%  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

slices_num=46;
sms_num=2;
TR=1.5;
shots_num=slices_num/sms_num;
if mod(shots_num,2)==1
    half_order_seq=[2:2:shots_num,1:2:shots_num+1]';
end
    order_seq=half_order_seq;
    for i=1:sms_num
        tmp=half_order_seq+shots_num*i;
        order_seq=[order_seq;tmp];
    end
        
for i=1:shots_num
    half_timeSeq(i,1)=TR*(i-1)/shots_num;
end
timeSeq=repmat(half_timeSeq,sms_num,1);

tmpSTC=[order_seq,timeSeq];
mSTC=sortrows(tmpSTC,1);

