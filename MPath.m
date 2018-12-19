function [sp,Pathm]=MPath(m,V,pr,pc,qr,qc,record,sp,p,Path,Pathm)
s=size(m);
%use backtracking to find the shortest path
if (pr==qr)&&(pc==qc)%test if tracking potin reach the end point
   if strcmpi(sp,'NaN')
      sp=p;
      Pathm=Path;
   else
       if p<sp
           sp=p;
           Pathm=Path;
       else
       if sp==p
           Pathm=cat(3,Pathm,Path);%add to path
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
            [sp,Pathm]=MPath(m,V,pr-1,pc,qr,qc,record,sp,p,Path,Pathm);
            p=p-1;
            Path=Patht;
        end
    end
    if(pc-1)>0
        if ismember(m(pr-1,pc-1),V)==1....
            &&ismember(m(pr,pc-1),V)==0....
            &&ismember(m(pr-1,pc),V)==0
            if record(pr-1,pc-1)==0
                record(pr-1,pc-1)=1; 
                p=p+1;
                Patht=Path;
                Path=cat(1,Path,[pr-1,pc-1]);
                [sp,Pathm]=MPath(m,V,pr-1,pc-1,qr,qc,record,sp,p,Path,Pathm);
                p=p-1;
                Path=Patht;
            end
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
            [sp,Pathm]=EightPath(m,V,pr,pc-1,qr,qc,record,sp,p,Path,Pathm);
            p=p-1;
            Path=Patht;
        end
    end
    if(pr+1)<=s(1)
        if ismember(m(pr+1,pc-1),V)==1....
                &&ismember(m(pr,pc-1),V)==0....
                &&ismember(m(pr+1,pc),V)==0
            if record(pr+1,pc-1)==0
                record(pr+1,pc-1)=1; 
                p=p+1;
                Patht=Path;
                Path=cat(1,Path,[pr+1,pc-1]);
                [sp,Pathm]=MPath(m,V,pr+1,pc-1,qr,qc,record,sp,p,Path,Pathm);
                p=p-1;
                Path=Patht;
            end
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
            [sp,Pathm]=MPath(m,V,pr+1,pc,qr,qc,record,sp,p,Path,Pathm);
            p=p-1;
            Path=Patht;
        end
    end
    if(pc+1)<=s(2)
        if ismember(m(pr+1,pc+1),V)==1....
                &&ismember(m(pr,pc+1),V)==0....
                &&ismember(m(pr+1,pc),V)==0
            if record(pr+1,pc+1)==0
                record(pr+1,pc+1)=1; 
                p=p+1;
                Patht=Path;
                Path=cat(1,Path,[pr+1,pc+1]);
                [sp,Pathm]=MPath(m,V,pr+1,pc+1,qr,qc,record,sp,p,Path,Pathm);
                p=p-1;
                Path=Patht;
            end
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
            [sp,Pathm]=MPath(m,V,pr,pc+1,qr,qc,record,sp,p,Path,Pathm);
            p=p-1;
            Path=Patht;
        end
    end
    if(pr-1)>0
        if ismember(m(pr-1,pc+1),V)==1....
                &&ismember(m(pr,pc+1),V)==0....
                &&ismember(m(pr-1,pc),V)==0
            if record(pr-1,pc+1)==0
                record(pr-1,pc+1)=1; 
                p=p+1;
                Patht=Path;
                Path=cat(1,Path,[pr-1,pc+1]);
                [sp,Pathm]=MPath(m,V,pr-1,pc+1,qr,qc,record,sp,p,Path,Pathm);
                p=p-1;
                Path=Patht;
            end
        end
    end
end
end


