function V=find_connection(Icirc,cntrs,N,M)

goal=cntrs(M,:);
start=cntrs(N,:);
other_cntrs=cntrs;
other_cntrs(M,:)=[];other_cntrs(N,:)=[];
pos=start;
flag=1;
Thrs=5;

figure
imagesc(Icirc); hold on;
for i=1:size(cntrs,1)
   
    plot(cntrs(i,1),cntrs(i,2),'*r');
end

iter=0;

course=start;

while flag==1
    iter=iter+1
%     new_pos=[[pos(1)-1 pos(2)];[pos(1)+1 pos(2)];[pos(1) pos(2)-1];[pos(1) pos(2)+1]];
    new_pos=[[pos(1)-1 pos(2)];[pos(1)+1 pos(2)];[pos(1) pos(2)-1];[pos(1) pos(2)+1];[pos(1)+1 pos(2)+1];[pos(1)+1 pos(2)-1];[pos(1)-1 pos(2)+1];[pos(1)-1 pos(2)-1]];
   
    for i=1:8
        new_pos(i,:)=new_pos(i,:)*Icirc(new_pos(i,2),new_pos(i,1));
    end
    
        
    distance_from_goal=sqrt(sum((new_pos-repmat(goal,8,1)).^2,2));
    t=find(distance_from_goal==min(distance_from_goal));
    N=length(t);
    N=randi([1 N],1,1);
    
    pos=new_pos(t(N),:);
    
    %%%% Check if it returns to a previous position
    tmp = sqrt(sum((course-repmat(pos,iter,1)).^2,2));
    tmp2=find(tmp==0);
    while ~isempty(tmp2)

         distance_from_goal(t(N))=999999;
         t=find(distance_from_goal==min(distance_from_goal));    
         N=length(t);
         N=randi([1 N],1,1);
         pos=new_pos(t(N),:);
         tmp = sqrt(sum((course-repmat(pos,iter,1)).^2,2));
         tmp2=find(tmp==0);
    end
%     
    course=[course;pos];
    
   %%%%% Check if close to the target
    if min(distance_from_goal)< Thrs
        V=1;
        flag=0;
    end
    
    %%%%% Check if close to another target
    distance_from_others=sqrt(sum((other_cntrs-repmat(pos,size(cntrs,1)-2,1)).^2,2));
    if min(distance_from_others)< Thrs
        V=0;
        flag=0;
    end
    plot(pos(1),pos(2),'*g');pause(0.05);
    pos
end
hold off