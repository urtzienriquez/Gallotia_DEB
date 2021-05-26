function [data, auxData, metaData, txtData, weights] = mydata_Gallotia_simonyi

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Lacertidae';
metaData.species    = 'Gallotia_simonyi'; 
metaData.species_en = 'El Hierro giant lizard'; 
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
data.tp = 35*30;     units.tp = 'd';    label.tp = 'time since birth at puberty';  bibkey.tp = 'MoliRodr2004';
  temp.tp = C2K(24); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '35 months according to MolinaRodriguez2004';
data.am = 133*30;  units.am = 'd';    label.am = 'life span';            bibkey.am = 'MoliRodr2004';   
  temp.am = C2K(24); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = '133 months according to MolinaRodriguez2004';

data.Lb  = 5.29;    units.Lb  = 'cm';  label.Lb  = 'SVL at hatching';      bibkey.Lb  = 'MoliRodr2004';  
data.Lp  = 13.1;    units.Lp  = 'cm';  label.Lp  = 'SVL at puberty';      bibkey.Lp  = 'MoliRodr2004';  
data.Lpm  = 13.5;    units.Lpm  = 'cm';  label.Lpm  = 'SVL at puberty males';      bibkey.Lpm  = 'MoliRodr2004';  
data.Li  = 16.5;     units.Li  = 'cm';  label.Li  = 'ultimate SVL';         bibkey.Li  = 'MoliRodr2004';  
data.Lim  = 19.4;     units.Lim  = 'cm';  label.Lim  = 'ultimate SVL males';         bibkey.Lim  = 'MoliRodr2004';  

data.Wwi = 89.35;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'Rome1999';
  comment.Wwi = 'Mean body mass for Tasartico population';
data.Wwim = 151.03;   units.Wwim = 'g';  label.Wwim = 'ultimate wet males'; bibkey.Wwim = 'Rome1999';
  comment.Wwim = 'Mean body mass of males for Tasartico population';

data.Ri  = 8.6/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'MoliRodr2004';   
  temp.Ri = C2K(24);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'one clutch per year';

% univariate data
% length - yearly fecundity
data.LN = [ ... 
171.9491	6.8707
175.9138	6.8659
177.9099	6.8580
176.8887	7.7144
179.8871	8.5961
179.8871	9.5082
181.8863	7.6931
184.9269	6.8533
185.8660	6.8596
184.8843	8.5724
182.8942	9.5236
184.8843	9.5126
187.8884	10.4785
197.9703	8.5803
193.8653	11.4868
197.9247	12.5141
200.9555	9.5060];
data.LN(:,1) = data.LN(:,1) / 10; % convert mm to cm
units.LN = {'cm', '#'}; label.LN = {'length', 'yearly fecundity'};
temp.LN = C2K(26.5); units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = {'RodrMoli1998'};

%% set weights for all real data
weights = setweights(data, []);

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
set1 = {'LN'}; comment1 = {'RodrMoli1998'};
metaData.grp.sets = {set1};
metaData.grp.comment = {comment1};

%% Discussion points
D1 = 'Temperatures are guessed';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '3F6ZQ'; % Cat of Life
metaData.links.id_EoL = '794632'; % Ency of Life
metaData.links.id_Wiki = 'Gallotia_simonyi'; % Wikipedia
metaData.links.id_ADW = 'Gallotia_simonyi'; % ADW
metaData.links.id_Taxo = '642477'; % Taxonomicon
metaData.links.id_ReptileDB = 'genus=Gallotia&species=simonyi'; % ReptileDB

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
bibkey = 'MoliRodr2004'; type = 'Article'; bib = [ ... 
'author = {M. Molina-Borja and M.A. Rodriguez-Dominguez}, ' ... 
'year = {2004}, ' ...
'title = {Evolution of biometric and life-history traits in lizards (Gallotia) from the Canary Islands}, ' ...
'journal = {J. Zool. Syst. Evol. Research}, ' ...
'volume = {42}, ' ...
'pages = {44-53}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'RodrMoli1998'; type = 'Article'; bib = [ ... 
'author = {M.A. Rodriguez-Dominguez and M. Molina-Borja}, ' ... 
'year = {1998}, ' ...
'title = {Reproduction of the endangered Hierro giant lizard Gallotia simonyi machadoi}, ' ...
'journal = {Journal of Herpetology}, ' ...
'volume = {32}, ' ...
'pages = {498-504}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Rome1999'; type = 'Incollection'; bib = [ ... 
'author = {M. Romero-Bevia, J.A. Mateo and V. Perez-Mellado}, ' ... 
'year = {1999}, ' ...
'title = {Morfometria y estructura en edades y sexos de la poblacion natural de Gallotia simonyi}, ' ...
'booktitle = {El lagarto de El Hierro: Bases para su conservacion}, ' ...
'editor = {L.F. Lopez-Jurado and J.A. Mateo}, ' ...
'publisher = {Asociacion Herpetologica Española}, ' ...
'address = {Madrid}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


