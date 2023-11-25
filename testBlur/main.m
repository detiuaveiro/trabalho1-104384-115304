%% Constantes a alterar.....

i_min = 1;
increment = 1;
i_max = 500; % pixeis = i * i

dx = 2;
dy = 2;
colorV1 = "o-";
colorV2 = "o-";
% Para adicionar ao grafico o dx=2 e dy=2, basta retirar "r" e "b" das
% cores de cima e mudar os valores da janela e executar "Executar e ler dados"

% Executar e ler dados


if (1) % Varia o numero de pixeis
    status = system(sprintf("./execute_blurTestsBySize.sh %d %d %d %d %d",i_min,increment,i_max,dx,dy)); % generate the file text with data
else   % Varia a janela (dx/dy)
    status = system(sprintf("./execute_blurTestsByWindow.sh %d %d %d %d %d",i_min,increment,i_max,dx,dy)); % generate the file text with data
end

file = fopen("data_blurTests.txt","r");
formatSpec = '%d %f %f %d %d %d';
data = textscan(file, formatSpec);
fclose(file);

nPixelsArray = double(data{1});
timeArray = double(data{2}); % 1
caltimeArray = double(data{3});
PIXMEMArray = double(data{4}); % 2
COMPARISONSArray = double(data{5}); % 3
OPERATIONSArray = double(data{6}); % 4


%% Tempo de execucao em funcao de n
f1_time = figure(1);

%Version 1
plot(nPixelsArray(1:2:end),timeArray(1:2:end),colorV1,'DisplayName',sprintf("Versao 1 - W%dx%d",dx,dy));
hold on;
% Version 2
plot(nPixelsArray(2:2:end),timeArray(2:2:end),colorV2,'DisplayName',sprintf("Versao 2 - W%dx%d",dx,dy));

grid on
title("Tempo de execucao em funcao de n pixeis")
xlabel("Numero de pixeis da imagem")
ylabel("Tempo de execucao (segundos)")
legend

if 1
  f1_time.PaperType='A4';
  f1_time.PaperOrientation='landscape';
  f1_time.PaperUnits='points';
  print(sprintf("time/time_S%dx%d_W%dx%d.pdf",i_max,i_max,dx,dy),'-dpdf','-noui','-fillpage');
end


%% Numero de acessos (PIXMEM) em funcao de n
f2_pixmem = figure(2);

%Version 1
plot(nPixelsArray(1:2:end),PIXMEMArray(1:2:end),colorV1,'DisplayName',sprintf("Versao 1 - W%dx%d",dx,dy));
hold on;
% Version 2
plot(nPixelsArray(2:2:end),PIXMEMArray(2:2:end),colorV2,'DisplayName',sprintf("Versao 2 - W%dx%d",dx,dy));

grid on
title("Numero de acessos (PIXMEM) em funcao de n pixeis")
xlabel("Numero de pixeis da imagem")
ylabel("Numero de acessos (PIXMEM)")
legend

if 1
  f2_pixmem.PaperType='A4';
  f2_pixmem.PaperOrientation='landscape';
  f2_pixmem.PaperUnits='points';
  print(sprintf("pixmem/pixmem_S%dx%d_W%dx%d.pdf",i_max,i_max,dx,dy),'-dpdf','-noui','-fillpage');
end

%% Numero de comparacoes em funcao de n
f3_comparisons = figure(3);

%Version 1
plot(nPixelsArray(1:2:end),COMPARISONSArray(1:2:end),colorV1,'DisplayName',sprintf("Versao 1 - W%dx%d",dx,dy));
hold on;
% Version 2
plot(nPixelsArray(2:2:end),COMPARISONSArray(2:2:end),colorV2,'DisplayName',sprintf("Versao 2 - W%dx%d",dx,dy));

grid on
title("Numero de comparacoes em funcao de n")
xlabel("Numero de pixeis da imagem")
ylabel("Numero de comparacoes (COMPARISONS)")
legend

if 1
  f3_comparisons.PaperType='A4';
  f3_comparisons.PaperOrientation='landscape';
  f3_comparisons.PaperUnits='points';
  print(sprintf("comparisons/comparisons_S%dx%d_W%dx%d.pdf",i_max,i_max,dx,dy),'-dpdf','-noui','-fillpage');
end

%% Numero de operacoes relevantes (OPERATIONS) em funcao de n
f4_operations = figure(4);

%Version 1
plot(nPixelsArray(1:2:end),OPERATIONSArray(1:2:end),colorV1,'DisplayName',sprintf("Versao 1 - W%dx%d",dx,dy));
hold on;
% Version 2
plot(nPixelsArray(2:2:end),OPERATIONSArray(2:2:end),colorV2,'DisplayName',sprintf("Versao 2 - W%dx%d",dx,dy));

grid on
title("Numero de operacoes (relevantes) em funcao de n")
xlabel("Numero de pixeis da imagem")
ylabel("Numero de operacoes (OPERATIONS)")
legend

if 1
  f4_operations.PaperType='A4';
  f4_operations.PaperOrientation='landscape';
  f4_operations.PaperUnits='points';
  print(sprintf("operations/operations_S%dx%d_W%dx%d.pdf",i_max,i_max,dx,dy),'-dpdf','-noui','-fillpage');
end