%��Casetwo�У�������Ҫ��Pavia city center��Washington DC���������ݼ�����ʵ��
load Var_res_RLRTA_Pavia; % ���ݸ�ʽ�ǣ�[snr,alpha,rho_s, var_res],����[snr,alpha,rho_s]��casetwo������������ֱ���snr=20dB, alpha=1, rho_s=0.1
                          % var_res��һ������Ϊn3 (n3 is the number of spectral
                          % bands).�Ƕ�Ӧ��ÿ��spectral band��residual noise
                          % variance
load Var_res_Hewei_Pavia;  
load Var_res_parafac_Pavia % Liu Xuefeng������

figure(1)
plot(Var_res_RLRTA_Pavia(3:end), 'b--o');
hold on
plot(Var_res_Hewei_Pavia(3:end), 'c-*');
hold on
plot(Var_res_parafac_Pavia(3:end), 'g-'); % Liu��ʵ�黹û�����ȷ�����

hold off

load Var_res_RLRTA_DC; % ���ݸ�ʽ�ǣ�[snr,alpha,rho_s, var_res],����[snr,alpha,rho_s]��casetwo������������ֱ���snr=20dB, alpha=1, rho_s=0.1
                          % var_res��һ������Ϊn3 (n3 is the number of spectral
                          % bands).�Ƕ�Ӧ��ÿ��spectral band��residual noise
                          % variance
load Var_res_Hewei_DC;  
load Var_res_parafac_DC % Liu Xuefeng���㷨



figure (2)
plot(Var_res_RLRTA_DC(3:end), 'b--o');
hold on
plot(Var_res_Hewei_DC(3:end), 'c-*');
hold on
plot(Var_res_parafac_DC(3:end), 'g-');

hold off


