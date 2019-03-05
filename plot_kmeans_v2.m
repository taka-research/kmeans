% plot the results

clear all;
clc;
close all;

load kmeans_stats_v2.mat

% variance explained
figure(1);
K = 2:20;
plot(K,Varexp,'k.-');
xlabel('number of clusters');
ylabel('frac of variance');
set(gca,'fontsize',14);
grid on;

% cluster maps
x=-179.5:179.5;
y=-89.5:89.5;
x(end+1)=x(1)+360;

Kval=[2 3 4 10];
for n=1:length(Kval)
    K=Kval(n);
    figure(n+1);
    map=Index{K-1}.Map;
    map(end+1,:)=map(1,:);
    m_proj('robinson','clon',-150);
    m_pcolor(x,y,map'); 
    hold on;
    m_pcolor(x-360,y,map'); 
    hold off;
    colormap('jet');
    shading flat; 
    colorbar;
    m_grid('xaxis','middle');
    m_coast;
    title([num2str(K),' clusters'],'fontsize',15);

    figure(n+20);
    c=Index{K-1}.CenteroidND;
    N=K;
    M=ceil(N/2);
    for i=1:N
       subplot(M,2,i);
       bar(c(:,i));
       set(gca,'xticklabel',{'SST' 'XMLD' 'NO3' 'SiO3' 'PO4' 'log(Chl)'});
    end
end








