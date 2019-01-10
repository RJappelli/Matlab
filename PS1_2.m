clear all
clc

%Load the quarterly GDP data from Germany and Greece
data=xlsread("OECD-Germany_Greece_GDP")';
%Log of the data
log_data = log(data);

%Separating between countries' data: Ger for German and Gre for Greece
Ger = log_data(:,1);
Gre = log_data(:,2);

%Calculating the trend from log GDP of Germany and Greece using lambda =
%1600
T_Ger = hpfilter(Ger,1600);
T_Gre = hpfilter(Gre,1600);

%Calculating the trend using OLS:
%Calculating the coefficient regressor:

%For Germany
X_Ger = [ones(length(Ger),1),(1:1:length(Ger))'];
beta_Ger = inv(X_Ger'*X_Ger)*X_Ger'*Ger;

%For Greece
X_Gre = [ones(length(Gre),1),(1:1:length(Gre))'];
beta_Gre = inv(X_Gre'*X_Gre)*X_Gre'*Gre;

%The linear trend for Germany from OLS
Y_Ger_hat = X_Ger*beta_Ger;

%The linear trend for Gre from OLS
Y_Gre_hat = X_Gre*beta_Gre;

%Calculating The Output Gap

%Germany
%Output Gap From HP Filter
Real_T_Ger = exp(T_Ger);
G_Ger_hp = (exp(Ger) - Real_T_Ger)./Real_T_Ger;
%Output Gap From OLS
Real_OLS_Ger = exp(Y_Ger_hat);
G_Ger_OLS = (exp(Ger) - Real_OLS_Ger)./Real_OLS_Ger;

%Greece
%Output Gap From HP Filter
Real_T_Gre = exp(T_Gre);
G_Gre_hp = (exp(Gre) - Real_T_Gre)./Real_T_Gre;
%Output Gap From OLS
Real_OLS_Gre = exp(Y_Gre_hat);
G_Gre_OLS = (exp(Gre) - Real_OLS_Gre)./Real_OLS_Gre;

%Plot log GDP with Hp Filter and OLS Trend
%Germany
figure('name','Log GDP versus Trends')
subplot(2,1,1)
plot(Ger)
hold on
plot(T_Ger)
plot(Y_Ger_hat,'green')
hold off
legend('Log GDP' ,'HP Filter', 'OLS','Location','southeast')
ylabel('Log GDP')
xlabel('Number of Quarters Starting from Q1 1995')
title('Log GDP, HP Filter and OLS Trend of Germany')

%Greece
subplot(2,1,2)
plot(Gre)
hold on
plot(T_Gre)
plot(Y_Gre_hat,'green')
hold off
legend('Log GDP' ,'HP Filter', 'OLS','Location','northwest')
ylabel('Log GDP')
xlabel('Number of Quarters Starting from Q1 1995')
title('Log GDP, HP Filter and OLS Trend of Greece')

%Plotting The Output Gaps from HP Filter and OLS
%Germany
figure('name','Output Gap')
subplot(2,1,1)
plot(G_Ger_hp)
hold on
plot(G_Ger_OLS)
yline(0)
hold off
legend('HP Filter' ,'OLS','Location','southeast')
ylabel('Output Gap')
xlabel('Number of Quarters Starting from Q1 1995')
title('Output Gap from HP Filter and OLS Trend of Germany')

%Greece
subplot(2,1,2)
plot(G_Gre_hp)
hold on
plot(G_Gre_OLS)
yline(0)
hold off
legend('HP Filter' ,'OLS','Location','southeast')
ylabel('Output Gap')
xlabel('Number of Quarters Starting from Q1 1995')
title('Output Gap from HP Filter and OLS Trend of Greece')






