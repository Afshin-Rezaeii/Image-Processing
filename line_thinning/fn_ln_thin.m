function [ ] = fn_ln_thin( ibw,image_skelet )

global ibw
global image_skelet
global M
global N

mark=0;
while(1==1)
    
    %step1===========================
for i=1:1:M-1
    for j=1:1:N-1
        if(ibw(i,j)==1)
            sp=0;                        
            p2=ibw(i-1,j);
            p3=ibw(i-1,j+1);
            p4=ibw(i,j+1);
            p5=ibw(i+1,j+1);
            p6=ibw(i+1,j);
            p7=ibw(i+1,j-1);
            p8=ibw(i,j-1);
            p9= ibw(i-1,j-1);
                      
            arr=[ p2,p3,p4,p5,p6,p7,p8,p9];
    %spi---------------------------------    
    
    for ii=1:1:7
          if(arr(ii)==0 && arr(ii+1)==1)
            sp=sp+1;
          end
    end
    
 if( arr(8)==0 && arr(1)==1)
         sp=sp+1;
 end
     
 %npi-----------------------------------
 np=0;
 for jj=1:1:8
    np=np+arr(jj);
 end
   
   % define condition----------------
    if(2<=np && np<=6  && sp==1 &&  p2*p4*p6==0 && p4*p6*p8==0)
        image_skelet(i,j)=0;
        mark=mark+1;
        
    end
        end
    end
end
    
   ibw=image_skelet;
    
    %step2============================
    for i=1:1:M-1
        for j=1:1:N-1
            if(ibw(i,j)==1)
                sp=0;
                p1=ibw(i,j);
                p2=ibw(i-1,j);
                p3=ibw(i-1,j+1);
                p4=ibw(i,j+1);
                p5=ibw(i+1,j+1);
                p6=ibw(i+1,j);
                p7=ibw(i+1,j-1);
                p8=ibw(i,j-1);
                p9= ibw(i-1,j-1);    
                arr=[ p2,p3,p4,p5,p6,p7,p8,p9];
                
    %===============spi=================
    for ii=1:1:7
          if(arr(ii)==0 && arr(ii+1)==1)
            sp=sp+1;
          end
    end
    
 if( arr(8)==0 && arr(1)==1)
         sp=sp+1;
 end
     
   %===============npi=================
 np=0;
 for jj=1:1:8
    np=np+arr(jj);
 end
      
   % define condition----------------
    if(2<=np && np<=6  && sp==1 &&  p2*p4*p8==0 && p2*p6*p8==0)
        image_skelet(i,j)=0;
               mark=mark+1;
    end
            end
        end
    end
        
    ibw=image_skelet;
if(mark==0)
    break;
else
    mark=0;
end
end






