Tabla = {0, 100, 200, 400, 800, 1500, 2600, 4200, 6400, 9300, 13000, 17600, 23200, 29900, 37800, 47000, 57600, 69700, 83400, 98800, 116000, 135100, 156200, 179400, 204800, 232500, 262600, 295200, 330400, 368300, 409000, 452600, 499200, 548900, 601800, 658000, 717600, 780700, 847400, 917800, 992000, 1070100, 1152200, 1238400, 1328800, 1423500, 1522600, 1626200, 1734400, 1847300, 1965000, 2087600, 2215200, 2347900, 2485800, 2629000, 2777600, 2931700, 3091400, 3256800, 3428000, 3605100, 3788200, 3977400, 4172800, 4374500, 4582600, 4797200, 5018400, 5246300, 5481000, 5722600, 5971200, 6226900, 6489800, 6760000, 7037600, 7322700, 7615400, 7915800, 8224000, 8540100, 8864200, 9196400, 9536800, 9885500, 10242600, 10608200, 10982400, 11365300, 11757000, 12157600, 12567200, 12985900, 13413800, 13851000, 14297600, 14753700, 15219400, 15694800, 16180000, 16675100, 17180200, 17695400, 18220800, 18756500, 19302600, 19859200, 20426400, 21004300, 21593000, 22192600, 22803200, 23424900, 24057800, 24702000, 25357600, 26024700, 26703400, 27393800, 28096000, 28810100, 29536200, 30274400, 31024800, 31787500, 32562600, 33350200, 34150400, 34963300, 35789000, 36627600, 37479200, 38343900, 39221800, 40113000, 41017600, 41935700, 42867400, 43812800, 44772000, 45745100, 46732200, 47733400, 48748800, 49778500, 50822600, 51881200, 52954400, 54042300, 55145000, 56262600, 57395200, 58542900, 59705800, 60884000, 62077600, 63286700, 64511400, 65751800, 67008000, 68280100, 69568200, 70872400, 72192800, 73529500, 74882600, 76252200, 77638400, 79041300, 80461000, 81897600, 83351200, 84821900, 86309800, 87815000, 89337600, 90877700, 92435400, 94010800, 95604000, 97215100, 98844200, 100491400, 102156800, 103840500, 105542600, 107263200, 109002400, 110760300, 112537000, 114332600, 116147200, 117980900, 119833800, 121706000, 123597600, 125508700, 127439400, 129389800, 131360000, 133350100, 135360200, 137390400, 139440800, 141511500, 143602600, 145714200, 147846400, 149999300, 152173000, 154367600, 156583200, 158819900, 161077800, 163357000, 165657600, 167979700, 170323400, 172688800, 175076000, 177485100, 179916200, 182369400, 184844800, 187342500, 189862600, 192405200, 194970400, 197558300, 200169000, 202802600, 205459200, 208138900, 210841800, 213568000, 216317600, 219090700, 221887400, 224707800, 227552000, 230420100, 233312200, 236228400, 239168800, 242133500, 245122600, 248136200, 251174400, 254237300, 257325000, 260437600, 263575200, 266737900, 269925800, 273139000, 276377600, 279641700, 282931400, 286246800, 289588000, 292955100, 296348200, 299767400, 303212800, 306684500, 310182600, 313707200, 317258400, 320836300, 324441000, 328072600, 331731200, 335416900, 339129800, 342870000, 346637600, 350432700, 354255400, 358105800, 361984000, 365890100, 369824200, 373786400, 377776800, 381795500, 385842600, 389918200, 394022400, 398155300, 402317000, 406507600, 410727200, 414975900, 419253800, 423561000, 427897600, 432263700, 436659400, 441084800, 445540000, 450025100, 454540200, 459085400, 463660800, 468266500, 472902600, 477569200, 482266400, 486994300, 491753000, 496542600, 501363200, 506214900, 511097800, 516012000, 520957600, 525934700, 530943400, 535983800, 541056000, 546160100, 551296200, 556464400, 561664800, 566897500, 572162600, 577460200, 582790400, 588153300, 593549000, 598977600, 604439200, 609933900, 615461800, 621023000, 626617600, 632245700, 637907400, 643602800, 649332000, 655095100, 660892200, 666723400, 672588800, 678488500, 684422600, 690391200, 696394400, 702432300, 708505000, 714612600, 720755200, 726932900, 733145800, 739394000, 745677600, 751996700, 758351400, 764741800, 771168000, 777630100, 784128200, 790662400, 797232800, 803839500, 810482600, 817162200, 823878400, 830631300, 837421000, 844247600, 851111200, 858011900, 864949800, 871925000, 878937600, 885987700, 893075400, 900200800, 907364000, 914565100, 921804200, 929081400, 936396800, 943750500, 951142600, 958573200, 966042400, 973550300, 981097000, 988682600, 996307200, 1003970900, 1011673800, 1019416000, 1027197600, 1035018700, 1042879400, 1050779800}

