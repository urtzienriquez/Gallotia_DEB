function [data, auxData, metaData, txtData, weights] = mydata_Gallotia_caesaris

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Lacertidae';
metaData.species    = 'Gallotia_caesaris'; 
metaData.species_en = 'Boettgers lizard';  % it should be Boettger's
metaData.ecoCode.climate = {'BWh'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTg'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(26); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Lpm'; 'Li'; 'Lim'; 'Wwi'; 'Wwim'; 'Ri'}; 
metaData.data_1     = {'L-N'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Urtzi Enriquez-Urzelai'};    
metaData.date_subm = [2021 05 26];              
metaData.email    = {'urtzi.enriquez@gmail.com'};            
metaData.address  = {'Czech Academy of Sciences'};   

metaData.curator     = {'Nina Marn'};
metaData.email_cur   = {'nina.marn@gmail.com'}; 
metaData.date_acc    = [2021 05 26];

%% set data
% zero-variate data

data.ab = 56;  units.ab = 'd';    label.ab = 'age at birth';         bibkey.ab = 'guess';   
  temp.ab = C2K(24); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on Lacerta agilis';
data.tp = 23*30;     units.tp = 'd';    label.tp = 'time since birth at puberty';  bibkey.tp = 'MoliRodr2004';
  temp.tp = C2K(24); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '23 months according to MolinaRodriguez2004';
data.am = 62*30;  units.am = 'd';    label.am = 'life span';            bibkey.am = 'MoliRodr2004';   
  temp.am = C2K(24); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = '62 months according to MolinaRodriguez2004';

data.Lb  = 3.4;    units.Lb  = 'cm';  label.Lb  = 'SVL at hatching';      bibkey.Lb  = 'MoliRodr2004';  
data.Lp  = 5.7;    units.Lp  = 'cm';  label.Lp  = 'SVL at puberty';      bibkey.Lp  = 'MoliRodr2004';  
data.Lpm  = 6.2;    units.Lpm  = 'cm';  label.Lpm  = 'SVL at puberty males';      bibkey.Lpm  = 'MoliRodr2004';  
data.Li  = 7.7;     units.Li  = 'cm';  label.Li  = 'ultimate SVL';         bibkey.Li  = 'MoliRodr2004';  
data.Lim  = 8.7;     units.Lim  = 'cm';  label.Lim  = 'ultimate SVL males';         bibkey.Lim  = 'MoliRodr2004';  

data.Ww0 = 1.21;   units.Ww0 = 'g';  label.Ww0 = 'wet weight of eggs'; bibkey.Ww0 = 'MoliRodr2004';
  comment.Ww0 = 'Body mass of eggs';
data.Wwb = 0.94;   units.Wwb = 'g';  label.Wwb = 'wet weight of hatchlings'; bibkey.Wwb = 'MoliRodr2004';
  comment.Wwb = 'Body mass of hatchlings';
data.Wwi = 9.3;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'Lope2015';
  comment.Wwi = 'ultimate body mass of females';
data.Wwim = 18.5;   units.Wwim = 'g';  label.Wwim = 'ultimate wet males'; bibkey.Wwim = 'Lope2015';
  comment.Wwim = 'ultimate body mass of males';

data.Ri  = 2.5/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'MoliRodr2004';   
  temp.Ri = C2K(24);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'one clutch per year';

% univariate data
% t-L data
data.tL = [ ... % time since birth (month), SVL (mm)
0.081	29.157
0.081	31.768
0.081	32.48
0.081	33.311
0.081	34.142
0.081	34.973
1.049	29.866
1.049	33.783
1.049	34.97
1.049	36.751
1.049	38.768
10.003	46.936
10.003	47.648
10.003	49.547
9.035	51.33
9.035	52.042
9.035	53.704
10.003	51.447
10.003	53.702
10.003	55.482
10.003	56.194
10.003	61.18
11.213	55.36
12.101	57.139
12.101	52.391
14.037	50.843
32.188	55.309
32.188	57.208
32.108	60.057
33.076	58.274
33.076	60.173
33.076	61.36
33.076	62.072
32.995	64.327
34.044	65.037
34.044	61.239
34.124	60.764
34.044	60.171
35.173	63.135
35.173	61.236
35.173	58.269
37.109	57.196
37.109	58.264
37.19	61.824
42.03	64.305
46.064	75.096
49.129	74.97
49.129	71.053
49.129	69.985
49.129	66.899];
data.tL(:,1) = data.tL(:,1) * 30; % convert month to d
data.tL(:,2) = data.tL(:,2) / 10; % convert mm to cm
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'SVL'};  
temp.tL   = C2K(24);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Garc1999';
comment.tL = 'Data for mixed sexes';

%% set weights for all real data
weights = setweights(data, []);
weights.ab = 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.2;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL'}; comment1 = {'Garc1999'};
metaData.grp.sets = {set1};
metaData.grp.comment = {comment1};

%% Discussion points
D1 = 'Temperatures are guessed';
D2 = 'Data for G. caesaris caesaris (El Hierro)';
D3 = 'In Garc1999 authors say that the growth curve is lower than expected due to drought';
metaData.discussion = struct('D1', D1, 'D2', D2, 'D3', D3);

%% Links
metaData.links.id_CoL = '7H53X'; % Cat of Life
metaData.links.id_EoL = '1056892'; % Ency of Life
metaData.links.id_Wiki = 'Gallotia_caesaris'; % Wikipedia
metaData.links.id_ADW = 'Gallotia_caesaris'; % ADW
metaData.links.id_Taxo = '642474'; % Taxonomicon
metaData.links.id_ReptileDB = 'genus=Gallotia&species=caesaris'; % ReptileDB

%% References
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MoliRodr2004'; type = 'Article'; bib = [ ... 
'author = {M. Molina-Borja and M.A. Rodriguez-Dominguez}, ' ... 
'year = {2004}, ' ...
'title = {Evolution of biometric and life-history traits in lizards (Gallotia) from the Canary Islands}, ' ...
'journal = {J. Zool. Syst. Evol. Research}, ' ...
'volume = {42}, ' ...
'pages = {44-53}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Lope2015'; type = 'Article'; bib = [ ... 
'author = {M. Lopez?Darias, B. Vanhooydonck, R. Cornette & A. Herrel}, ' ... 
'year = {2015}, ' ...
'title = {Sex-specific differences in ecomorphological relationships in lizards of the genus Gallotia}' ...
'journal = {Functional Ecology}, ' ...
'volume = {29}, ' ...
'pages = {506?514}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Garc1999'; type = 'Incollection'; bib = [ ... 
'author = {M. Garcia-Marquez, L.F. López-Jurado and J.A. Mateo}, ' ... 
'year = {1999}, ' ...
'title = {Características reproductoras y procesos demográficos en una población de Gallotia caesaris (Lacertidae) de El Hierro (Islas Canarias)}, ' ...
'booktitle = {El lagarto de El Hierro: Bases para su conservacion}, ' ...
'editor = {L.F. Lopez-Jurado and J.A. Mateo}, ' ...
'publisher = {Asociacion Herpetologica Española}, ' ...
'address = {Madrid}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

