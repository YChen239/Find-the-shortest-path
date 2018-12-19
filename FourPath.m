function [sp,Path4]=FourPath(m,V,pr,pc,qr,qc,record,sp,p,Path,Path4)
s=size(m);
%use backtracking to find the shortest path
if (pr==qr)&&(pc==qc)%test if tracking potin reach the end point
   if strcmpi(sp,'NaN')
      sp=p;
      Path4=Path;
   else
       if p<sp
           sp=p;
           Path4=Path;
       else
       if sp==p
           Path4=cat(3,Path4,Path);%add to path
       end
       end
   end
end
%tracking
if (pr-1>0)
    if ismember(m(pr-1,pc),V)==1
        if record(pr-1,pc)==0
            record(pr-1,pc)=1; 
            p=p+1;
            Patht=Path;
            Path=cat(1,Path,[pr-1,pc]);
            [sp,Path4]=FourPath(m,V,pr-1,pc,qr,qc,record,sp,p,Path,Path4);
            p=p-1;
            Path=Patht;
        end
    end
end
if (pc-1>0)
    if ismember(m(pr,pc-1),V)==1
        if record(pr,pc-1)==0
            record(pr,pc-1)=1; 
            p=p+1;
            Patht=Path;
            Path=cat(1,Path,[pr,pc-1]);
            [sp,Path4]=FourPath(m,V,pr,pc-1,qr,qc,record,sp,p,Path,Path4);
            p=p-1;
            Path=Patht;
        end
    end
end
if (pr+1<=s(1))
    if ismember(m(pr+1,pc),V)==1
        if record(pr+1,pc)==0
            record(pr+1,pc)=1; 
            p=p+1;
            Patht=Path;
            Path=cat(1,Path,[pr+1,pc]);
            [sp,Path4]=FourPath(m,V,pr+1,pc,qr,qc,record,sp,p,Path,Path4);
            p=p-1;
            Path=Patht;
        end
    end
end
if (pc+1<=s(2))
    if ismember(m(pr,pc+1),V)==1
        if record(pr,pc+1)==0
            record(pr,pc+1)=1; 
            p=p+1;
            Patht=Path;
            Path=cat(1,Path,[pr,pc+1]);
            [sp,Path4]=FourPath(m,V,pr,pc+1,qr,qc,record,sp,p,Path,Path4);
            p=p-1;
            Path=Patht;
        end
    end
end
end


