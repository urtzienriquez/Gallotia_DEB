function [data, auxData, metaData, txtData, weights] = mydata_Gallotia_simonyi

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Lacertidae';
metaData.species    = 'Gallotia_simonyi'; 
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

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2016 11 03];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

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
data.am = 133*30;  units.am = 'd';    label.am = 'life span';            bibkey.am = 'MolinaRodriguez2004';   
  temp.am = C2K(24); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = '133 months according to MolinaRodriguez2004';

data.Lb  = 5.29;    units.Lb  = 'cm';  label.Lb  = 'SVL at hatching';      bibkey.Lb  = 'MolinaRodriguez2004';  
data.Lp  = 13.1;    units.Lp  = 'cm';  label.Lp  = 'SVL at puberty';      bibkey.Lp  = 'MolinaRodriguez2004';  
data.Lpm  = 13.5;    units.Lpm  = 'cm';  label.Lpm  = 'SVL at puberty males';      bibkey.Lpm  = 'MolinaRodriguez2004';  
data.Li  = 16.5;     units.Li  = 'cm';  label.Li  = 'ultimate SVL';         bibkey.Li  = 'MolinaRodriguez2004';  
data.Lim  = 19.4;     units.Lim  = 'cm';  label.Lim  = 'ultimate SVL males';         bibkey.Lim  = 'MolinaRodriguez2004';  

data.Wwi = 89.35;   units.Wwi = 'g';  label.Wwi = 'ultimate wet'; bibkey.Wwi = 'Bevia1999';
  comment.Wwi = 'Mean body mass for Tasartico population';
data.Wwim = 151.03;   units.Wwim = 'g';  label.Wwim = 'ultimate wet males'; bibkey.Wwim = 'Bevia1999';
  comment.Wwim = 'Mean body mass of males for Tasartico population';

data.Ri  = 8.6/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'MolinaRodriguez2004';   
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
bibkey.LN = {'RodriguezMolina1998'};

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
set1 = {'LN'}; comment1 = {'RodriguezMolina1998'};
metaData.grp.sets = {set1};
metaData.grp.comment = {comment1};

%% Discussion points
D1 = 'Temperatures are guessed';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '7cc21994a3a81bea79a427e804b57632'; % Cat of Life
metaData.links.id_EoL = '1056890'; % Ency of Life
metaData.links.id_Wiki = 'Gallotia_simonyi'; % Wikipedia
metaData.links.id_ADW = 'Gallotia_simonyi'; % ADW
metaData.links.id_Taxo = '642475'; % Taxonomicon
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
bibkey = 'CastBaez1988'; type = 'Article'; bib = [ ... 
'author = {J. Castanet and M. Baez}, ' ... 
'year = {1988}, ' ...
'title = {Data on age and longevity in \emph{Gallotia galloti} ({S}auria, {L}acertidae) assessed by skeletochronology}, ' ...
'journal = {Herpetological Journal}, ' ...
'volume = {1}, ' ...
'pages = {218-222}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

