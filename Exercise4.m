
Nonoil = MRW92QJEdata(MRW92QJEdata.Nonoil==1,:);
intermediate = MRW92QJEdata(MRW92QJEdata.intermediate==1,:);
OECD = MRW92QJEdata(MRW92QJEdata.oecd==1,:);

%Nonoil Subsample
gdp1985 = Nonoil.gdpadult1985;
gdp1960 = Nonoil.gdpadult1960;
log_gdp1985 = log(gdp1985);
log_gdp1960 = log(gdp1960);
Iy = Nonoil.Iy;
log_Iy = log(Iy);
popgr = Nonoil.growthworkingagepop;
log_growth = log(popgr + 0.5);
school = Nonoil.school;
log_school = log(school);
y = log_gdp1985 - log_gdp1960;
X = [ones(size(log_gdp1960)) log_gdp1960 log_Iy log_growth log_school];
[a] = regress(y,X)

%intermediate Subsample
gdp1985 = intermediate.gdpadult1985;
gdp1960 = intermediate.gdpadult1960;
log_gdp1985 = log(gdp1985);
log_gdp1960 = log(gdp1960);
Iy = intermediate.Iy;
log_Iy = log(Iy);
popgr = intermediate.growthworkingagepop;
log_growth = log(popgr + 0.5);
school = intermediate.school;
log_school = log(school);
y = log_gdp1985 - log_gdp1960;
X = [ones(size(log_gdp1960)) log_gdp1960 log_Iy log_growth log_school];
[b] = regress(y,X)



%OECD Subsample
gdp1985 = OECD.gdpadult1985;
gdp1960 = OECD.gdpadult1960;
log_gdp1985 = log(gdp1985);
log_gdp1960 = log(gdp1960);
Iy = OECD.Iy;
log_Iy = log(Iy);
popgr = OECD.growthworkingagepop;
log_growth = log(popgr + 0.5);
school = OECD.school;
log_school = log(school);
y = log_gdp1985 - log_gdp1960;
X = [ones(size(log_gdp1960)) log_gdp1960 log_Iy log_growth log_school];
[c] = regress(y,X)


P = [a b c]

