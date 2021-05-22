function [data, auxData, metaData, txtData, weights] = mydata_Gallotia_stehlini

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Lacertidae';
metaData.species    = 'Gallotia_galloti'; 
metaData.species_en = 'Gallot''s lizard'; 
metaData.ecoCode.climate = {'BWh'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTg'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(26); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Urtzi Enriquez-Urzelai'};    
metaData.date_subm = [2021 05 22];              
metaData.email    = {'urtzi.enriquez@gmail.com'};            
metaData.address  = {'Czech Academy of Sciences'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 11 07];

%% set data
% zero-variate data

data.ab = 56;  units.ab = 'd';    label.ab = 'age at birth';         bibkey.ab = 'guess';   
  temp.ab = C2K(24); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on Lacerta agilis';
data.tp = 35*30;     units.tp = 'd';    label.tp = 'time since birth at puberty';  bibkey.tp = 'MolinaRodriguez2004';
  temp.tp = C2K(24); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '35 months according to MolinaRodriguez2004';
data.am = 145*30;  units.am = 'd';    label.am = 'life span';            bibkey.am = 'MolinaRodriguez2004';   
  temp.am = C2K(24); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = '145 months according to MolinaRodriguez2004';

data.Lb  = 5.21;    units.Lb  = 'cm';  label.Lb  = 'SVL at hatching';      bibkey.Lb  = 'MolinaRodriguez2004';  
data.Lp  = 13.5;    units.Lp  = 'cm';  label.Lp  = 'SVL at puberty';      bibkey.Lp  = 'MolinaRodriguez2004';  
data.Lpm  = 14.6;    units.Lpm  = 'cm';  label.Lpm  = 'SVL at puberty males';      bibkey.Lpm  = 'MolinaRodriguez2004';  
data.Li  = 17;     units.Li  = 'cm';  label.Li  = 'ultimate SVL';         bibkey.Li  = 'MolinaRodriguez2004';  
data.Lim  = 22;     units.Lim  = 'cm';  label.Lim  = 'ultimate SVL males';         bibkey.Lim  = 'MolinaRodriguez2004';  

data.Wwi = 88;   units.Wwi = 'g';  label.Wwi = 'ultimate wet'; bibkey.Wwi = 'Rivero2016';
  comment.Wwi = 'Mean body mass for Tasartico population';
data.Wwim = 94.59;   units.Wwim = 'g';  label.Wwim = 'ultimate wet males'; bibkey.Wwim = 'Rivero2016';
  comment.Wwim = 'Mean body mass of males for Tasartico population';

data.Ri  = 9.8/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'MolinaRodriguez2004';   
  temp.Ri = C2K(24);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'one clutch per year';

% univariate data
% t-L data
data.tL = [ ... % time since birth (d), SVL (mm)
730	89.78
730	93.661
730	109.767
730	113.454
1095	89.78
1095	93.855
1095	108.603
1095	108.603
1460	93.855
1460	104.722
1460	118.887
1460	118.887
1460	119.276
1460	133.053
1825	114.036
1825	114.036
1825	123.545
1825	123.545
1825	128.008
1825	128.008
1825	128.008
1825	128.008
1825	132.859
1825	132.859
1825	142.755
1825	192.238
2190	118.887
2190	118.887
2190	133.441
2190	133.441
2190	133.441
2190	137.71
2190	137.71
2190	137.71
2190	148.189
2555	137.516
2555	157.503
2920	122.962
2920	122.962
2920	137.516
2920	142.367
2920	147.219
2920	147.219
3285	122.962
3285	142.367
3285	167.4
3285	191.85];
data.tL(:,2) = data.tL(:,2) / 10; % convert mm to cm
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'SVL'};  
temp.tL   = C2K(24);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'CastBaez1998';
comment.tL = 'Data for females';

% t-L data for males
data.tLm = [ ... % time since birth (d), SVL (mm)
730	89.78
730	93.855
730	93.855
730	104.722
730	104.722
1095	93.855
1095	104.722
1095	104.722
1095	104.722
1460	104.722
1460	114.23
1460	114.23
1460	118.887
1460	123.351
1460	123.351
1460	127.814
1460	138.292
1460	138.292
1825	104.722
1825	104.722
1825	114.23
1825	118.499
1825	118.499
1825	123.157
1825	123.157
1825	128.202
1825	128.202
1825	162.549
2190	123.157
2190	133.441
2190	137.71
2555	118.887
2555	137.516
2555	142.367
2555	142.367
2920	208.538];
data.tLm(:,2) = data.tLm(:,2) / 10; % convert mm to cm
units.tLm  = {'d', 'cm'};  label.tLm = {'time since birth', 'SVL'};  
temp.tLm   = C2K(24);  units.temp.tLm = 'K'; label.temp.tLm = 'temperature';
bibkey.tLm = 'CastBaez1998';
comment.tLm = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.ab = 0.5 * weights.ab; % because it is approximated using another sp
weights.tL = 10 * weights.tL;
weights.tLm = 10 * weights.tLm;

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
set1 = {'tL','tLm'}; comment1 = {'Data for females and males (CastBaez1998)'};
metaData.grp.sets = {set1};
metaData.grp.comment = {comment1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp';
D2 = 'Temperatures are guessed';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Links
metaData.links.id_CoL = '7cc21994a3a81bea79a427e804b57632'; % Cat of Life
metaData.links.id_EoL = '1056890'; % Ency of Life
metaData.links.id_Wiki = 'Gallotia_galloti'; % Wikipedia
metaData.links.id_ADW = 'Gallotia_galloti'; % ADW
metaData.links.id_Taxo = '642475'; % Taxonomicon
metaData.links.id_ReptileDB = 'genus=Gallotia&species=galloti'; % ReptileDB

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Gallotia_galloti}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'CastBaez1988'; type = 'Article'; bib = [ ... 
'author = {J. Castanet and M. Baez}, ' ... 
'year = {1988}, ' ...
'title = {Data on age and longevity in \emph{Gallotia galloti} ({S}auria, {L}acertidae) assessed by skeletochronology}, ' ...
'journal = {Herpetological Journal}, ' ...
'volume = {1}, ' ...
'pages = {218-222}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

