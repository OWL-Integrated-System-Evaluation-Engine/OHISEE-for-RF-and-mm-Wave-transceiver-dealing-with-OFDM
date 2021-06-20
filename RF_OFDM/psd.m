%���������������źŹ�����
%���ߣ�PENG JUN
%�޸�ʱ�䣺20130819    
%�ο����ϣ�

%%%%%%%%%%%%%%%%%%%%%%%%%%
function psd(in_signal,varargin)
%  psd(x)    �����źŵĹ����ף�Ĭ��ʹ��hann������Ϊ1024.
%  psd(x,fs)  fsΪ������
%  psd(x,fs,'r') ��r��������ɫ
narginchk(1, 3);
if nargin<2
    fs=3.2e7;
    c='r';
elseif nargin<3
    fs=varargin{1};
    c='r';
else
    fs=varargin{1};
    c=varargin{2};
end
    
% window = hann(1024);
nfft=2^(nextpow2(length(in_signal))-2)/4;
win=window(@hann,nfft);
olp=nfft/2;
[xx ,f1] = pwelch(in_signal,win,olp,nfft,fs);
xx = 10*log10(fftshift(xx));                           %���ó���xxת��Ϊ��0Ϊ������ʾ������ȡ���ʶ���
%%%%%%%ʹ���еĵ㶼��0dB����%%%%%%%%
max_xx = max(xx);
max_xx = 0 - max_xx;
xx = xx + max_xx;
%%%%%%%%%ʹ�����׹���0�Գ���ʾ%%%%%%%%%%

f=f1-max(f1)/2;
if strcmp(c,'rand')
    plot(f,xx,'color',[rand,rand,rand])
else
   plot(f,xx,c);
end
% title('�źŹ�����');
% axis([-max(f1)/2,max(f1)/2,min(xx),0])
xlabel('Normalized Frequency(HZ)');
ylabel('Normalized Power Spectral Density(dB)');

grid on;



