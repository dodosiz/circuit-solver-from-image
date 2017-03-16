%%%%% Load circuit image %%%%%
path1='./images/selfmade/circuits/';
I = rgb2gray(imread([path1 'circuit_0' num2str(cir_number) 'b.png'])); % circuit image used for detection
I = imbinarize(I);

%%%%%%%% Remove characters from circuit image %%%
BW=bwlabel(1-I,4); %%% Find connected components.
N= max(BW(:)); %%% Find number of connected components -1
[p,q]=hist(BW(:),N+1);
q=floor(q);

p(p==max(p))=0; %%% Delete biggest connected component =background
L=q(p==max(p)); %%% Find second biggest connected component = circuit. 
t=BW==L;
Icirc=zeros(size(I));
Icirc(t)=1;
 Icirc = double(bwmorph(Icirc,'thicken'));

%%%%%%%% Merge components into a single structure
full_compns=[];
i=0;
if ~isempty(voltages)
  K=size(voltages,2);
  for j=1:K
      i=i+1;
      full_compns(i).type='voltages';
      full_compns(i).center=voltages(j).center;
      full_compns(i).unit=voltages(j).unit;
      full_compns(i).value=voltages(j).value;
    
  end
end
if ~isempty(currents)
  K=size(currents,2);
  for j=1:K
      i=i+1;
      full_compns(i).type='currents';
      full_compns(i).center=currents(j).center;
      full_compns(i).unit=currents(j).unit;
      full_compns(i).value=currents(j).value;
    
  end
end

if ~isempty(resistors)
  K=size(resistors,2);
  for j=1:K
      i=i+1;
      full_compns(i).type='resistors';
      full_compns(i).center=resistors(j).center;
      full_compns(i).unit=resistors(j).unit;
      full_compns(i).value=resistors(j).value;
    
  end
end

if ~isempty(capacitors)
  K=size(capacitors,2);
  for j=1:K
      i=i+1;
      full_compns(i).type='capacitors';
      full_compns(i).center=capacitors(j).center;
      full_compns(i).unit=capacitors(j).unit;
      full_compns(i).value=capacitors(j).value;
    
  end
end

if ~isempty(inductors)
  K=size(inductors,2);
  for j=1:K
      i=i+1;
      full_compns(i).type='inductors';
      full_compns(i).center=inductors(j).center;
      full_compns(i).unit=inductors(j).unit;
      full_compns(i).value=inductors(j).value;
    
  end
end

Total_No_Components=i;

%%%%% Draw Rectangulars around each component %%%%%%%%
Radial=100; %%%% Defines the size of the rectangular
for i=1:Total_No_Components
    cntr= full_compns(i).center;
    Icirc(cntr(2)-Radial:cntr(2)+Radial,cntr(1)-Radial:cntr(1)+Radial)= 1;
end
   
figure
imagesc(Icirc); hold on;
for i=1:Total_No_Components
    cntr= full_compns(i).center;
    plot(cntr(1),cntr(2),'*r');
end
hold off


%%%%%%%% Find connections between components 
cntrs= [];
for i=1:Total_No_Components
    cntrs= [cntrs ;full_compns(i).center];
end
Connections=zeros(Total_No_Components);

for i=1:Total_No_Components
    for j=1:Total_No_Components
        if i~=j && i<j
            Connections(i,j)=find_connection(Icirc,cntrs,i,j);
            Connections(j,i)=Connections(i,j);
        end
    end
end

        