function onSay(cid, words, parametro)
	Level = getPlayerLevel(cid) Experience = getPlayerExperience(cid)
	if (parametro == '') then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, 'Te falta ' .. Contar(Tabla[Level + 1] - Experience) .. ' de Exp para el nivel ' .. Level + 1 .. '.')
	end
	P = tonumber(parametro)
	if (not P) then
		doPlayerSendCancel(cid, 'Solo numero.')
	elseif (P > 400) then
		doPlayerSendCancel(cid, 'El limite es 400.')
	elseif (P < Level) then
		doPlayerSendCancel(cid, 'Ya pasastes ese nivel.')
	elseif (P == Level) then
		doPlayerSendCancel(cid, 'Ese es tu nivel actual.')
	elseif (P > Level) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, 'Te falta ' .. Contar(Tabla[P] - Experience) .. ' de Exp para el nivel ' .. P .. '.')
	end
	return TRUE
end

function Contar(A)
	B = 0 C = 0 D = 0
	while (A >= 1000000000) do	A = A - 1000000000	D = D + 1 end
	while (A >= 1000000) do	A = A - 1000000	C = C + 1 end
	while (A >= 1000) do		A = A - 1000	B = B + 1 end

	if (D == 0 and C == 0 and B == 0 and A ~= 0) then		Text = A
	elseif (D == 0 and C == 0 and B ~= 0 and A == 0) then		Text = B .. '.000'
	elseif (D == 0 and C == 0 and B ~= 0 and A < 10) then		Text = B .. '.00' .. A
	elseif (D == 0 and C == 0 and B ~= 0 and A < 100) then		Text = B .. '.0' .. A
	elseif (D == 0 and C == 0 and B ~= 0 and A >= 100) then		Text = B .. '.' .. A
	elseif (D == 0 and C ~= 0 and B == 0 and A == 0) then		Text = C .. '\'000.000'
	elseif (D == 0 and C ~= 0 and B == 0 and A < 10) then		Text = C .. '\'000.00' .. A
	elseif (D == 0 and C ~= 0 and B == 0 and A < 100) then		Text = C .. '\'000.0' .. A
	elseif (D == 0 and C ~= 0 and B == 0 and A >= 100) then		Text = C .. '\'000.' .. A
	elseif (D == 0 and C ~= 0 and B < 10 and A == 0) then		Text = C .. '\'00' .. B .. '.000'
	elseif (D == 0 and C ~= 0 and B < 10 and A < 10) then		Text = C .. '\'00' .. B .. '.00' .. A
	elseif (D == 0 and C ~= 0 and B < 10 and A < 100) then		Text = C .. '\'00' .. B .. '.0' .. A
	elseif (D == 0 and C ~= 0 and B < 10 and A >= 100) then		Text = C .. '\'00' .. B .. '.' .. A
	elseif (D == 0 and C ~= 0 and B < 100 and A == 0) then		Text = C .. '\'0' .. B .. '.000'
	elseif (D == 0 and C ~= 0 and B < 100 and A < 10) then		Text = C .. '\'0' .. B .. '.00' .. A
	elseif (D == 0 and C ~= 0 and B < 100 and A < 100) then		Text = C .. '\'0' .. B .. '.0' .. A
	elseif (D == 0 and C ~= 0 and B < 100 and A >= 100) then	Text = C .. '\'0' .. B .. '.' .. A
	elseif (D == 0 and C ~= 0 and B >= 100 and A == 0) then		Text = C .. '\'' .. B .. '.000'
	elseif (D == 0 and C ~= 0 and B >= 100 and A < 10) then		Text = C .. '\'' .. B .. '.00' .. A
	elseif (D == 0 and C ~= 0 and B >= 100 and A < 100) then	Text = C .. '\'' .. B .. '.0' .. A
	elseif (D == 0 and C ~= 0 and B >= 100 and A >= 100) then	Text = C .. '\'' .. B .. '.' .. A
	elseif (D ~= 0 and C == 0 and B == 0 and A == 0) then		Text = D .. '.000\'000.000'
	elseif (D ~= 0 and C == 0 and B == 0 and A < 10) then		Text = D .. '.000\'000.00' .. A
	elseif (D ~= 0 and C == 0 and B == 0 and A < 100) then		Text = D .. '.000\'000.0' .. A
	elseif (D ~= 0 and C == 0 and B == 0 and A >= 100) then		Text = D .. '.000\'000.' .. A
	elseif (D ~= 0 and C == 0 and B < 10 and A == 0) then		Text = D .. '.000\'00' .. B .. '.000'
	elseif (D ~= 0 and C == 0 and B < 10 and A < 10) then		Text = D .. '.000\'00' .. B .. '.00' .. A
	elseif (D ~= 0 and C == 0 and B < 10 and A < 100) then		Text = D .. '.000\'00' .. B .. '.0' .. A
	elseif (D ~= 0 and C == 0 and B < 10 and A >= 100) then		Text = D .. '.000\'00' .. B .. '.' .. A
	elseif (D ~= 0 and C == 0 and B < 100 and A == 0) then		Text = D .. '.000\'0' .. B .. '.000'
	elseif (D ~= 0 and C == 0 and B < 100 and A < 10) then		Text = D .. '.000\'0' .. B .. '.00' .. A
	elseif (D ~= 0 and C == 0 and B < 100 and A < 100) then		Text = D .. '.000\'0' .. B .. '.0' .. A
	elseif (D ~= 0 and C == 0 and B < 100 and A >= 100) then	Text = D .. '.000\'0' .. B .. '.' .. A
	elseif (D ~= 0 and C == 0 and B >= 100 and A == 0) then		Text = D .. '.000\'' .. B .. '.000'
	elseif (D ~= 0 and C == 0 and B >= 100 and A < 10) then		Text = D .. '.000\'' .. B .. '.00' .. A
	elseif (D ~= 0 and C == 0 and B >= 100 and A < 100) then	Text = D .. '.000\'' .. B .. '.0' .. A
	elseif (D ~= 0 and C == 0 and B >= 100 and A >= 100) then	Text = D .. '.000\'' .. B .. '.' .. A
	elseif (D ~= 0 and C < 10 and B == 0 and A == 0) then		Text = D .. '.00' .. C .. '\'000.000'
	elseif (D ~= 0 and C < 10 and B == 0 and A < 10) then		Text = D .. '.00' .. C .. '\'000.00' .. A
	elseif (D ~= 0 and C < 10 and B == 0 and A < 100) then		Text = D .. '.00' .. C .. '\'000.0' .. A
	elseif (D ~= 0 and C < 10 and B == 0 and A >= 100) then		Text = D .. '.00' .. C .. '\'000.' .. A
	elseif (D ~= 0 and C < 10 and B < 10 and A == 0) then		Text = D .. '.00' .. C .. '\'00' .. B .. '.000'
	elseif (D ~= 0 and C < 10 and B < 10 and A < 10) then		Text = D .. '.00' .. C .. '\'00' .. B .. '.00' .. A
	elseif (D ~= 0 and C < 10 and B < 10 and A < 100) then		Text = D .. '.00' .. C .. '\'00' .. B .. '.0' .. A
	elseif (D ~= 0 and C < 10 and B < 10 and A >= 100) then		Text = D .. '.00' .. C .. '\'00' .. B .. '.' .. A
	elseif (D ~= 0 and C < 10 and B < 100 and A == 0) then		Text = D .. '.00' .. C .. '\'0' .. B .. '.000'
	elseif (D ~= 0 and C < 10 and B < 100 and A < 10) then		Text = D .. '.00' .. C .. '\'0' .. B .. '.00' .. A
	elseif (D ~= 0 and C < 10 and B < 100 and A < 100) then		Text = D .. '.00' .. C .. '\'0' .. B .. '.0' .. A
	elseif (D ~= 0 and C < 10 and B < 100 and A >= 100) then	Text = D .. '.00' .. C .. '\'0' .. B .. '.' .. A
	elseif (D ~= 0 and C < 10 and B >= 100 and A == 0) then		Text = D .. '.00' .. C .. '\'' .. B .. '.000'
	elseif (D ~= 0 and C < 10 and B >= 100 and A < 10) then		Text = D .. '.00' .. C .. '\'' .. B .. '.00' .. A
	elseif (D ~= 0 and C < 10 and B >= 100 and A < 100) then	Text = D .. '.00' .. C .. '\'' .. B .. '.0' .. A
	elseif (D ~= 0 and C < 10 and B >= 100 and A >= 100) then	Text = D .. '.00' .. C .. '\'' .. B .. '.' .. A
	elseif (D ~= 0 and C < 100 and B == 0 and A == 0) then		Text = D .. '.0' .. C .. '\'000.000'
	elseif (D ~= 0 and C < 100 and B == 0 and A < 10) then		Text = D .. '.0' .. C .. '\'000.00' .. A
	elseif (D ~= 0 and C < 100 and B == 0 and A < 100) then		Text = D .. '.0' .. C .. '\'000.0' .. A
	elseif (D ~= 0 and C < 100 and B == 0 and A >= 100) then	Text = D .. '.0' .. C .. '\'000.' .. A
	elseif (D ~= 0 and C < 100 and B < 10 and A == 0) then		Text = D .. '.0' .. C .. '\'00' .. B .. '.000'
	elseif (D ~= 0 and C < 100 and B < 10 and A < 10) then		Text = D .. '.0' .. C .. '\'00' .. B .. '.00' .. A
	elseif (D ~= 0 and C < 100 and B < 10 and A < 100) then		Text = D .. '.0' .. C .. '\'00' .. B .. '.0' .. A
	elseif (D ~= 0 and C < 100 and B < 10 and A >= 100) then	Text = D .. '.0' .. C .. '\'00' .. B .. '.' .. A
	elseif (D ~= 0 and C < 100 and B < 100 and A == 0) then		Text = D .. '.0' .. C .. '\'0' .. B .. '.000'
	elseif (D ~= 0 and C < 100 and B < 100 and A < 10) then		Text = D .. '.0' .. C .. '\'0' .. B .. '.00' .. A
	elseif (D ~= 0 and C < 100 and B < 100 and A < 100) then	Text = D .. '.0' .. C .. '\'0' .. B .. '.0' .. A
	elseif (D ~= 0 and C < 100 and B < 100 and A >= 100) then	Text = D .. '.0' .. C .. '\'0' .. B .. '.' .. A
	elseif (D ~= 0 and C < 100 and B >= 100 and A == 0) then	Text = D .. '.0' .. C .. '\'' .. B .. '.000'
	elseif (D ~= 0 and C < 100 and B >= 100 and A < 10) then	Text = D .. '.0' .. C .. '\'' .. B .. '.00' .. A
	elseif (D ~= 0 and C < 100 and B >= 100 and A < 100) then	Text = D .. '.0' .. C .. '\'' .. B .. '.0' .. A
	elseif (D ~= 0 and C < 100 and B >= 100 and A >= 100) then	Text = D .. '.0' .. C .. '\'' .. B .. '.' .. A
	elseif (D ~= 0 and C >= 100 and B == 0 and A == 0) then		Text = D .. '.' .. C .. '\'000.000'
	elseif (D ~= 0 and C >= 100 and B == 0 and A < 10) then		Text = D .. '.' .. C .. '\'000.00' .. A
	elseif (D ~= 0 and C >= 100 and B == 0 and A < 100) then	Text = D .. '.' .. C .. '\'000.0' .. A
	elseif (D ~= 0 and C >= 100 and B == 0 and A >= 100) then	Text = D .. '.' .. C .. '\'000.' .. A
	elseif (D ~= 0 and C >= 100 and B < 10 and A == 0) then		Text = D .. '.' .. C .. '\'00' .. B .. '.000'
	elseif (D ~= 0 and C >= 100 and B < 10 and A < 10) then		Text = D .. '.' .. C .. '\'00' .. B .. '.00' .. A
	elseif (D ~= 0 and C >= 100 and B < 10 and A < 100) then	Text = D .. '.' .. C .. '\'00' .. B .. '.0' .. A
	elseif (D ~= 0 and C >= 100 and B < 10 and A >= 100) then	Text = D .. '.' .. C .. '\'00' .. B .. '.' .. A
	elseif (D ~= 0 and C >= 100 and B < 100 and A == 0) then	Text = D .. '.' .. C .. '\'0' .. B .. '.000'
	elseif (D ~= 0 and C >= 100 and B < 100 and A < 10) then	Text = D .. '.' .. C .. '\'0' .. B .. '.00' .. A
	elseif (D ~= 0 and C >= 100 and B < 100 and A < 100) then	Text = D .. '.' .. C .. '\'0' .. B .. '.0' .. A
	elseif (D ~= 0 and C >= 100 and B < 100 and A >= 100) then	Text = D .. '.' .. C .. '\'0' .. B .. '.' .. A
	elseif (D ~= 0 and C >= 100 and B >= 100 and A == 0) then	Text = D .. '.' .. C .. '\'' .. B .. '.000'
	elseif (D ~= 0 and C >= 100 and B >= 100 and A < 10) then	Text = D .. '.' .. C .. '\'' .. B .. '.00' .. A
	elseif (D ~= 0 and C >= 100 and B >= 100 and A < 100) then	Text = D .. '.' .. C .. '\'' .. B .. '.0' .. A
	elseif (D ~= 0 and C >= 100 and B >= 100 and A >= 100) then	Text = D .. '.' .. C .. '\'' .. B .. '.' .. A	
	end
	return Text
end