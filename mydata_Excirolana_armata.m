function [data, auxData, metaData, txtData, weights] = mydata_Excirolana_armata
%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Malacostraca'; 
metaData.order      = 'Isopoda'; 
metaData.family     = 'Cirolanidae';
metaData.species    = 'Excirolana_armata'; 
metaData.species_en = 'Cirolanid Isopod'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MASE'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biS'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb';  'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L';'L-N'}; 

%metaData.COMPLETE = 0.0; % using criteria of LikaKear2011

metaData.author   = {'Tan Tjui Yeuw'};    
metaData.date_subm = [2021 03 01];              
metaData.email    = {'tan.tjui-yeuw@unesp.br'};            
metaData.address  = {'S�o Paulo State University (UNESP)'};  

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2016 10 15];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 10 15]; 

%% set data
% zero-variate data

data.ab = 60;    units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'Petracco2010';   
  temp.ab = C2K(23);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'incubation period of two months';
% data.ap = 45;   units.ap = 'd';    label.ap = 'age at puberty'; bibkey.ap = 'guess';
%   temp.ap = C2K(25);  units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 1.93*365; units.am = 'd';    label.am = 'life span';                   bibkey.am = 'Petracco2010';  
   temp.am = C2K(23);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.12;  units.Lb  = 'cm';  label.Lb  = 'total length at birth';      bibkey.Lb  = 'Petracco2010'; 
    comment.Lb = 'Smallest juvenile';
data.Lp  = 0.39;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty';    bibkey.Lp  = 'Petracco2010';
    comment.Lp = 'Smallest ovigerous';
data.Li  = 1.2;  units.Li  = 'cm';  label.Li  = 'ultimate total length';      bibkey.Li  = 'ThompsonSanchezdeBock2007';
    comment.Li = 'Largest female';
     
data.Wwb = 0.0017; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'guess';
  comment.Wwj = 'computed from Lj, and specific density 1 g/cm^3';
data.Wwp = 0.0137; units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';      bibkey.Wwp = 'guess';
  comment.Wwp = 'computed from Lp, and specific density 1 g/cm^3';
data.Wwi = 1.8158;  units.Wwi = 'g'; label.Wwi = 'ultimate dry weight';        bibkey.Wwi = 'guess';
  comment.Wwi = 'computed from Li, and specific density 1 g/cm^3';
  
data.Ri = 18*6/365;  units.Ri = '#/d';  label.Ri = 'maximum reprod rate';     bibkey.Ri = 'Petracco2010';  
  temp.Ri = C2K(23); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '18 eggs, with incubation period of two months, guessed 6 times a year. Zero weight, as it wasnt explaining the data'; 

% uni-variate data
% t-L data Fig 5 of Petracco2010:
data.tL = [ ... % time since birth (years), body length (mm)
0.092,1.228
0.12,1.576
0.139,1.95
0.199,2.377
0.215,3.178
0.225,2.964
0.244,3.472
0.263,3.632
0.278,3.819
0.285,4.033
0.294,4.54
0.321,4.674
0.328,4.139
0.344,4.62
0.352,4.7
0.368,4.861
0.383,4.647
0.4,5.208
0.404,5.101
0.416,4.78
0.464,5.555
0.478,5.501
0.488,5.234
0.5,4.754
0.541,5.715
0.557,5.528
0.589,5.822
0.646,5.688
0.656,6.009
0.725,6.062
0.732,6.383
0.797,6.249
0.856,6.223
0.885,6.783
1.043,7.691
1.227,7.264
1.31,7.691
 ];
data.tL(:,1) = data.tL(:,1)*365; % convert year to day
data.tL(:,2) = data.tL(:,2)/10; % convert mm to cm
units.tL  = {'d', 'cm'};  label.tL = {'time', 'body length'};  
temp.tL   = C2K(23);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = {'Petracco2010'};
comment.tL = 'Adult';
 
 % length - clutch size
