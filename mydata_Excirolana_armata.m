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

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb';  'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L';'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Tan Tjui Yeuw', 'Samantha Abreu Alves dos Santos', 'Fabio Stucchi Vannucchi'};    
metaData.date_subm = [2021 03 01];              
metaData.email    = {'tan.tjui-yeuw@unesp.br'};            
metaData.address  = {'São Paulo State University (UNESP)'};  

metaData.curator     = {};
metaData.email_cur   = {}; 
metaData.date_acc    = []; 

%% set data
% zero-variate data

data.ab = 60;    units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'Petracco2010';   
  temp.ab = C2K(23);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'incubation period of two months';
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
  
data.Ri = 39*5/365;  units.Ri = '#/d';  label.Ri = 'maximum reprod rate';     bibkey.Ri = 'LozoyaDefeo2006';  
  temp.Ri = C2K(17); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'guessed 5 times a year'; 

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
    % Brazil
data.LN_br = [ ... % body length (mm), n of embryos (#)
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
data.LN_br(:,1) = data.LN_br(:,1)/10; % convert mm to cm
units.LN_br   = {'cm', '#'};  label.LN_br = {'body length', 'embryos'};  
temp.LN_br   = C2K(23);  units.temp.LN_br = 'K'; label.temp.LN_br = 'temperature';
bibkey.LN_br = {'Petracco2010'};

    % Uruguai
data.LN_ur = [ ... % body length (mm), n of embryos (#)
2.7	5.1
3.8	2.0
3.2	11.0
3.4	10.9
3.6	6.1
3.8	6.0
3.9	6.1
4.1	6.2
4.2	6.1
4.1	5.4
4.2	3.9
4.4	4.9
4.5	5.8
4.9	5.0
4.1	6.8
3.9	7.8
3.7	8.9
3.9	8.6
3.8	10.0
4.0	11.2
4.1	12.0
4.3	11.8
4.1	10.0
3.9	9.2
4.1	9.1
4.0	8.1
4.2	8.1
4.4	8.0
4.4	8.9
4.4	10.0
4.3	15.5
4.4	13.9
4.4	12.0
4.6	11.8
4.7	10.3
4.7	8.3
4.8	7.3
4.8	9.1
5.2	6.9
5.3	5.9
5.9	3.2
5.2	7.9
5.4	7.9
5.4	9.0
5.6	9.0
5.2	11.0
5.0	11.9
4.8	12.1
4.7	12.0
4.7	13.1
4.9	13.2
5.0	13.1
4.7	15.1
4.8	14.9
4.8	16.2
4.7	16.0
4.7	17.1
5.0	14.9
5.3	13.9
5.3	15.1
5.3	12.0
5.4	12.1
5.4	11.0
5.6	10.8
5.8	9.7
5.6	11.9
5.9	12.0
6.2	11.0
6.3	12.1
6.0	13.0
6.2	13.1
5.9	12.9
5.9	14.3
5.7	14.0
5.7	13.0
5.5	13.0
5.5	13.8
5.6	15.0
5.1	16.8
5.3	17.9
5.1	19.7
5.4	20.1
5.4	19.0
5.6	18.9
5.6	18.2
5.6	17.0
5.7	17.0
5.9	16.8
5.7	16.1
5.8	15.2
6.0	15.1
6.3	16.3
6.5	16.1
6.6	16.0
6.5	15.2
6.8	14.0
6.8	8.2
6.2	16.8
6.1	18.3
6.1	18.0
5.9	18.2
5.8	19.3
6.0	18.9
6.0	19.9
5.8	20.0
5.8	21.0
5.9	21.0
5.7	23.1
7.2	12.9
7.4	12.9
6.9	14.9
7.1	15.1
7.4	15.3
7.7	14.8
7.0	15.9
6.9	16.9
6.8	16.9
6.9	18.0
7.4	17.0
7.4	18.0
7.3	18.0
7.2	19.1
7.1	19.0
6.9	19.0
6.7	19.0
6.5	18.0
6.3	18.9
6.3	20.0
6.2	19.9
6.5	19.7
6.6	19.8
6.1	22.0
6.1	21.9
6.3	21.8
6.2	21.0
6.3	21.1
6.5	21.0
6.6	20.9
6.8	21.4
6.9	21.0
7.0	21.0
6.8	19.6
6.9	19.9
7.0	19.9
7.4	19.6
7.5	21.1
7.8	19.7
8.2	18.1
7.0	22.5
6.7	21.8
6.6	22.0
6.4	22.9
6.6	22.8
6.6	23.9
6.8	23.9
6.8	24.9
6.6	24.9
6.4	25.2
6.3	26.2
6.2	28.1
6.6	27.1
6.8	26.9
6.9	23.1
7.3	21.2
7.3	21.9
7.5	22.2
7.7	22.0
7.9	22.1
8.1	22.0
8.4	22.2
7.9	20.9
8.8	21.4
9.2	21.2
8.0	23.2
7.7	22.8
7.5	22.9
7.3	23.1
7.2	24.1
7.4	24.0
7.6	24.0
7.8	25.0
7.6	24.6
7.3	24.7
7.4	25.7
7.2	26.0
8.0	25.3
8.3	24.8
8.6	24.1
8.9	24.1
8.6	25.7
8.3	26.9
8.4	26.0
8.0	26.9
8.0	26.0
8.0	27.0
7.8	27.0
7.7	27.0
7.4	27.0
7.7	25.9
7.8	25.9
7.1	27.9
7.3	28.6
6.9	28.8
7.1	30.7
7.1	32.2
10.2	25.4
8.1	27.8
8.1	29.2
8.3	29.1
8.4	29.1
8.9	29.1
8.8	28.2
9.1	27.9
9.3	27.9
9.6	29.2
9.2	29.1
9.0	29.0
8.8	30.5
8.7	30.2
8.3	30.2
8.2	30.9
8.1	31.9
8.0	32.0
7.7	31.7
8.2	33.2
7.8	34.1
9.6	29.1
9.5	30.9
9.6	31.9
9.0	33.0
9.1	34.1
9.0	34.2
8.7	32.6
8.7	33.7
8.6	34.8
8.4	36.2
8.2	37.9
7.7	37.0
8.8	39.1
9.0	36.8
9.2	35.9
9.6	37.8
9.6	38.7
10.2	35.3
10.2	33.9
11.5	38.1
];
data.LN_ur(:,1) = data.LN_ur(:,1)/10; % convert mm to cm
units.LN_ur   = {'cm', '#'};  label.LN_ur = {'body length', 'embryos'};  
temp.LN_ur   = C2K(17);  units.temp.LN_ur = 'K'; label.temp.LN_ur = 'temperature';
bibkey.LN_ur = {'LozoyaDefeo2006'};


%% set weights for all real data
weights = setweights(data, []);
weights.tL = 8 * weights.tL;

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
'pages = {330–340}, ' ...
'volume = {31}, ' ...
'howpublished = {\url{htaps://onlinelibrary.wiley.com/doi/full/10.1111/j.1439-0485.2009.00341.x?}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ThompsonSanchezdeBock2007'; type = 'Article'; bib = [ ...  
'author = {G. A. Thompson and M. Sánchez de Bock}, ' ...
'year = {2007}, ' ...
'title  = {Population dynamics of Excirolana armata (Isopoda: Cirolanidae) in Buenos Aires beaches, Argentina}, ' ...
'journal = {Revista de Biologia Tropical}, ' ...
'pages = {131–140}, ' ...
'volume = {55}, ' ...
'howpublished = {\url{htaps://revistas.ucr.ac.cr/index.php/rbt/article/view/5813}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LozoyaDefeo2006'; type = 'Article'; bib = [ ...  
'author = {Juan Pablo Lozoya and Omar Defeo}, ' ...
'year = {2006}, ' ...
'title  = {Effects of a freshwater canal discharge on an ovoviviparous isopod inhabiting an exposed sandy beach}, ' ...
'journal = {Marine and Freshwater Research}, ' ...
'pages = {421–428}, ' ...
'volume = {57}, ' ...
'howpublished = {\url{https://www.publish.csiro.au/mf/mf05067}}'];
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
