%% Caseone,���Բμ�����"Reduction of Signal-Dependent Noise From Hyperspectral Images for Target Detection"
% written by Liu Xuefeng.  ��Caseoneʵ������չʾ��Ҫ����ľ�����������
% �� �������ͼ5�� ������Ҫ��ʾ��ͬ�㷨�ڲ�ͬ(snr, alpha)����У��õ���residual noise, �� F-Fhat.
% ������������ѡ����ǣ� snr=20dB,alpha=0.1; snr=30dB, alpha=1; snr=40, alpha=10; ������ֵ
% ����Ҳ���ݶ������飬���Ը��ݾ���ʵ������ѡ����ʺ���ʾ�����

load Var_res_RLRTA_Caseone; % Var_res_RLRTA ��һ��sizeΪ(snr_len*alpha_len, 2+n3)�ľ���
% Var_res_RLRTA_Caseone ����Caseone_simu_RLRTA.m �õ���������������
load Var_res_Hewei_Caseone; %  Var_res_Hewei
% Var_res_Hewei_Caseone ���� Casetwo_Hewei.m �õ��� ������������
load Var_res_parafac_Caseone; %Liu Xuefeng��parafac �㷨��
table=[20,0.1;30,1;40,10]; %ѡ�����鲻ͬ��snr+alpha��ϣ�Ҳ����ѡ������
num1=size(table,1);
index=zeros(num1,1);
[m1,m2]=size(Var_res_RLRTA);
for Outloop=1:numl
    for j=1:m1
    if Var_res_RLRTA(j,1)==table(Outloop,1)&&Var_res_RLRTA(j,2)==table(Outloop,2)
       index(Outloop)=j;
       break;
    end
    end
end

%% ��ʾ���

for Outloop=1:numl
    
    figure(Outloop)
    plot(Var_res_RLRTA(index(Outloop), 3:end), 'b--o');
    hold on
    plot(Var_res_Hewei(index(Outloop), 3:end), 'c-*');
    hold on
    plot(Var_res_parafac(index(Outloop), 3:end), 'g-'); 
    
    hold off
    
    
end