data.LN = [ ... % body length (mm), n of embryos (#)
2.39 8.19
2.44 7.33
2.5 5.09
2.6 3.88
2.71 5.69
2.77 8.19
2.81 1.72
2.87 5.43
2.9 6.98
2.94 9.22
3 5.95
3.1 7.07
3.19 8.79
3.31 8.1
3.35 10
3.4 4.22
3.44 6.81
3.5 4.91
3.6 9.22
3.71 11.21
3.75 8.02
3.81 9.05
3.9 10.17
4 6.21
4.04 7.16
4.12 11.21
4.15 8.97
4.19 10.17
4.29 5.95
4.33 9.14
4.38 12.33
4.44 11.12
4.56 8.88
4.6 7.07
4.65 11.98
4.71 10
4.75 13.02
4.81 8.88
4.88 7.93
5.04 12.33
5.08 13.1
5.12 11.21
5.21 10
5.25 8.28
5.31 11.21
5.38 13.28
5.5 12.16
5.54 14.22
5.63 11.12
5.71 13.19
5.81 14.22
5.88 12.24
5.96 15.86
6.04 12.84
6.13 11.98
6.17 14.31
6.19 16.12
6.25 13.02
6.33 11.64
6.42 14.57
6.46 15.86
6.5 13.36
6.56 12.5
6.6 16.81
6.92 15.17
6.98 17.67
7.05 15.78
];
data.LN(:,1) = data.LN(:,1)/10; % convert mm to cm
units.LN   = {'cm', '#'};  label.LN = {'body length', 'embryos'};  
temp.LN   = C2K(23);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = {'Petracco2010'};


%% set weights for all real data
weights = setweights(data, []);
weights.Ri = 0 * weights.Ri;
weights.tL = 8 * weights.tL;
weights.LN = 8 * weights.LN;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for ouaput
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to have the same parameters as females';     
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'tL entry was extracted from a plot manually.';
metaData.bibkey.F1 = 'Petracco2010'; 
F2 = 'LN entry was extracted from a plot manually.';
metaData.bibkey.F2 = 'Petracco2010';    
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '3DJX6'; % Cat of Life
metaData.links.id_EoL = '344559'; % Ency of Life
metaData.links.id_Wiki = 'Excirolana'; % Wikipedia
metaData.links.id_ADW = 'Excirolana_armata'; % ADW
metaData.links.id_Taxo = ''; % Taxonomicon
metaData.links.id_WoRMS = '258412'; % WoRMS

%% References
bibkey = 'guess'; type = 'Misc'; bib = ... 
'howpublished = {\url{guess}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Petracco2010'; type = 'Article'; bib = [ ...  
'author = {Marcelo Petracco1 and Ricardo S. Cardoso and Thais N. Corbisier}, ' ...
'year = {2010}, ' ...
'title  = {Population biology of Excirolana armata (Dana, 1853)(Isopoda, Cirolanidae) on an exposed sandy beach in Southeastern Brazil}, ' ...
'journal = {Marine Ecology}, ' ...
'pages = {330�340}, ' ...
'volume = {31}, ' ...
'howpublished = {\url{htaps://onlinelibrary.wiley.com/doi/full/10.1111/j.1439-0485.2009.00341.x?}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ThompsonSanchezdeBock2007'; type = 'Article'; bib = [ ...  
'author = {G. A. Thompson1 and M. S�nchez de Bock}, ' ...
'year = {2007}, ' ...
'title  = {Population dynamics of Excirolana armata (Isopoda: Cirolanidae) in Buenos Aires beaches, Argentina ' ...
'journal = {Revista de Biologia Tropical}, ' ...
'pages = {131�140}, ' ...
'volume = {55}, ' ...
'howpublished = {\url{htaps://revistas.ucr.ac.cr/index.php/rbt/article/view/5813}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{htap://www.bio.vu.nl/thb/research/bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
