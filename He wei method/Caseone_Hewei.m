addpath(genpath(cd));
% The varying proportions of SD and SI noise in N(F)
snr=[20;30;40];
alpha=[0.1,0.2,0.25,0.33,0.5,1,2,3,4,5,10];

load Pavia_80;
F=OriData3; % ��Caseone_simu�У�����һ�����ݼ���Pavia city center,��ʱ����DC Mall data

%==========================================================================
% load Dc_Mall_data_info;
% F=D; % original Dc_Mall data has not been normalized. So, we normalize it first.
%============================================================================
[n1,n2,n3]=size(F);
F_max=max(reshape(F,numel(F),1));
F=F./F_max;
F=max(F,0);
maxP=max(F(:));


%===================================================================================================================================
snr_len=length(snr);
alpha_len=length(alpha);
PSNRvec=zeros(snr_len*alpha_len, 3);
Var_res=zeros(snr_len*alpha_len, 2+n3);


% parameter 
 M=20;
 stepsize=8; % M��stepsize�ǰ���He Wei���ã�
%  lambda = 1;

for Outloop=1:snr_len
    for Inloop=1:alpha_len
      [N_sd, N_si]=Noise_simu (F, snr(Outloop), alpha(Inloop)) ; %Y is the noisy Hyper-sepctral data by adding elementwise noise N(F) to clean data F
      Y=F+N_sd+N_si;  
      
      [Fhat] =NAIRLMA_denoise(Y,M,stepsize,1); % He wei�������ָ��PSNR��SSIM ��û����

      % �����ѭ�����Ҫ�����Ӧ��ͬ��snr��alpha��ϣ��õ���PSNRֵ��
      Fhat = max(Fhat,0);
      Fhat = min(Fhat,maxP);
      psnr= PSNR(F,Fhat,maxP);
      PSNRvec(Outloop*Inloop, :)=[snr(Outloop),alpha(Inloop),psnr]; %ǰ����snr(Outloop),alpha(Inloop)���ڱ�עʲô����µ�psnrȡֵ
     
      
      
      
      % ����residual noise
      Nresidual=F-Fhat;
      var_res=zeros(1,n3);
      for k=1:n3
       temp=Nresidual(:,:,k).*Nresidual(:,:,k);
       temp=sum(temp(:));
       var_res(k)=temp/(n1*n2);
      end %this loop computes the residual noise variance in each spectral band
      Var_res(Outloop*Inloop, :)=[snr(Outloop),alpha(Inloop),var_res]; %����residual noise variance in each spectral band
      
    end
    
end
PSNRvec_Hewei=PSNRvec;
Var_res_Hewei=Var_res;

 
save PSNRvec_Hewei_Caseone  PSNRvec_Hewei; %���Խ�Caseone�в�ͬ������浽ͬһ�ļ���
save Var_res_Hewei_Caseone    Var_res_Hewei;


